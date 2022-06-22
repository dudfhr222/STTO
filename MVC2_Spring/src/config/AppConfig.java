package com.study.stto.config;

import com.study.stto.repository.jdbcTemplate.JdbcBoardDAO;
import com.study.stto.repository.jdbcTemplate.JdbcMainDAO;
import com.study.stto.repository.jdbcTemplate.JdbcMyPageDAO;
import com.study.stto.service.BoardService;
import com.study.stto.service.Impl.BoardServiceImpl;
import com.study.stto.service.Impl.MainServiceImpl;
import com.study.stto.service.Impl.MyPageServiceImpl;
import com.study.stto.service.MainService;
import com.study.stto.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@RequiredArgsConstructor
public class AppConfig {
    private final DataSource dataSource;

    @Bean
    public JdbcMainDAO mainDAO(){
        return new JdbcMainDAO(dataSource);
    }
    @Bean
    public JdbcMyPageDAO myPageDAO(){
        return new JdbcMyPageDAO(dataSource);
    }
    @Bean
    public JdbcBoardDAO boardDAO(){
        return new JdbcBoardDAO(dataSource);
    }
    @Bean
    public MainService mainService(){
        return new MainServiceImpl();
    }
    @Bean
    public MyPageService myPageService(){
        return new MyPageServiceImpl();
    }

    @Bean
    public BoardService boardService(){
        return new BoardServiceImpl();
    }
}
