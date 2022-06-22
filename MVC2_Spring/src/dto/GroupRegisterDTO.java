package com.study.stto.dto;

import lombok.Data;

@Data
public class GroupRegisterDTO {
    private String mem_name; //신청자 이름
    private String mem_id; //신청자 아이디
    private String b_title; //신청 글 제목

    private String b_id; //글 작성자 아이디
    private int b_gmember; //개인 번호
    private int b_group; //작성글 번호

}
