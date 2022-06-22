package com.study.stto.dto;

import lombok.Data;

@Data
public class GroupDTO {
    private int gr_mem_gnum; //그룹 번호
    private String mem_id; //아이디
    private int gr_mem_number; //그룹 회원 번호 - pnum
    private String gr_mem_name; //이름
    private String mem_email; //이메일
    private String group_goal; //스터디 목표
    private String group_studydate; //스터디 남은 기간
    private String group_startdate; //스터디 시작 일자
    private String group_finishdate; //스터디 목표 일자
    private String group_interests; //관심 분야
    private int group_report; //신고 누적 횟수
    private int group_like; //좋아요 받은 횟수
    private String group_date; //오늘 날짜
    private String group_introduce; //자기 소개
    private String gr_mem_study; //공부 기록
    private int gr_mem_conid; //공부 기록 번호
    private String gr_mem_date; //오늘 날짜
    private int gr_check; //유효성 검사(1일 1작성)
    private int acc_num;
}
