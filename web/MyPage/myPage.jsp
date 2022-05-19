<%--
<%@page import="DBBean.BoardDBBean" %>
<%@page import="Bean.BoardBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="DBBean.groupPageDBBean" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String pagefile = request.getParameter("page");
    if (pagefile == null) {
        pagefile = "mainMyPage";
    }
    String mem_id = (String) session.getAttribute("mem_id");
    String mem_name = (String) session.getAttribute("mem_name");
%>
<jsp:useBean id="gb" class="Bean.GroupBean"></jsp:useBean>
<html lang="en">
<head>
    <link rel="stylesheet" href="myFile.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
    </style>
    <title>나의 스터디</title>
</head>
<body>
<%--
    String title = request.getParameter("title");
    String goal = request.getParameter("goal");
    String studyDate = request.getParameter("studyDate");
--%>
<div class="wrapper">
    <div class="content">
        <header id="main_header">
            <div align="center">
                <h1 class="title">나의 스터디</h1>
            </div>
            <nav id="main_gnb">
                <ul>
                    <li>
                        <input class="btn_normal" type="button" value="나가기"
                               onclick="javascript:window.location='../index.jsp'">
                    </li>
                </ul>
            </nav>
        </header>
        <div id="content">
            <div class="main_article">
                <jsp:include page='<%=pagefile+".jsp" %>'></jsp:include>
            </div>

            <aside id="main_aside">
                <ul id="frame">
                    <li class="item">
                        <div class="description">
                            <jsp:include page="info.jsp"></jsp:include>
                        </div>
                    </li>
                    <li class="item">
                        <div class="description">
                            <jsp:include page="profile.jsp"></jsp:include>
                        </div>
                    </li>
                    <li class="item">
                        <div class="description">
                            <jsp:include page="wrote.jsp"></jsp:include>
                        </div>
                    </li>
                    <li class="item">
                        <div class="description">
                            <jsp:include page="work.jsp"></jsp:include>
                        </div>
                    </li>
                </ul>
            </aside>
        </div>
    </div>
</div>
</body>
</html>