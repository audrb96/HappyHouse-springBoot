package com.ssafy.happyhouse.model;

import lombok.Data;

@Data
public class APT {
	private String aptName;
	private String dealAmount;
	private double area;
	private String date;
	private double lat;
	private double lng;

	public APT(String aptName, String dealAmount, double area, String date, double lat, double lng) {
		this.aptName = aptName;
		this.dealAmount = dealAmount;
		this.area = area;
		this.date = date;
		this.lat = lat;
		this.lng = lng;
	}

	public APT() {
	}
}
