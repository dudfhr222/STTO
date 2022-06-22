package com.study.stto.controller;


import com.study.stto.config.AppConfig;
import com.study.stto.dto.GroupDTO;
import com.study.stto.service.MainService;
import com.study.stto.service.MyPageService;
import com.study.stto.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@Controller
public class MyPageController {
    @Autowired
    private AppConfig appConfig;
    @Autowired
    private MyPageService myPageService;

    @GetMapping("/MyPage/profile")
    String profile(){
        return "MyPage/profile";
    }
    @GetMapping("/MyPage/myWork")
    String mywork(){
        return "MyPage/myWork";
    }
    @GetMapping("/MyPage/studyList")
    String study(Model model){
        myPageService = appConfig.myPageService();
        String mem_id = (String) SessionUtil.getSession().getAttribute("mem_id");
        List<GroupDTO> workLists = myPageService.findMyWorks(mem_id, model);
        model.addAttribute("wLists",workLists);
        return "MyPage/studyList";
    }

    @GetMapping("/GroupPage/myGroup")
    String groupPage(){
        return "GroupPage/myGroup";
    }


}
