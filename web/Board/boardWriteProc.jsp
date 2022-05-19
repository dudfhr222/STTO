<%@page import="DBBean.BoardDBBean"%>
<%@ page import="DBBean.BoardDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="Bean.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String mem_id = (String)session.getAttribute("mem_id"); // (세션)로그인한 회원 아이디
	String mem_name = (String)session.getAttribute("mem_name"); // (세션)로그인한 회원 이름

	String b_id = request.getParameter("b_id"); // 작성자 아이디
	String b_title = request.getParameter("b_title"); // 작성글 제목
	String b_goal = request.getParameter("b_goal"); // 작성글 목표
	int b_stmember = Integer.parseInt(request.getParameter("b_stmember")); // 모집 인원
	String b_inter_c = request.getParameter("b_inter_c"); // 분야
	String area = request.getParameter("area"); // 지역
	String languages = request.getParameter("languages"); // 언 어
	String b_startdate = request.getParameter("b_startdate"); // 시작 날짜
	String b_finishdate = request.getParameter("b_finishdate"); // 종료 날짜
	String b_content = request.getParameter("b_content"); // 작성글 내용
%>
<%
	BoardDBBean db = BoardDBBean.getInstance();
%>

<%	//BoardDBBean.insertBoard
	if(db.insertBoard(board) == 1){
		response.sendRedirect("../index.jsp");
	}else { 
		response.sendRedirect("boardWrite.jsp");
	}
%>