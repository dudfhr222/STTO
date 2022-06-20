<%@page import="java.util.ArrayList" %>
<%@ page import="DBBean.MemberDBBean" %>
<%@ page import="Bean.GroupBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>참여중인 스터디</title>
    <link href="styles.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

        * {
            margin: 5px;
            padding: 5px;
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

        .mediv {
            border: 2px dotted navy;
            border-radius: 15px;
            width: 200px;
            height: 170px;
            margin: 2px;
            font-weight: bold;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .mediv:hover {
            background: #ffb72b;
            transform: scale(1.05);
        }

        .leftd {
            border-bottom: 0.5px dotted navy;
            border-right: 0.5px dotted navy;
        }

        .rightd {
            border-bottom: 0.5px dotted navy;
        }

        .endleftd {
            border-right: 0.5px dotted navy;
        }
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<%
    String mem_id = (String) session.getAttribute("mem_id"); //(세션) 로그인 한 회원 아이디
%>
<body>
<%
    response.setCharacterEncoding("UTF-8");
%>
<%
    //로그인 한 회원이 참여중인 스터디
    MemberDBBean mdb = MemberDBBean.getInstance();
    ArrayList<GroupBean> list = mdb.getMyStudyInfo(mem_id);
    for (int i = 0; i < list.size(); i++) {
        GroupBean gb = list.get(i);
%>
<a href="/STTO/GroupPage/groupPage.jsp?gr_mem_gnum=<%=gb.getGr_mem_gnum()%>">
<%
    session.setAttribute("gr_mem_gnum", gb.getGr_mem_gnum());
%>
    <table class="mediv">
        <tr>
            <td class="leftd">글 번호</td>
            <td class="rightd">
                <%=gb.getGr_mem_gnum()%>
            </td>
        </tr>
        <tr>
            <td class="leftd">목표</td>
            <td class="rightd">
                <%=gb.getGroup_goal()%>
            </td>
        </tr>
        <tr>
            <td class="leftd">시작 일자</td>
            <td class="rightd">
                <%=gb.getGroup_startdate()%>
            </td>
        </tr>
        <tr>
            <td class="endleftd">종료 일자</td>
            <td>
                <%=gb.getGroup_finishdate()%>
            </td>
        </tr>
    </table>
</a>
<%
    }
%>
</body>
</html>