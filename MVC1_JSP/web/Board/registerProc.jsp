<%@ page import="DBBean.RegisterDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 게시글에서 가입 신청 -->
<!DOCTYPE html>
<html>
    <head>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    </head>
    <body>
    <%
        response.setCharacterEncoding("UTF-8");
    %>
    <%-- contentInfo.jsp에서 데이터 받아오기 --%>
    <%
        String b_id = request.getParameter("b_id");
        String b_title = request.getParameter("b_title");
        int b_group = Integer.parseInt(request.getParameter("b_group"));
        String mem_id = request.getParameter("mem_id");
        String mem_name = request.getParameter("mem_name");
    %>
    <!-- 신청하기 눌러 등록하는 로직 -->
    <%
        RegisterDBBean rdb = RegisterDBBean.getInstance();
        int check = rdb.getRequest(b_id, b_title, b_group, mem_id, mem_name);
        if (check == 1) {
    %>
    <script>
        alert("신청 완료");
        history.go(-1);
    </script>
    <%
    } else {
    %>
    <script>
        alert("오류 발생");
        history.go(-1);
    </script>
    <%
        }
    %>
    </body>
</html>