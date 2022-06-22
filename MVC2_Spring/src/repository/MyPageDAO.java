package com.study.stto.repository;

import com.study.stto.dto.GroupDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface MyPageDAO {

    List<GroupDTO> findMyWorks(String mem_id);
}
