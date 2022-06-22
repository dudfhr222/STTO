package com.study.stto.service;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.GroupDTO;
import com.study.stto.dto.MemberDTO;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

public interface MyPageService {
    List<GroupDTO> findMyWorks(String mem_id, Model model);

}
