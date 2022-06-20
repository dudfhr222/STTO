<%@page import="Bean.GroupBean" %>
<%@page import="DBBean.groupPageDBBean" %>
<%@ page import="DBBean.groupPageDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수정하기</title>
    <style>
        * {margin: 5px; padding: 5px;}
        body {align-content: center;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border: 0;}
        div{margin: 5px; padding: 5px;}

        .wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .title{
            font-size: 3em;
            color: navy;
            font-weight: bold;
            font-family: 'Gowun Dodum', sans-serif;
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

        #txt {
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
    groupPageDBBean gpdb = groupPageDBBean.getInstance();
    GroupBean gb = new GroupBean();

    int gr_mem_gnum = Integer.parseInt(request.getParameter("gr_mem_gnum"));
    int gr_mem_number = Integer.parseInt(request.getParameter("gr_mem_number"));
    String gr_mem_name = request.getParameter("gr_mem_name");
    String gr_mem_date = request.getParameter("gr_mem_date");
    String gr_mem_study = request.getParameter("gr_mem_study");
    int gr_mem_conid = Integer.parseInt(request.getParameter("gr_mem_conid"));

    gb = gpdb.getRecord(gr_mem_name, gr_mem_conid);
%>
<div class="wrapper" style="display: inline-block; text-align: center;" align="center">
    <div class="title">
        <h1 align="center">공부기록</h1>
    </div>
    <div id="txt" align="center">
        <div id="content">
            <h1><%=gr_mem_study%></h1>
        </div>
        <form action="../editProc.jsp" method="post" name="form">
            <input type="hidden" name="gr_mem_gnum" value="<%=gr_mem_gnum%>">
            <input type="hidden" name="gr_mem_number" value="<%=gr_mem_number%>">
            <input type="hidden" name="gr_mem_name" value="<%=gr_mem_name%>">
            <input type="hidden" name="gr_mem_date" value="<%=gr_mem_date%>">
            <input type="hidden" name="gr_mem_study" value="<%=gr_mem_study%>">
            <input type="hidden" name="gr_mem_conid" value="<%=gr_mem_conid%>">
            <input style="position: relative; top:118px; right:65px;" class="btn_normal" type="submit" value="수정하기"/>
            <!--				<input style="position: relative; top:118px; right:65px;" class="btn_normal" type="submit" value="수정하기" onclick="javascript: form.action='editProc.jsp';" /> -->
        </form>
    </div>
    <div>
        <button style="position: relative; left:65px; " class="btn_normal" onclick="location.href='groupPage.jsp'">나가기</button>
    </div>
</div>
</body>
</html>


