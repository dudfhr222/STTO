<%@page import="Bean.GroupRegisterBean" %>
<%@page import="java.util.ArrayList" %>
<%@page import="DBBean.MemberDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>신청 목록</title>
    <script language='javascript'>
        function reject(frm) {
            frm.action = 'rejectProc.jsp';
            frm.submit();
            return true;
        }
    </script>
    <link rel="stylesheet" href="reglist.css">
    <style>
        @charset "UTF-8";
        @import url("https://fonts.googleapis.com/css2?family=Pacifico&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap");

        * {
            font-family: 'Gowun Dodum', sans-serif;
        }

        .wrapper {
        }

        .box {
            text-align: center;
            width: 1000px;
            height: 80px;
            border: 3px solid navy;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
        }

        .title {
            font-size: 3em;
            color: navy;
            font-weight: bold;
        }

        .btn_normal {
            position: relative;
            border: none;
            min-width: 70px;
            min-height: 40px;
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
<%
    String mem_id = request.getParameter("mem_id"); //작성자 아이디 받아와서 sql 실행
    int b_group = Integer.parseInt(request.getParameter("b_group"));
    int b_stmember = Integer.parseInt(request.getParameter("b_stmember"));
    int b_status = Integer.parseInt(request.getParameter("b_status"));
%>
<body>
<%
    response.setCharacterEncoding("UTF-8");
%>
<%
    //현재 모집인원 b_status
    //정원 b_stmember
    MemberDBBean mdb = MemberDBBean.getInstance();
    ArrayList<GroupRegisterBean> rql = mdb.reqList(mem_id, b_group); //ArrayList
    if(b_status == b_stmember) {
%>
<script>
    alert("모집 완료된 급입니다.");
    history.go(-1);
</script>
<%
} else {
%>
<div class="wrapper">
    <table class="box">
        <tr>
            <td colspan="6">
                <h1 class="title"><%=b_status%> / <%=b_stmember %>
                </h1>
            </td>
        </tr>
        <tr>
            <td>
                그룹 번호
            </td>
            <td>
                구인글 제목
            <td>
                신청자 아이디
            </td>
            <td>
                신청자 이름
            </td>
            <td>
                작성자 아이디
            </td>
        </tr>
        <%
            for (int i = 0; i < rql.size(); i++) {
                GroupRegisterBean grb = rql.get(i);
        %>
        <tr id="lis">
            <td>
                <%=grb.getB_group() %>
            </td>
            <td>
                <%=grb.getB_title() %>
            </td>
            <td>
                <%=grb.getMem_id() %>
            </td>
            <td>
                <%=grb.getMem_name() %>
            </td>
            <td>
                <%=grb.getB_id() %>
            </td>
            <td>
                <form action="approveProc.jsp" method="post">
                    <input type="hidden" name="mem_id" value="<%=grb.getMem_id() %>">
                    <input type="hidden" name="mem_name" value="<%=grb.getMem_name() %>">

                    <input type="hidden" name="b_group" value="<%=grb.getB_group() %>">
                    <input type="hidden" name="b_id" value="<%=grb.getB_id() %>">
                    <input type="hidden" name="b_stmember" value="<%=b_stmember %>">
                    <input type="hidden" name="b_status" value="<%=b_status%>">
                    <input class="btn_normal" type="submit" value="승인"/>
                    <button class="btn_normal" id="reg" onclick='return reject(this.form);'>기각</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
</div>
</body>
</html>
