package com.study.stto.repository.jdbcTemplate;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.MemberDTO;
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
public class JdbcMainDAO implements MainDAO {
    private final NamedParameterJdbcTemplate template;

    public JdbcMainDAO(DataSource dataSource) {
        this.template = new NamedParameterJdbcTemplate(dataSource);
    }

    private RowMapper<BoardDTO> BoardRowMapper() {
        return BeanPropertyRowMapper.newInstance(BoardDTO.class); //camel 변환 지원
    }
    private RowMapper<MemberDTO> MemberRowMapper(){
        return BeanPropertyRowMapper.newInstance(MemberDTO.class);
    }
    @Override
    public List<BoardDTO> findContents(HashMap<String, String> param){
        String area = param.get("b_area");
        String part = param.get("b_inter_s");
        String language = param.get("b_inter_c");

        String sql ="select * from boards where b_status != b_stmember";
        //동적 쿼리
        if((StringUtils.hasText(area)&& !area.equals("지역")) && (StringUtils.hasText(part) && !part.equals("개발분야")) && (StringUtils.hasText(language) && !language.equals("언어"))){
            sql += " and b_area='"+area+"' and b_language='"+language+"' and b_inter_ch='"+part+"' order by b_group asc";
        }else if(area.equals("지역") && part.equals("개발분야") && language.equals("언어")){
            sql = "select * from boards where b_status != b_stmember order by b_group asc";
        }
        log.info("sql={}",sql);
        return template.query(sql,BoardRowMapper());
    }

    @Override
    public Optional<MemberDTO> confirmLoginStatus(HashMap<String, String> param) {
        String sql = "select * from stmembers where mem_id=:mem_id";
        try {
            Map<String, Object> id = Map.of("mem_id",param.get("mem_id"));
            MemberDTO memberDTO = template.queryForObject(sql, id, MemberRowMapper());
            log.info("sql={}",sql);
            return Optional.of(memberDTO);
        }catch (EmptyResultDataAccessException e){
            log.info("sql={}",sql);
            return Optional.empty();
        }
    }

    @Override
    public BoardDTO findContentInfos(int b_number, Model model) {
        String sql = "select * from boards where b_number = :b_number";
        MapSqlParameterSource param = new MapSqlParameterSource()
                .addValue("b_number",b_number);
        log.info("sql={}",sql);
        return template.queryForObject(sql,param,BoardRowMapper());
    }
}
