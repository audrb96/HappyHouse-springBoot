package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.repo.UserRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	private final UserRepo userRepo;
	
	@Override
	public User select(String id) throws NoSuchElementException {
		return userRepo.select(id);
	}

	@Override
	public int join(User user) {
		try{
			userRepo.join(user);
			return 1;
		} catch (Exception e){
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public void Modify(User user) {
		try {
			userRepo.update(user);
		} catch (Exception e){
			System.out.println(e.getMessage());
		}
	}

	@Override
	public void DeleteId(String id) {
		userRepo.delete(id);
	}
	
	
	
}
