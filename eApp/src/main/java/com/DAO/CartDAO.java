package com.DAO;
import java.util.*;
import com.entity.Cart;
import com.entity.*;
public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId );
	
	public boolean deleteBook(int bid,int uid,int cid);
	
	
}
