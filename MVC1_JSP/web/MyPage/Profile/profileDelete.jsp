<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String mem_id = request.getParameter("mem_id");
%>
<html>
<head>
    <title>회원탈퇴</title>
    <script src="js/profileDelete.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

        *{margin: 5px; padding: 5px;}
        .wrapper{
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
        }
        #content{
            display: grid;
            place-items: center;
            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
            border: 3px solid navy;
            border-radius: 15px;
        }
        .title{
            color: navy;
            font-weight: bold;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .btn_normal {
            position: relative;
            border: none;
            min-width: 70px;
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

        .btn_area{
            padding-top: 30px;
        }
    </style>
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