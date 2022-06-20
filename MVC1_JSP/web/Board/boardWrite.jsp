<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="board" class="Bean.BoardBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>

<%
    String mem_id = (String) session.getAttribute("mem_id"); //로그인 한 회원 아이디
%>
<html>
<head>
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
    <title>글쓰기</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<body>
<div class="wrapper">
    <form action="boardWriteProc.jsp" method="post" id="content">
        <h1 class="title">스터디 그룹 모집글</h1>
        <input type="hidden" name="b_id" value="${mem_id}">
        <table border="1">
            <tr height="30">
                <td width="80" align="center">글 제 목
                </td>
                <td width="240" colspan="4">
                    <input type="text" name="b_title" size="100" maxlength="100">
                </td>
                <td width="80" align="center">${mem_id}
                </td>
            </tr>
            <tr height="30">
                <td width="80" align="center">스터디 목표
                </td>
                <td width="240" colspan="5">
                    <input type="text" name="b_goal" size="100" maxlength="100">
                </td>
            </tr>
            <td align="center">
                멤버수
            </td>
            <td colspan="2">
                <select name="b_stmember">
                    <option selected="selected">선택</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                </select>
            </td>
            <td width="80" align="center">분 야</td>
            <td width="240" colspan="2">
                <select id="b_inter_c" name="b_inter_c">
                    <option value="분야" selected="selected">선택</option>
                    <option value="backend">백엔드</option>
                    <option value="frontend">프론트엔드</option>
                </select>
            </td>

            </tr>
            <tr height="30">
                <td width="80" align="center">지 역</td>
                <td width="240" colspan="2">
                    <select name="area">
                        <option value="지역" selected="selected">지역</option>
                        <option value="seoul">서울</option>
                        <option value="gyeonggi">경기</option>
                        <option value="incheon">인천</option>
                        <option value="busan">부산</option>
                        <option value="daegu">대구</option>
                        <option value="daejeon">대전</option>
                        <option value="gwangju">광주</option>
                        <option value="online">온라인</option>
                    </select>
                </td>
                <td width="80" align="center">언 어</td>
                <td width="240" colspan="2">
                    <select id="languages" name="languages">
                        <option value="언어" selected="selected">선택</option>
                        <option value="java">java</option>
                        <option value="javascript">javascript</option>
                        <option value="spring">spring</option>
                        <option value="kotlin">kotlin</option>
                        <option value="python">python</option>
                        <option value="jsp">jsp</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="100" align="center"><b>시작일</b></td>
                <td colspan="2"><input type="tel" name="b_startdate" placeholder="ex)2022.01.01"></td>

                <td width="100" align="center"><b>종료일</b></td>
                <td colspan="2"><input type="text" name="b_finishdate" placeholder="ex)2022.01.01"></td>
            </tr>
            <tr>
                <td width="80" align="center">글내용
                </td>
                <td colspan="6">
                    <textarea rows="10" cols="90" name="b_content"></textarea>
                </td>
            </tr>
        </table>
        <div align="center" class="btn_area">
            <input class="btn_normal" type="submit" value="글쓰기">
            <input class="btn_normal" type="reset" value="다시작성">
            <input class="btn_normal" type="button" value="글목록" onclick="location.href='../index.jsp'">
        </div>
    </form>
</div>
</body>
</html>