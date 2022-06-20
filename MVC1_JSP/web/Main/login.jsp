<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="login.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Signika+Negative:wght@500&display=swap');
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

        #title {
            color: navy;
            font-family: 'Signika Negative', sans-serif;
            font-size: 4em;
            font-weight: bold;
        }

        #content {
            border: 3px solid navy;
            border-radius: 30px;
            width: 400px;
            height: 400px;
            display: grid;
            place-items: center;
            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
        }

        #table {
            margin: auto;
            padding: auto;
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
    </style>

</head>
<body>
<div class="wrapper">
    <form action="loginProc.jsp" method="post" id="content">
        <h1 id="title" align="center">Log in</h1>
        <table align="center" id="table">
            <tr height="30">
                <td align="center">
                    아 이 디
                </td>
                <td>
                    &nbsp;&nbsp;<input type="text" name="mem_id">
                </td>
            </tr>
            <tr height="30">
                <td align="center">
                    비밀번호
                </td>
                <td>
                    &nbsp;&nbsp;<input type="password" name="mem_pw">
                </td>
            </tr>
        </table>
        <div align="center">
            <input class="btn_normal" type="submit" value="로그인">
            &nbsp;
            <input class="btn_normal" type="button" value="회원가입" onclick="javascript:window.location='register.jsp'">
        </div>
    </form>
</div>
</body>
</html>