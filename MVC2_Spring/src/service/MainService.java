package com.study.stto.service;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface MainService {
    List<BoardDTO> findContents(HashMap<String, String> param);

    Optional<MemberDTO> confirmLoginStatus(HashMap<String, String> param);

    BoardDTO findContentInfos(int b_number, Model model);

}
