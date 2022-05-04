package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.model.User;

import java.util.NoSuchElementException;


public interface UserService {
	User select(String id) throws NoSuchElementException;
	int join(User user);
	void Modify(User user);
	void DeleteId(String id);
}
