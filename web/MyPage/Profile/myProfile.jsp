<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Bean.MemberBean"%>
<%@ page import="DBBean.MemberDBBean"%>
<html>
<head>
<title>회원정보</title>
	<link href="style/myProfile.css" rel="stylesheet">
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');

		* {
			margin: 5px;
			padding: 5px;
		}

		li {
			list-style: none;
		}

		a {
			text-decoration: none;
		}

		img {
			border: 0;
		}

		.tab {
			border: 2px solid navy;
			border-collapse: collapse;
			border-radius: 15px;
			font-size: 20px;
			font-weight: bold;
		}


		.title_info {
			font-size: 30px;
			font-weight: bold;
		}

		.btn_normal1 {
			position: relative;
			border: none;
			min-width: 50px;
			min-height: 30px;
			background: #ffb72b;
			border-radius: 1000px;
			color: white;
			cursor: pointer;
			font-weight: bold;
			font-size: medium;
			transition: 0.3s;
			font-family: 'Gowun Dodum', sans-serif;
		}

		.btn_normal1:hover {
			transform: scale(1.2);
		}

		.btn_normal1:hover::after {
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
	<%
		String mem_id = (String) session.getAttribute("mem_id"); //(세션) 로그인한 회원 아이디
		MemberDBBean manager = MemberDBBean.getInstance();
		MemberBean mb = manager.getUserInfo(mem_id);
	%>
	<center />
	<div class="title_info">
		<b><font size="6">내 정보</font></b>
	</div>
	<div>
		<table border="2" align="center" class="tab">
			<tr align="center">
				<td id="mem_id">아이디</td>
				<td><%=mb.getMem_id()%></td>
			</tr>
			<tr align="center">
				<td id="mem_pw">비밀번호</td>
				<td><%=mb.getMem_pw()%></td>
			</tr>
			<tr align="center">
				<td id="mem_name">이름</td>
				<td><%=mb.getMem_name()%></td>
			</tr>
			<tr align="center">
				<td id="mem_jumin">주민번호</td>
				<td><%=mb.getMem_jumin()%></td>
			</tr>
			<tr align="center">
				<td id="mem_tel">전화번호</td>
				<td><%=mb.getMem_tel()%></td>
			</tr>
			<tr align="center">
				<td id="mem_email">이메일</td>
				<td><%=mb.getMem_email()%></td>
			</tr>
			<tr align="center">
				<td id="mem_interests">관심분야</td>
				<td><%=mb.getMem_interests()%></td>
			</tr>
			<tr align="center">
				<td id="mem_introduce">소개글</td>
				<td>
					<textarea><%=mb.getMem_introduce()%></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" class="btn_area">
		<input class="btn_normal1" type="button" value="회원정보수정" onclick="javascript:window.location='/STTO/MyPage/Profile/profileUpdate.jsp'">
		<input class="btn_normal1" type="button" value="회원탈퇴" onclick="javascript:window.location='/STTO/MyPage/Profile/profileDelete.jsp'">
	</div>
</body>
</html>