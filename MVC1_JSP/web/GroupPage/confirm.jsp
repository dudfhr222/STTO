<%@page import="Bean.GroupBean" %>
<%@page import="DBBean.groupPageDBBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@ page import="DBBean.groupPageDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>확인 하기</title>
    <meta charset="UTF-8">
    <link href="style/confirm.css" rel="stylesheet">
    <style>
        * {
            margin: 5px;
            padding: 5px;
            margin : auto;
        }

        li {
            list-style: none;
        }

        body {
            width: 1200px
        }

        a {
            text-decoration: none;
        }

        .wrapper {
            border: 3px solid navy;
            border-radius: 30px;
            width: 1000px;
            display: grid;
            place-items: center;
            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .title {
            color: navy;
            font-family: 'Signika Negative', sans-serif;
            font-size: 2em;
            font-weight: bold;
            text-align: center;
        }
        .confirm_wrap {
            width: 480px;
            text-align: center;
            border: 3px solid navy;
            font-weight: bold;
            overflow: hidden;
            margin-bottom : 5px;
        }

        .confirm_wrap_name {
            width: 480px;
            text-align: center;
            border: 3px solid navy;
            font-weight: bold;
            overflow: hidden;
            float : left;
            margin-left : 65px;
            margin-top : 8px;
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
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    Calendar cal = Calendar.getInstance();
    //현재 시간
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy년 MM월 dd일");
    String nowTime = sdf1.format(cal.getTime());
    //작성 날짜
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    String gr_mem_date = sdf.format(cal.getTime());
%>
<%
    int gr_mem_gnum = Integer.parseInt(request.getParameter("gr_mem_gnum"));
    int gr_mem_number = Integer.parseInt(request.getParameter("gr_mem_number"));
    int numValCheck = Integer.parseInt(request.getParameter("numValCheck"));
    String gr_mem_name = request.getParameter("gr_mem_name");
    String b_title = request.getParameter("b_title");

    groupPageDBBean grdb = groupPageDBBean.getInstance();
    ArrayList<GroupBean> conlist = grdb.contentList(gr_mem_gnum, gr_mem_name);
    GroupBean gb = new GroupBean();
%>
<div class="wrapper">
    <h1 class="title"><%=b_title%>
    </h1>
</div>
<div class="wrapper">
    <h2 class="title">Today</h2>
    <h4 align="center"><%=nowTime%>
    </h4>
</div>
<div class="confirm_wrap_name">
    <h1><%=gr_mem_name%></h1>
    <button class="btn_normal" onclick="location.href='groupPage.jsp?gr_mem_gnum=<%=gr_mem_gnum%>'">나가기</button>
</div>
<div style="overflow:auto; width : auto; height : auto;">
    <%
        for (int i = 0; i < conlist.size(); i++) {
            gb = conlist.get(i);
    %>
    <div class="confirm_wrap">
        <form action="show.jsp" method="post">
            <h1>
                <input type="hidden" name="gr_mem_gnum" value="<%=gr_mem_gnum%>">
                <input type="hidden" name="gr_mem_number" value="<%=gr_mem_number%>">
                <input type="hidden" name="gr_mem_date" value="<%=gr_mem_date%>">
                <input type="hidden" name="gr_mem_name" value="<%=gr_mem_name%>">
                <input type="hidden" name="gr_mem_study" value="<%=gb.getGr_mem_study()%>">
                <input type="hidden" name="gr_mem_conid" value="<%=gb.getGr_mem_conid()%>">
                <input type="hidden" name="numValCheck" value="<%=numValCheck%>"/>
                <%=(i + 1) + ". " + gb.getGr_mem_date()%>
            </h1>
            <input class="btn_normal" type="submit" value="확인하기"/>
        </form>
    </div>
    <%
        }
    %>
</div>
</body>
</html>

