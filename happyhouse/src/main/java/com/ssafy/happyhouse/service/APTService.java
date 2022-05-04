package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.APT;
import com.ssafy.happyhouse.model.BaseAddress;

public interface APTService {
	List<APT> search(String dong);
	BaseAddress dongLocation(String dong);
}
