package com.study.stto.repository.jdbcTemplate;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
import com.study.stto.repository.BoardDAO;
import com.study.stto.repository.MainDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Slf4j
public class JdbcBoardDAO implements BoardDAO {
    private final NamedParameterJdbcTemplate template;

    public JdbcBoardDAO(DataSource dataSource) {
        this.template = new NamedParameterJdbcTemplate(dataSource);
    }

    private RowMapper<BoardDTO> BoardRowMapper() {
        return BeanPropertyRowMapper.newInstance(BoardDTO.class); //camel 변환 지원
    }
    private RowMapper<MemberDTO> MemberRowMapper(){
        return BeanPropertyRowMapper.newInstance(MemberDTO.class);
    }




}
