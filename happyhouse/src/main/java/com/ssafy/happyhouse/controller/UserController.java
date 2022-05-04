package com.ssafy.happyhouse.controller;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * Servlet implementation class UserController
 */
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController  {

	private final UserService userService;

	@GetMapping("/deleteUser")
	private String doDeleteid(HttpSession session) {
		User user = (User)session.getAttribute("userinfo");
		userService.DeleteId(user.getID());
		session.invalidate();

		return "index";
	}

	@PostMapping("/modify")
	private String doModify(User user, HttpSession session) {
		User tempUser = (User)session.getAttribute("userinfo");
		user.setID(tempUser.getID());
		userService.Modify(user);
		session.setAttribute("userinfo", user);
		return "userinfo";
	}
	@PostMapping("/pwFind")
	private String doPwFind(@RequestParam Map<String, String> map, Model model) {
		String id = map.get("ID");
		String name = map.get("username");
		String tel  = map.get("phone");
		User user = userService.select(id);
		System.out.println(user);
		if(user != null) {
			if(name.equals(user.getUsername()) && tel.equals(user.getPhone())) {
				model.addAttribute("FindedPw",user.getPassword());
			}
		}
		else {
			model.addAttribute("FindedPw", "정보가 일치하지 않습니다." );
		}
		return "pwFind";
		
	}
	@PostMapping("/join")
	private String doJoin(User user, Model model) {
		Long datetime = System.currentTimeMillis();
		Timestamp timestamp = new Timestamp(datetime);

		user.setCreate_time(timestamp);
		if(userService.join(user) ==1 ) {
			return "index";
		} else {
			model.addAttribute("msg","이미 존재하는 아이디입니다. ");
			return "signUp";
		}
	}

	@GetMapping("/mvModify")
	private String mvModify(){
		return "modify";
	}

	@GetMapping("/mvPwFind")
	private String mvPwFind(){
		return "pwFind";
	}

	@GetMapping("/mvUserinfo")
	private String mvUserinfo(){
		return "userinfo";
	}
	@GetMapping("/mvSignUp")
	private String mvSignUp(){
		return "signUp";
	}

	@GetMapping("/logout")
	private String doLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@PostMapping("/login")
	private String doLogin(@RequestParam Map<String ,String> map , Model model, HttpSession session)  {
		try {
			String id = map.get("ID");
			String pw = map.get("password");
			User user = userService.select(id);

			if(user!=null ) {
				if(pw.equals(user.getPassword())) {
					session.setAttribute("userinfo", user);
				} else {
					model.addAttribute("msg", "아이디 또는 비밀번호가 잘못 되었습니다.");
				}
			}
		} catch(Exception e) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못 되었습니다.");
		}
		return "index";
	}

}
