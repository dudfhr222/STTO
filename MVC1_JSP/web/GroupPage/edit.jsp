<%@page import="DBBean.groupPageDBBean" %>
<%@page import="java.util.*" %>
<%@ page import="DBBean.groupPageDBBean" %>
<%@ page import="Bean.GroupBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>내가 쓴 글</title>
    <!-- 초기화 -->
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        * {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: sans-serif;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
        }
    </style>


    <!-- 헤더 -->
    <style>
        #main_header {
            /* 중앙 정렬 */
            width: 960px;
            margin: 0 auto;
            /* 절대 좌표 */
            height: 160px;
            position: relative;
        }

        #main_header > #title {
            position: absolute;
            left: 20px;
            top: 30px;
        }

        #main_header > #main_lnb {
            position: absolute;
            right: 0;
            bottom: 10px;
        }
    </style>


    <!-- 제목 -->
    <style>
        #title {
        <!--  폰트있었음 -->
        }
    </style>


    <!-- 수정 & 나가기 버튼 -->
    <style>
        #main_lnb > ul {
            overflow: hidden;
        }

        #main_lnb > ul > li {
            float: left;
        }

        #main_lnb > ul > li > a {
            display: block;
            padding: 10px 20px;
            border: 1px solid navy;
        }

        #main_lnb > ul > li > a:hover {
            background: navy;
            color: white;
        }

        #main_lnb > ul > li:first-child > a {
            border-radius: 10px 0 0 10px;
        }

        #main_lnb > ul > li:last-child > a {
            border-radius: 0 10px 10px 0;
        }
    </style>


    <!-- 콘텐츠 -->
    <style>
        #content {
            /* 중앙 정렬 */
            width: 960px;
            margin: 0 auto;
            /* 수평 레이아웃 구성 */
            overflow: hidden;
        }

        #content > #main_section {
            width: 750px;

            float: left;
        }

        #content > #main_aside {
            width: 200px;
            float: right;
        }
    </style>


    <!-- 본문 -->
    <style>
        #main_section > article.main_article {
            margin-bottom: 10px;
            height: 500px;
            padding: 20px;
            border: 2px solid navy;
        }
        .btn_normal {
            position: relative;
            border: none;
            min-width: 80px;
            min-height: 30px;
            background: #ffb72b;
            color: white;
            cursor: pointer;
            font-weight: bold;
            font-family: 'Gowun Dodum', sans-serif;
        }
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
%>
<%
    int gr_mem_gnum = Integer.parseInt(request.getParameter("gr_mem_gnum"));
    int gr_mem_number = Integer.parseInt(request.getParameter("gr_mem_number"));
    String gr_mem_date = request.getParameter("gr_mem_date");
    String gr_mem_name = request.getParameter("gr_mem_name");
    String gr_mem_study = request.getParameter("gr_mem_study");
    int gr_mem_conid = Integer.parseInt(request.getParameter("gr_mem_conid"));

    groupPageDBBean gsrd = groupPageDBBean.getInstance();
    GroupBean gb = new GroupBean();
%>
<%
    gb = gsrd.getRecord(gr_mem_name, gr_mem_conid);
%>
<div class="wrapper">
    <input type="hidden" name="groupmember" value="<%=gr_mem_name%>">
    <input type="hidden" name="content" value="<%=gr_mem_study%>">
    <header id="main_header">
        <div id="title">
            <h1>내가 쓴 글</h1>
            <h2><%=gr_mem_date%></h2>
        </div>
        <nav id="main_lnb">
            <ul>
                <li>
                    <div style="float: right;">
                        <form method="post" name="form">
                            <input type="hidden" name="gr_mem_gnum" value="<%=gr_mem_gnum %>">
                            <input type="hidden" name="gr_mem_number" value="<%=gr_mem_number %>">
                            <input type="hidden" name="gr_mem_name" value="<%=gr_mem_name %>">
                            <input type="hidden" name="gr_mem_date" value="<%=gr_mem_date %>">
                            <input type="hidden" name="gr_mem_study" value="<%=gr_mem_study %>">
                            <input type="hidden" name="gr_mem_conid" value="<%=gr_mem_conid %>">
                            <input class="btn_normal" type="submit" value="수정하기" onclick="javascript: form.action='editProc.jsp';"/>
                        </form>
                    </div>
                </li>
            </ul>
        </nav>
    </header>

    <div id="content">
        <section id="main_section">
            <article class="main_article">
                <p>
                    <%=gr_mem_study %>
                </p>
            </article>
        </section>
    </div>
</div>
</body>
</html>


