package com.study.stto.service.Impl;

import com.study.stto.config.AppConfig;
import com.study.stto.repository.BoardDAO;
import com.study.stto.repository.MainDAO;
import com.study.stto.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private BoardDAO dao;


}
