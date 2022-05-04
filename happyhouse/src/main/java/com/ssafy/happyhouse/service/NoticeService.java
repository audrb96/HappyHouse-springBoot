package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.model.Notice;
import com.ssafy.happyhouse.repo.NoticeRepo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface NoticeService {

    Notice getNotice(int Num);
    List<Notice> listNotice();
    void updateNotice(Notice notice);
    void deleteNotice(int articleNo);
    void registNotice(Notice notice);
}
