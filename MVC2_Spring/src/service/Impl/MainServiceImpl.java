package com.study.stto.service.Impl;

import com.study.stto.config.AppConfig;
import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
import com.study.stto.repository.MainDAO;
import com.study.stto.repository.jdbcTemplate.JdbcMainDAO;
import com.study.stto.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private MainDAO dao;

    @Override
    public List<BoardDTO> findContents(HashMap<String, String> param) {
        dao = appConfig.mainDAO();
        List contentList = dao.findContents(param);

        return contentList;
    }

    @Override
    public Optional<MemberDTO> confirmLoginStatus(HashMap<String, String> param) {
        return dao.confirmLoginStatus(param);
    }

    @Override
    public BoardDTO findContentInfos(int b_number, Model model) {
        return dao.findContentInfos(b_number,model);
    }
}
