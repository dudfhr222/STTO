package com.study.stto.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private String mem_name; //회원 이름

    private int mem_num; //회원 번호
    private String mem_id; //회원 아이디

    private String mem_pw; //회원 비밀번호
    private String mem_jumin; //회원 주민번호
    private String mem_tel; //회원 전화번호

    private String mem_email; //회원 이메일
    private String mem_interests; //회원 관심분야
    private String mem_introduce; //회원 자기소개

    private int mem_report; //회원 신고 누적 횟수
}
