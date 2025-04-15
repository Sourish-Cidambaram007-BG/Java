package com.DAO;
import com.entity.*;
public interface UserDAO {
	public boolean userRegistration(User us);
	public User login(String email,String password);
	public boolean checkPassword(int id,String ps);
	public boolean updateProfile(User us);
}
