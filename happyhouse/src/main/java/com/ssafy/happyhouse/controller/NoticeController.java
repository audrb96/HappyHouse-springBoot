package com.ssafy.happyhouse.controller;

import com.ssafy.happyhouse.model.Notice;
import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.service.NoticeService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import io.swagger.models.auth.In;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Map;
import java.util.List;
@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    @GetMapping("/mvNotice")
    private String mvNotice() {
        return "notice";
    }

    @GetMapping("/mvRegist")
    private String mvRegist(){
        return "noticeRegist";
    }

    @PostMapping("/registNotice")
    private String registNotice(@RequestParam Map<String, String> map, HttpSession session,Model model) {
        String title = map.get("title");
        String text = map.get("text");
        User user = (User) session.getAttribute("userinfo");
        System.out.println(title+" " + text);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);

        Notice notice = new Notice(title,user.getID(),timestamp,0,text);
        noticeService.registNotice(notice);
        return "redirect:/notice/mvNotice";
    }

    @GetMapping("/noticeList")
    private @ResponseBody ResponseEntity<?>  getNoticeList() {
        try{
            List<Notice> noticeList = noticeService.listNotice();
            if(noticeList != null && !noticeList.isEmpty()) {
                return new ResponseEntity<>(noticeList,HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/mvResult/{articleNo}")
    private String mvResult(@PathVariable("articleNo") String articleNo,Model model){
        Notice notice = noticeService.getNotice(Integer.parseInt(articleNo));
        model.addAttribute("notice", notice);
        return "noticeResult";
    }

    @GetMapping("/delete/{articleNo}")
    private String deleteNotice(@PathVariable("articleNo") String articleNo) {
        noticeService.deleteNotice(Integer.parseInt(articleNo));
        return "redirect:/notice/mvNotice";
    }

    @GetMapping("/modify/{articleNo}")
    private String modifyNotice(@PathVariable("articleNo") String articleNo, Model model) {
    	Notice notice = noticeService.getNotice(Integer.parseInt(articleNo));
    	model.addAttribute("notice", notice);
        return "noticeModify";
    }
    
    @PostMapping("/modify")
    private String updateNotice(@RequestParam Map<String, String> map, HttpSession session) {
    	String title = map.get("title");
        String text = map.get("text");
        String articleNo = map.get("articleNo");
        User user = (User) session.getAttribute("userinfo");
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
        Notice notice = new Notice(title, user.getID(), timestamp, 0,text);
		notice.setArticleNo(Integer.parseInt(articleNo));
        noticeService.updateNotice(notice);
        return "redirect:/notice/mvNotice";
        
    }
    
}
