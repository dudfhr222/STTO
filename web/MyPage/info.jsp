<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String mem_id = (String) session.getAttribute("mem_id");
    String mem_name = (String) session.getAttribute("mem_name");
%>
<html>
<head>
</head>
<body>
<h1><a href="myPage.jsp"><%=mem_id%><br>(<%=mem_name%>)</a></h1>
</body>
</html>