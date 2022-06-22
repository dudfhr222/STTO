package com.study.stto.service.Impl;

import com.study.stto.config.AppConfig;
import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.GroupDTO;
import com.study.stto.dto.MemberDTO;
import com.study.stto.repository.MainDAO;
import com.study.stto.repository.MyPageDAO;
import com.study.stto.service.MainService;
import com.study.stto.service.MyPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private MyPageDAO dao;

    @Override
    public List<GroupDTO> findMyWorks(String mem_id, Model model) {
        dao = appConfig.myPageDAO();
        return dao.findMyWorks(mem_id);
    }
}
