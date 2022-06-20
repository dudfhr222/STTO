<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>기록하기</title>
    <link href="style/input.css" rel="stylesheet">
    <style>
        .wrap {
            width: 100%;
            text-align: center;
            visibility: visible;
        }

        .in {
            display: block;
            margin: auto;
        }

        #main_header{
            font-family: 'Gowun Dodum', sans-serif;
            font-size: 2em;
            color: navy;
            font-weight: bold;
            display: block;
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
        .txt {
            border: 3px solid navy;
            border-radius: 30px;
            width: 1000px;
            display: grid;
            place-items: center;
            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
            margin-bottom: 20px;
            padding: 20px;
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

        #content{padding: 10px; margin: 10px;}
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    Calendar cal = Calendar.getInstance();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMdd");
%>

<%
    int gr_mem_gnum = Integer.parseInt(request.getParameter("gr_mem_gnum"));
    int gr_mem_number = Integer.parseInt(request.getParameter("gr_mem_number"));
    String gr_mem_name = request.getParameter("gr_mem_name");

    String gr_mem_date = sdf.format(cal.getTime());
%>
<header id="main_header">
    <div id="title">
        <h1 align="center">기록하기</h1>
    </div>
</header>
<div id="content">
    <section id="main_section">
        <article class="main_article">
            <form action=inputProc.jsp method="post">
                <div class="wrap">
                    <div class="in" align="center">
                        <input type="hidden" value="<%=gr_mem_gnum%>" name="gr_mem_gnum">
                        <input type="hidden" value="<%=gr_mem_number%>" name="gr_mem_number">
                        <input type="hidden" value="<%=gr_mem_date%>" name="gr_mem_date">
                        <input type="hidden" value="<%=gr_mem_name%>" name="gr_mem_name">
                        <textarea class="txt" cols='100' rows='20' name='gr_mem_study'
                                  style="margin-bottom: 20px;"></textarea>
                        <div>
                            <input class="btn_normal" type="submit" value="기록하기">
                            <input class="btn_normal" onclick="javascript:window.location='groupPage.jsp?gr_mem_gnum=<%=gr_mem_gnum%>'" type="button"
                                   value="그룹 페이지">
                        </div>
                    </div>
                </div>
            </form>
        </article>
    </section>
</div>
</body>
</html>