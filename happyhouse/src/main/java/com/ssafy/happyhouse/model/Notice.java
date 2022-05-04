package com.ssafy.happyhouse.model;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class Notice {
    private int articleNo;
    private String title;
    private String userId;
    private Timestamp createTime;
    private int views;
    private String text;

    public Notice(String title, String userId, Timestamp createTime, int views, String text) {
        this.title = title;
        this.userId = userId;
        this.createTime = createTime;
        this.views = views;
        this.text = text;
    }

    public Notice() {
    }
}
