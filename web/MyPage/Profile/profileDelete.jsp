<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String mem_id = request.getParameter("mem_id");
%>
<html>
<head>
    <title>회원탈퇴</title>
    // 비밀번호 미입력시 경고창
    <script src="js/profileDelete.js"></script>
</head>
<body>
<div class="wrapper">
    <form action="profileDeleteProc.jsp?mem_id=<%= mem_id %>" method="post" name="deleteform"
          onsubmit="return checkValue()" id="content">
        <h1 class="title">회원탈퇴</h1>
        <table>
            <tr>
                <td>비밀번호 :&nbsp;</td>
                <td><input type="password" name="mem_pw" maxlength="50"></td>
            </tr>
        </table>
        <div align="center" class="btn_area">
            <input class="btn_normal" type="button" value="취소" onclick="javascript:window.location='../../index.jsp'">
            <input class="btn_normal" type="submit" value="탈퇴"/>
        </div>
    </form>
</div>
</body>
</html>