package com.study.stto.controller;

import com.study.stto.config.AppConfig;
import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
import com.study.stto.service.MainService;
import com.study.stto.util.SessionUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class MainController {
    @Autowired
    private AppConfig appConfig;
    @Autowired
    private MainService mainService;

    @RequestMapping("/")
    String getMainPage(HttpServletRequest req){
        HttpSession session = (HttpSession)req.getSession();
        session.setAttribute("mem_id","testid1");
//        session.setAttribute("mem_name","NAME");

        return "index";
    }

    @RequestMapping("/logIn")
    String login(HttpServletRequest req){
        return "Main/logIn";
    }
    @PostMapping("/Main/logInProcess")
    String logInProcess(HashMap<String, String> param){
        //mem_id, mem_pw
        mainService = appConfig.mainService();
        MemberDTO memberDTO = mainService.confirmLoginStatus(param).get();

        return "Main/Register";
    }

    @RequestMapping("/logOut")
    String logout(HttpSession session){
        session.invalidate();
        return "index";
    }

    @RequestMapping("/Register")
    String register(HttpServletRequest req){
        return "Main/Register";
    }

    @RequestMapping("/MyPage")
    String MyPage(){
        SessionUtil.getSession().getAttribute("member_id");
        return "MyPage/myPage";
    }

    @PostMapping("/Main/RegisterProcess")
    String registerProcess(HashMap<String, String> param){
        return "Main/Register";
    }

    @GetMapping("index")
    String getContentList(@RequestParam HashMap<String, String> param, Model model){
        mainService = appConfig.mainService();
        List<BoardDTO> clist = mainService.findContents(param);
        model.addAttribute("conList", clist); //메인에서 검색한 결과를 화면단에 출력해야함

        return "index";
    }

    @GetMapping("/Board/contentInfo")
    String getContentInfo(int b_number, Model model){
//        System.out.println("b_number = " + b_number);
        mainService = appConfig.mainService();
        BoardDTO bdto = mainService.findContentInfos(b_number,model);
        model.addAttribute("board",bdto);
        return null;
    }

    @RequestMapping("/Board/boardWrite")
    String boardWrite(){
        return "Board/boardWrite";
    }




}
