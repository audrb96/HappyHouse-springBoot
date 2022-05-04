package com.ssafy.happyhouse.repo;

import com.ssafy.happyhouse.model.Notice;
import java.util.List;

public interface NoticeRepo {
    Notice getNotice(int articleNo);
    List<Notice> listNotice();
    void updateNotice(Notice notice);
    void deleteNotice(int articleNo);
    void registNotice(Notice notice);
}
