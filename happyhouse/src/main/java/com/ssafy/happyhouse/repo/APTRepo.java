package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.model.APT;
import com.ssafy.happyhouse.model.BaseAddress;

public interface APTRepo {
	List<APT> selectAll(String dong);

	BaseAddress dongLocation(String dong);
}
