<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="register.css" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Pacific&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
#content {
	display: grid;
	place-items: center;
	font-family: 'Gowun Dodum', sans-serif;
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

.title {
	font-family: 'Pacifico', sans-serif;
	font-size: 3em;
	color: #ffb72b;
	font-weight: bold;
}

/* 체크박스 스타일  */
input[type="checkbox"] {
	-webkit-appearance: none;
	position: relative;
	width: 16px;
	height: 16px;
	cursor: pointer;
	outline: none !important;
	border: 1px solid #eeeeee;
	border-radius: 2px;
	background: #fbfbfb;
}

input[type="checkbox"]::before {
	content: "\2714";
	position: absolute;
	top: 50%;
	left: 50%;
	overflow: hidden;
	transform: scale(0) translate(-50%, -50%);
	line-height: 1;
}

input[type="checkbox"]:hover {
	border-color: rgba(170, 170, 170, 0.5);
}

input[type="checkbox"]:checked {
	background-color: #ffb72b;
	border-color: rgba(255, 255, 255, 0.3);
	color: white;
}

input[type="checkbox"]:checked::before {
	border-radius: 2px;
	transform: scale(1) translate(-50%, -50%)
}

/* 셀렉트박스 스타일 */
select {
	width: 150px;
	padding: .8em .5em;
	border: none;
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
	font-size: medium;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

select::-ms-expand {
	display: none;
}

</style>
	<script type="text/javascript" src="script.js" charset="UTF-8"></script>
</head>
<body>
<div class="wrapper">
	<form name="reg_frm" method="post" action="registerProc.jsp" id="content">
		<h1 class="title">Welcome To STTO</h1>
		<table border="1">
			<tr>
				<td colspan="2" align="center">
					<h1>회원가입</h1>
					'*' 표시 항목은 필수 입력 항목입니다.
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					아이디 *
				</td>
				<td>
					<input type="text" size="20" name="mem_id" placeholder="아이디">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">o
					비밀번호 *
				</td>
				<td>
					<input type="password" size="20" name="mem_pw" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					비밀번호 확인 *
				</td>
				<td>
					<input type="password" size="20" name="pw_check" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					이    름 *
				</td>
				<td>
					<input type="text" size="20" name="mem_name" placeholder="이름">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					주민번호 *
				</td>
				<td>
					<input type="text" size="20" name="mem_jumin" placeholder="주민번호">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					전화번호 *
				</td>
				<td>
					<input type="text" size="20" name="mem_tel" placeholder="전화번호">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					이메일
				</td>
				<td>
					<input type="text" size="30" name="mem_email" placeholder="이메일">
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					관심분야 *
				</td>
				<td>
					<input type="checkbox" name="mem_interests" value="backend">&nbsp;백엔드
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="mem_interests" value="frontend">&nbsp;프론트엔드
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					언어 *
				</td>
				<td>
					<select id="language" name="mem_inter_ch">
						<option value="언어" selected="selected">언어</option>
						<option value="java">java</option>
						<option value="python">python</option>
						<option value="jsp">jsp</option>
						<option value="spring">spring</option>
					</select>
				</td>
			</tr>
			<tr>
				<td width="120" align="center">
					소개글
				</td>
				<td>
					<textarea name="mem_introduce" rows="10" cols="50" placeholder="소개글"></textarea>
				</td>
			</tr>
		</table>
		<div align="center" class="btn_area">
			<input class="btn_normal" type="button" value="등록" onclick="check_ok()">
			<input class="btn_normal" type="reset" value="다시입력">
			<input class="btn_normal" type="button" value="가입안함" onclick="javascript:window.location='login.jsp'">
		</div>
	</form>
</div>
</body>
</html>