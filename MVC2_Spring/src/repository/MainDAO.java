package com.study.stto.repository;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface MainDAO {

    List<BoardDTO> findContents(HashMap<String, String> param);

    Optional<MemberDTO> confirmLoginStatus(HashMap<String, String> param);

    BoardDTO findContentInfos(int b_number, Model model);

}
