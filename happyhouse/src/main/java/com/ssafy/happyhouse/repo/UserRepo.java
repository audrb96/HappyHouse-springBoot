package com.ssafy.happyhouse.repo;

import com.ssafy.happyhouse.model.User;

import java.util.List;
import java.util.NoSuchElementException;

public interface UserRepo {
	
	void join(User user);
	void update(User user)throws NoSuchElementException;
	void delete(String id) throws NoSuchElementException;
	User select(String id)throws NoSuchElementException;
	List<User> selectAll();

}
