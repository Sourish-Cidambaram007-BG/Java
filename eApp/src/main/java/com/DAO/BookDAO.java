package com.DAO;
import com.entity.BookDtls;
import java.util.*;

public interface BookDAO {
    boolean addBooks(BookDtls b);
    
    public List<BookDtls> getAllBooks();
    
    public BookDtls getBookById(int id);
    
    public boolean updateEditBooks(BookDtls b);
    
    public boolean deleteBooks(int id);
    
    public List<BookDtls> getNewBook();
    
    public List<BookDtls> getRecentBook();
    
    public List<BookDtls> getOldBook();
    
    public List<BookDtls> getAllRecentBook();
    
    public List<BookDtls> getAllNewBook();
    
    public List<BookDtls> getAllOldBook();
    
    public List<BookDtls> getBookByOld(String email,String cate);
    
    public boolean oldBookDelete(int bid);
    
    public List<BookDtls> getBookBySearch(String ch);
}
