package com.ssafy.happyhouse.controller;

import java.util.List;
import javax.servlet.http.HttpServlet;

import com.ssafy.happyhouse.model.APT;
import com.ssafy.happyhouse.model.BaseAddress;
import com.ssafy.happyhouse.service.APTService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/apt")
@RequiredArgsConstructor
@Controller
public class APTController extends HttpServlet {

	private final APTService aptService;

	@GetMapping("/search/{dong}")
	private String doSearch(@PathVariable("dong") String dong,Model model) {

		BaseAddress baseAddress = aptService.dongLocation(dong);
		List<APT> aptList = aptService.search(dong);
		model.addAttribute("aptlist", aptList);
		model.addAttribute("donglat", baseAddress.getLat());
		model.addAttribute("donglng", baseAddress.getLng());

		return "index";
		
	}

}
