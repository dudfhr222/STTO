package com.study.stto.repository.jdbcTemplate;

import com.study.stto.dto.BoardDTO;
import com.study.stto.dto.GroupDTO;
import com.study.stto.dto.MemberDTO;
import com.study.stto.repository.MainDAO;
import com.study.stto.repository.MyPageDAO;
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
public class JdbcMyPageDAO implements MyPageDAO {
    private final NamedParameterJdbcTemplate template;

    public JdbcMyPageDAO(DataSource dataSource) {
        this.template = new NamedParameterJdbcTemplate(dataSource);
    }

    private RowMapper<GroupDTO> GroupRowMapper() {
        return BeanPropertyRowMapper.newInstance(GroupDTO.class);
    }

    private RowMapper<MemberDTO> MemberRowMapper(){
        return BeanPropertyRowMapper.newInstance(MemberDTO.class);
    }

    @Override
    public List<GroupDTO> findMyWorks(String mem_id) {
        String sql = "select gr_mem_gnum, group_goal, group_startdate, group_finishdate, group_interests, group_introduce from groupmemberboard where mem_id = :mem_id";
        MapSqlParameterSource param = new MapSqlParameterSource()
                .addValue("mem_id",mem_id);
        log.info("sql={}",sql);
        return template.query(sql,param,GroupRowMapper());
    }

//    @Override
//    public BoardDTO findContentInfos(int b_number, Model model) {
//        String sql = "select * from boards where b_number = :b_number";
//        MapSqlParameterSource param = new MapSqlParameterSource()
//                .addValue("b_number",b_number);
//        log.info("sql={}",sql);
//        return template.queryForObject(sql,param,BoardRowMapper());
//    }
//
//    @Override
//    public Optional<MemberDTO> confirmLoginStatus(HashMap<String, String> param) {
//        String sql = "select * from stmembers where mem_id=:mem_id";
//        try {
//            Map<String, Object> id = Map.of("mem_id",param.get("mem_id"));
//            MemberDTO memberDTO = template.queryForObject(sql, id, MemberRowMapper());
//            log.info("sql={}",sql);
//            return Optional.of(memberDTO);
//        }catch (EmptyResultDataAccessException e){
//            log.info("sql={}",sql);
//            return Optional.empty();
//        }
//    }
//
//
}
