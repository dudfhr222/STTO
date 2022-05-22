<%@page import="Bean.BoardBean"%>
<%@page import="DBBean.groupPageDBBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="DBBean.groupPageDBBean" %>
<%@ page import="Bean.GroupBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="gb" class ="Bean.GroupBean"/>
<jsp:setProperty name ="gb" property = "*"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>그룹페이지</title>
<link href="style/groupframe.css" rel="stylesheet">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
	* {
		margin: auto;
		padding: 5px;
		font-family: "Gowun Dodum", sans-serif;
	}
	li {
		list-style: none;
	}
	body {
		width: 1025px;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
	.title {
		width: 1000px;
		height: 50px;
		text-align: center;
		border: 3px solid navy;
		margin-bottom: 10px;
		float: left;
	}
	.date {
		float: left;
		width: 450px;
		height: 50px;
		text-align: center;
		border: 2px dotted navy;
		border-radius: 20px;
		margin-bottom: 7px;
	}
	.description {
		float: right;
		height: 50px;
		width: 420px;
		border: 3px solid navy;
		text-align: center;
		margin: 0;
	}

	.date_description {
		float: left;
		width: 460px;
		height: 50px;
		text-align: center;
		border: 3px solid navy;
	}

	.goal_description {
		float: left;
		width: 460px;
		height: 300px;
		text-align: center;
		border: 3px solid navy;
	}

	.box {
		float: left;
		width: 430px;
		height: 80px;
		text-align: center;
		border: 3px solid navy;
		margin: 0;
	}

	.tooltip {
		border-bottom: 1px dotted #000000;
		color: #000000;
		outline: none;
		cursor: help;
		text-decoration: none;
		position: relative;
	}

	.tooltip span {
		margin-left: -999em;
		position: absolute;
	}

	.tooltip:hover span:nth-child(1) {
		font-family: Calibri, Tahoma, Geneva, sans-serif;
		position: fixed;
		left: 1050px;
		top: 260px;
		z-index: 99;
		margin-left: 0;
		padding-left: 5px;
		width: 460px;
		height: 300px;
		text-align: left;
	}
	.tooltip:hover span:nth-child(2) {
		font-family: Calibri, Tahoma, Geneva, sans-serif;
		position: fixed;
		left: 1250px;
		top: 260px;
		z-index: 99;
		margin-left: 0;
		padding-left: 5px;
		width: 460px;
		height: 300px;
		text-align: left;
	}
	#quote {
		font-family: Calibri, Tahoma, Geneva, sans-serif;
		position: fixed;
		left: 990px;
		top: 430px;
		z-index: 99;
		margin-left: 0;
		padding-left: 5px;
		width: 460px;
		height: 300px;
		text-align: center;
	}
	.btn_normal {
		position: relative;
		border: none;
		min-width: 60px;
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
	��
	.btn_normal:hover {
		transform: scale(1.2);
	}
	��
	.btn_normal:hover::after {
		content: "";
		width: 20px;
		height: 20px;
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
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<%	
	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
	String nowTime = sdf.format(cal.getTime());
		
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd");
%>
<%
	int gr_mem_gnum = (int)session.getAttribute("gr_mem_gnum");
	String mem_id = (String) session.getAttribute("mem_id");
%>
<%
	groupPageDBBean gsrd = groupPageDBBean.getInstance();
	int numValCheck = gsrd.valNumCheck(mem_id, gr_mem_gnum); //DBBean.groupPageDBBean 56
	ArrayList<GroupBean> memlist = gsrd.memlist(gr_mem_gnum); //DBBean.groupPageDBBean 79
%>
<%
	BoardBean bb = gsrd.getBInfo(gr_mem_gnum); //DBBean.groupPageDBBean 113
%>
    	<div class ="title" >
      		  <h1><%=bb.getB_title() %></h1>
    	</div>
    	<div class ="title" >
       		 <h1><%=bb.getB_goal() %></h1>
    	</div>
        <div>
        	<table class="box">
        		<tr>
        			<td class ="date" colspan="3">
			       		 <h2>Today -<%=nowTime %></h2>
        			</td>
        		</tr>
	<% 
		for(int i =0; i<memlist.size();i++){
			gb = memlist.get(i);
	%>
        		<tr>
        			<td class ="date">
        			<a class="tooltip" href="#" style="float: left;">
        				<%=gb.getGr_mem_name()%>
						<span class="classic1">
							<h5>이름</h5>
							<h5>이메일</h5>
							<h5>자기 소개</h5> 
						</span>
						<span class="classic2">
							<h5><%=gb.getGr_mem_name() %></h5>
							<h5><%=gb.getMem_email() %></h5>
							<h5><%=gb.getGroup_introduce() %></h5>
		     			</span>
	        		</a>
		        		<div style="float: right;">
							<form method = "post" name = "form">
					        		<input type ="hidden" name ="gr_mem_gnum" value = "<%=gb.getGr_mem_gnum() %>"/>
					        		<input type ="hidden" name ="gr_mem_number" value = "<%=gb.getGr_mem_number() %>"/>
					        		<input type ="hidden" name ="gr_mem_name" value = "<%=gb.getGr_mem_name() %>"/>
					        		<input type ="hidden" name ="numValCheck" value = "<%=numValCheck %>"/>
					        		<input type ="hidden" name ="b_title" value = "<%=bb.getB_title() %>"/>
		        					<input class="btn_normal" type="submit" value="확인" onclick="javascript: form.action='confirm.jsp';"/>
				        	</form>
		        		</div>
		        		<div style="float: right;">
							<form method = "post" name = "form">
					        		<input type ="hidden" name ="gr_mem_gnum" value = "<%=gb.getGr_mem_gnum() %>"/>
					        		<input type ="hidden" name ="gr_mem_number" value = "<%=gb.getGr_mem_number() %>"/>
					        		<input type ="hidden" name ="gr_mem_name" value = "<%=gb.getGr_mem_name() %>"/>
<%
		if(numValCheck == gb.getGr_mem_number()){
%>		
					        		<input class="btn_normal" type="submit" value="기록" onclick="javascript: form.action='input.jsp';"/>
<%
	}
%>
				        	</form>
		        		</div>
        			</td>
        		</tr>
<% 		
	}
%>
<%
	String enddate = gb.getGroup_finishdate();
	String dday = gb.getDday(enddate);
%>
        	</table>
        </div>
        <div id="quote">
	    	<h3></h3>	
	        <h4></h4>
    	</div>
    <script>
		const quotes=[
			{
				quote:"What do you want a meaning for? Life is a desire, not a meaning.",
				author:"Charlie Chaplin",
			},{
				quote:"When you jump for joy, beware that no one moves the ground from beneath your feet.",
				author:"Stanislaw J. Lec",
			},{
				quote:"It is wise to apply the oil of refined politeness to the mechanisms of friendship.",
				author:"Colette",
			},{
				quote:"A penny saved is a penny earned.",
				author:"Benjamin Franklin",
			},{
				quote:"Mistakes are the portals of discovery.",
				author:"James Joyce",
			},{
				quote:"By perseverance the snail reached the ark.",
				author:"Charles Haddon Spurgeon",
			},{
				quote:"If I had to live my life again, I'd make the same mistakes, only sooner.",
				author:"Tallulah Bankhead",
			},{
				quote:"The greatest virtues are those which are most useful to other persons.",
				author:"Aristotle",
			},{
				quote:"No passion so effectually robs the mind of all its powers of acting and reasoning as fear.",
				author:"Edmund Burke",
			},{
				quote:"Force without wisdom falls of its own weight.",
				author:"Horace"
			}
		];

		const quote = document.querySelector("#quote h3");
		const author = document.querySelector("#quote h4");

		function requote(){
			const todaysQuote = quotes[Math.floor(Math.random()*quotes.length-1)];

			quote.innerText = todaysQuote.quote;
			author.innerText = todaysQuote.author;
		};
		requote();
		setInterval(requote,5000);
	</script>
    	<div>
	        <table class="description">
	            <tr>
	                <td class="date_description">
	                    <div style="text-align: center; line-height : 10px;">
	                        <h1><%=dday %></h1>
	                    </div>            
	                </td>
	            </tr>
	            <tr>
	                <td class="goal_description">
	                </td>
	            </tr>
	        </table>
	    </div>
</body>
</html>