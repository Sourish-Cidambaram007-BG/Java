package com.DAO;


import com.DB.DBConnect;
import com.entity.BookDtls;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO {
    
    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // ✅ Add a new book
    @Override
    public boolean addBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_dtls (bookname, author, price, bookCategory, status, photo_name, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getBookCategory());
            ps.setString(5, b.getStatus());
            ps.setString(6, b.getPhotoName());
            ps.setString(7, b.getEmail());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // ✅ Get all books
    @Override
    public List<BookDtls> getAllBooks() {
        List<BookDtls> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM book_dtls";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BookDtls b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo_name"));
                b.setEmail(rs.getString("email"));
                list.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // ✅ Get book by ID (Fixing Compilation Error)
    @Override
    public BookDtls getBookById(int id) {
        BookDtls book = null;
        try {
            String sql = "SELECT * FROM book_dtls WHERE bookId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                book = new BookDtls();
                book.setBookId(rs.getInt("bookId"));
                book.setBookName(rs.getString("bookname"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getString("price"));
                book.setBookCategory(rs.getString("bookCategory"));
                book.setStatus(rs.getString("status"));
                book.setPhotoName(rs.getString("photo_name"));
                book.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return book;
    }

    // ✅ Update book details
    @Override
    public boolean updateEditBooks(BookDtls b) {
        boolean f = false;
        try {
            Connection conn = DBConnect.getConn();
            String sql = "UPDATE book_dtls SET bookname=?, author=?, price=?, status=?, photo_name=? WHERE bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuthor());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setString(5, b.getPhotoName()); // ✅ Keep old image if no new one is provided
            ps.setInt(6, b.getBookId());

            System.out.println("Executing query: " + ps.toString());

            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
                System.out.println("✅ Book Updated Successfully!");
            } else {
                System.out.println("❌ Book update failed! No rows affected.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

	@Override
	public boolean deleteBooks(int id) {
		boolean f =false;
		try {
			String sql = "delete from book_dtls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory = ? and status = ? order by  bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i <=4) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo_name"));
                b.setEmail(rs.getString("email"));
                list.add(b);
                i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where status = ? order by  bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i <=4) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo_name"));
                b.setEmail(rs.getString("email"));
                list.add(b);
                i++;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getOldBook() {
	    List<BookDtls> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM book_dtls WHERE bookCategory = ? AND status = ? ORDER BY bookId DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, "Old");
	        ps.setString(2, "Active");  // ✅ Now it's correct
	        ResultSet rs = ps.executeQuery();
	        int i = 1;
	        while (rs.next() && i <= 4) { // Fetching only 4 books
	            BookDtls b = new BookDtls();
	            b.setBookId(rs.getInt("bookId"));
	            b.setBookName(rs.getString("bookname"));
	            b.setAuthor(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setBookCategory(rs.getString("bookCategory"));
	            b.setStatus(rs.getString("status"));
	            b.setPhotoName(rs.getString("photo_name"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
	            i++;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory = ? and status = ? order by  bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo_name"));
                b.setEmail(rs.getString("email"));
                list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where status = ? order by  bookId DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,"Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt("bookId"));
                b.setBookName(rs.getString("bookname"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getString("price"));
                b.setBookCategory(rs.getString("bookCategory"));
                b.setStatus(rs.getString("status"));
                b.setPhotoName(rs.getString("photo_name"));
                b.setEmail(rs.getString("email"));
                list.add(b);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() {
	    List<BookDtls> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM book_dtls WHERE bookCategory = ? AND status = ? ORDER BY bookId DESC";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, "Old");
	        ps.setString(2, "Active");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            BookDtls b = new BookDtls();
	            b.setBookId(rs.getInt("bookId"));
	            b.setBookName(rs.getString("bookname"));
	            b.setAuthor(rs.getString("author"));
	            b.setPrice(rs.getString("price"));
	            b.setBookCategory(rs.getString("bookCategory"));
	            b.setStatus(rs.getString("status"));
	            b.setPhotoName(rs.getString("photo_name"));
	            b.setEmail(rs.getString("email"));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String email, String cate) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {
			String sql = "select * from book_dtls where bookCategory = ? and email = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean oldBookDelete(int bookId) {
	    boolean f = false;
	    try {
	        Connection conn = DBConnect.getConn();
	        String sql = "DELETE FROM book_dtls WHERE bookId=? AND bookCategory='Old'";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, bookId);

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // Print the error in logs
	    }
	    return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
	    List<BookDtls> list = new ArrayList<>();
	    BookDtls b = null;
	    try {
	        // Ensure only active books are retrieved
	        String sql = "SELECT * FROM book_dtls WHERE (bookname LIKE ? OR author LIKE ? OR bookCategory LIKE ?) AND status = 'Active'";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        ps.setString(1, "%" + ch + "%");
	        ps.setString(2, "%" + ch + "%");
	        ps.setString(3, "%" + ch + "%");

	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            b = new BookDtls();
	            b.setBookId(rs.getInt(1));
	            b.setBookName(rs.getString(2));
	            b.setAuthor(rs.getString(3));
	            b.setPrice(rs.getString(4));
	            b.setBookCategory(rs.getString(5));
	            b.setStatus(rs.getString(6));
	            b.setPhotoName(rs.getString(7));
	            b.setEmail(rs.getString(8));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	}


