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
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        * {
            margin: 5px;
            padding: 5px;
        }

        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }

        .title {
            font-size: 3em;
            color: navy;
            font-weight: bold;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .btn_normal {
            position: relative;
            padding: 10px 10px;
            border-radius: 15px;
            border: none;
            color: #06113c;
            background-color: aliceblue;
            display: inline-block;
            font-family: 'Gowun Dodum', sans-serif;
            text-decoration: none;
            font-weight: 600;
            transition: 0.25s;
        }

        .btn_normal {
            position: relative;
            border: none;
            min-width: 100px;
            min-height: 50px;
            background: #ffb72b;
            border-radius: 1000px;
            color: white;
            cursor: pointer;
            font-weight: bold;
            font-size: medium;
            transition: 0.3s;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .btn_normal:hover {
            transform: scale(1.2);
        }

        .btn_normal:hover::after {
            content: "";
            width: 30px;
            height: 30px;
            border-radius: 100%;
            border: 6px solid #ffb72b;
            position: absolute;
            z-index: -1;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: ring 1.5s infinite;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
        }

        img {
            border: 0;
        }

        #main_header {
            /* 중앙 정렬 */
            width: 960px;
            margin: 0 auto;
            /* 절대 좌표 */
            height: 160px;
            position: relative;
        }

        #main_header>#title {
            position: absolute;
            left: 380px;
            top: 60px;
        }

        #main_header>#main_gnb {
            position: absolute;
            right: 0;
            top: 0;
        }

        #content {
            width: 960px;
            margin: 0 auto;
            overflow: hidden;
        }

        .main_article{
            width: 650px;
            height: 600px;
            float: right;
            margin: 10px;
            overflow: auto;
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid navy;
            border-radius: 15px;
            background-color: smokewhite;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .item {
            overflow: hidden;
            padding: 5px;
            border: 1px solid aliceblue;
            background-color: aliceblue;
            border-radius: 15px;
            margin: 10px;
        }

        .description {
            float: left;
            margin-left: 5px;
            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
        }

        #frame {
            overflow: hidden;
            padding: 5px;
            border: 1px solid navy;
            background-color: navy;
            border-radius: 15px;
            margin: 5px;
        }

    </style>
    <title>나의 스터디</title>
</head>
<body>
<%
    String title = request.getParameter("title");
    String goal = request.getParameter("goal");
    String studyDate = request.getParameter("studyDate");
%>
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