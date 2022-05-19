<%@page import="DBBean.BoardDBBean" %>
<%@page import="Bean.BoardBean" %>
<%@ page import="DBBean.BoardDBBean" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
<jsp:useBean id="board" class="Bean.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
--%>

<title>글 정보</title>
<link href="BoardStyle/boardWrite.css" rel="stylesheet">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
</style>
</head>
<body>
<%
    String mem_id = (String) session.getAttribute("mem_id"); //(세션)신청자 이름
    String mem_name = (String) session.getAttribute("mem_name"); //(세션)신청자 아이디

    int b_group = Integer.parseInt(request.getParameter("b_group")); //메인에서 글 번호를 이용해 페이지 들어옴
    BoardDBBean bdb = BoardDBBean.getInstance(); //해당 글 번호의 글 정보 가져옴
    BoardBean board = bdb.getConInfo(b_group);
%>
<div class="wrapper">
    <form action="registerProc.jsp" method="post" id="content">
        <h1 class="title">스터디 그룹 모집글</h1>
        <table border="1" align="center">
            <tr height="30">
                <td width="80" align="center">작성자</td>
                <td>
                    <%=board.getB_id()%>>
                </td>
                <td width="80" align="center">언 어</td>
                <td width="240">
                    <%=board.getLanguages() %>
                </td>
            </tr>
            <tr height="30">
                <td width="80" align="center">지 역</td>
                <td width="240">
                    <%=board.getArea() %>
                </td>
                <td width="80" align="center">분 야</td>
                <td width="240">
                    <%=board.getB_inter_c() %>
                </td>
            </tr>
            <tr>
                <td width="100" align="center"><b>시작일</b></td>
                <td>
                    <%=board.getB_startdate() %>
                </td>

                <td width="100" align="center"><b>종료일</b></td>
                <td>
                    <%=board.getB_finishdate() %>
                </td>
            </tr>
            <tr height="30">
                <td width="80" align="center">글 제 목</td>
                <td width="240" colspan="3">
                    <%=board.getB_title() %>
                </td>
            </tr>
            <tr height="30">
                <td width="80" align="center">스터디 목표</td>
                <td width="240" colspan="3">
                    <%=board.getB_goal() %>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <%=board.getB_content() %>
                </td>
            </tr>
        </table>
        <div align="center">
            <input type="hidden" name="mem_id" value="<%=mem_id %>"><br>
            <input type="hidden" name="mem_name" value="<%=mem_name%> "><br>
            <input type="hidden" name="b_id" value="<%=board.getB_id() %>"><br>
            <input type="hidden" name="b_group" value="<%=b_group %>"><br>
            <input type="hidden" name="b_title" value="<%=board.getB_title() %>"><br>

            <!-- 로그인 안했으면 가입 요청 못 하게 막음 -->
            <%
                if (mem_id != null || mem_name != null) {
            %>
            <input class="btn_normal" type="submit" value="가입 요청">
            <%
                }
            %>
            <input class="btn_normal" type="button" value="글목록" onclick="location.href='../index.jsp'">
        </div>
    </form>
</div>
</body>
</html>