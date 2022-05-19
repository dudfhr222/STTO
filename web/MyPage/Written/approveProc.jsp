<%@page import="Bean.GroupRegisterBean" %>
<%@page import="Bean.RegisterBean" %>
<%@page import="DBBean.RegisterDBBean" %>
<%@page import="Bean.BoardBean" %>
<%@page import="Bean.MemberBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="dtb" class="Bean.RegisterBean"/>
<jsp:setProperty name="dtb" property="*"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
%>
<%
    String mem_id = request.getParameter("mem_id"); //신청자 아이디
    String mem_name = request.getParameter("mem_name"); //신청자 이름
    int b_group = Integer.parseInt(request.getParameter("b_group")); //해당 글 번호
    String b_id = request.getParameter("b_id"); //작성자
    int b_status = Integer.parseInt(request.getParameter("b_status")); //현재 인원
    int b_stmember = Integer.parseInt(request.getParameter("b_stmember")); //모집 정원
%>

<% //승인 로직 처리하는 dbbean
    RegisterDBBean rdb = RegisterDBBean.getInstance();

    int upd = rdb.updateStatus(b_group, b_id, b_stmember, b_status); //해당 스터디 현재 모집인원 +1
    int gr_mem_number = rdb.numTemp(b_group); //개인 번호 부여
    int upToTemp = rdb.memTemp(gr_mem_number, b_group, mem_id, b_id);
    if (upToTemp == 1) {
%>
<script>
    alert("등록완료");
    location.href = '../myPage.jsp/iWrote';
</script>
<%
} else {
%>
<script>
    alert("?");
</script>
<%
    }
%>
<%
    if (gr_mem_number == b_stmember) {
        int check = rdb.upToGroupMemberBoard(b_group); //groupmemberboard로 인원들 이동
        int del = rdb.goodByeFellows(b_group);    //memtemp에 저장됐던 해당 글 번호의 데이터 삭제
        if (del * check == 1) {
%>
<script>
    alert("등록완료");
    location.href = 'myContent.jsp';
</script>
<%
        }
    }
%>
</body>
</html>