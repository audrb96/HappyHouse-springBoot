package com.ssafy.happyhouse.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class User {
	private String ID;
	private String password;
	private String username;
	private String phone;
	private Timestamp create_time;
	private String email;


	public User(String ID, String password, String username, String phone, Timestamp create_time, String email) {
		this.ID = ID;
		this.password = password;
		this.username = username;
		this.phone = phone;
		this.create_time = create_time;
		this.email = email;
	}

	public User() {
	}
}
