package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.model.APT;
import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.repo.APTRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class APTServiceImpl implements APTService {

	private final APTRepo aptRepo;
	
	@Override
	public List<APT> search(String dong) {
		return aptRepo.selectAll(dong);
	}

	@Override
	public BaseAddress dongLocation(String dong) {
		return aptRepo.dongLocation(dong);
	}

}
