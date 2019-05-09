package com.test.dao;

import java.util.List;

 

import com.test.entity.User;
 
public interface UserDao {
	public User login(String user_name,String user_password);
	public void register(User user);
	public void revise(User user);
	public List<User> doc();
}
