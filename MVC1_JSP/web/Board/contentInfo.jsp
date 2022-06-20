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

    * {
        margin: 5px;
        padding: 5px;
    }

    .wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 80vh;
    }

    #content {
        display: grid;
        place-items: center;
        font-family: 'Gowun Dodum', sans-serif;
        font-weight: bold;
    }

    .title {
        font-size: 3em;
        color: navy;
        font-weight: bold;
    }

    table {
        border: 3px solid navy;
        border-collapse: collapse;
    }

    td {
        border-bottom: 1px solid navy;
        padding: 10px;
    }

    .btn_area {
        padding-top: 30px;
    }

    /* 버튼 스타일 */
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

    /* 셀렉트박스 스타일 */
    select {
        width: 150px;
        padding: .8em .5em;
        border: none;
        font-family: 'Gowun Dodum', sans-serif;
        font-size: medium;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    select::-ms-expand {
        display: none;
    }

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