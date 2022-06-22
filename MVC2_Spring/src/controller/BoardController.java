package com.study.stto.controller;

import com.study.stto.config.AppConfig;
import com.study.stto.service.BoardService;
import com.study.stto.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;

@Controller
public class BoardController {

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private BoardService boardService;

    @PostMapping( "/register")
    String regProc(){
        boardService = appConfig.boardService();

        return "index";
    }

    @RequestMapping("/writeProc")
    String wriProc(HashMap<String, String> param){
        boardService = appConfig.boardService();

        System.out.println(param);

        return "index";
    }

}
