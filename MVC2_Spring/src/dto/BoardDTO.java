package com.study.stto.dto;

import lombok.Data;

@Data
public class BoardDTO {
    private int b_number; //작성글 번호
    private String b_id; //작성자 아이디
    private String b_title; //작성글 제목
    private String b_content; //글 내용
    private int b_dday; //남은 날짜
    private String b_startdate; //시작 날짜
    private String b_finishdate; //종료 날짜
    private int stmembers_mem_num;
    private int b_stmember; //
    private String interests; //관심 분야

    private String b_inter_ch; //
    private String b_language; //관심 언어
    private String b_area; //관심 지역

    private String b_goal; //목표
    private int b_status; //현재 인원
    private int b_group; //
    private int b_gmember = 0;
}
