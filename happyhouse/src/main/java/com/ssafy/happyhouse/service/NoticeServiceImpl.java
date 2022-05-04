package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.model.Notice;
import com.ssafy.happyhouse.repo.NoticeRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

    private final NoticeRepo noticeRepo;

    @Override
    public Notice getNotice(int Num) {
        return noticeRepo.getNotice(Num);
    }

    @Override
    public List<Notice> listNotice() {
        return noticeRepo.listNotice();
    }

    @Override
    public void updateNotice(Notice notice) {

        System.out.println("service");
        noticeRepo.updateNotice(notice);
    }

    @Override
    public void deleteNotice(int articleNo) {
        noticeRepo.deleteNotice(articleNo);
    }

    @Override
    public void registNotice(Notice notice) {
        noticeRepo.registNotice(notice);
    }
}
