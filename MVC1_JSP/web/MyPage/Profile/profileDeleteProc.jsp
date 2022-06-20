<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="DBBean.MemberDBBean" %>
<html>
<head>
    <title>회원 삭제 처리</title>
    <link>
</head>
<body>
<div class="wrapper">
    <%
        String id = (String) session.getAttribute("mem_id");
        String pw = request.getParameter("mem_pw");

        // 세션에서 아이디를, delete.jsp에서 입력받은 비밀번호를 가져온다.
        // 가져온 결과를 가지고 회원정보를 삭제한다. - 삭제결과를 반환
        MemberDBBean manager = MemberDBBean.getInstance();
        int check = manager.deleteMember(id, pw);

        if (check == 1) {
            session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
    %>
    <div id="content">
        <h1 class="title">회원정보가 삭제되었습니다.</h1>
        <input type="button" class="btn_normal btn_area" value="확인"
               onclick="javascript:window.location='../../index.jsp'">
    </div>
</div>
<%
} else {
%>
<script>
    alert("비밀번호가 맞지 않습니다.");
    history.go(-1);
</script>
<%
    }
%>
</body>
</html>