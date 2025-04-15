package com.DAO;
import com.entity.*;
import java.sql.*;
public class UserDAOImpl implements UserDAO {
	private Connection conn;
	public UserDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}
	public boolean userRegistration(User us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			int i = ps.executeUpdate();
			if(i == 1) {
				f = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User login(String email,String password) {
		User us = null;
		try {
			String sql = "select * from user where email=? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us =  new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}
	@Override
	public boolean checkPassword(int id, String ps) {
	    boolean f = false;
	    try {
	        String sql = "SELECT * FROM user WHERE id = ? AND password = ?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, id);
	        pst.setString(2, ps);  // ✅ Fix index here (was 1, should be 2)
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}

	@Override
	public boolean updateProfile(User us) {
	    boolean f = false;
	    try {
	        String sql = "UPDATE user SET name=?, email=?, phno=? WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPhno());  // ✅ Corrected
	        ps.setInt(4, us.getId());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}


	
	
}
