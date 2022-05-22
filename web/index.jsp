<%@ page import="DBBean.BoardDBBean" %>
<%@ page import="Bean.BoardBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<jsp:useBean id="board" class="Bean.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"></jsp:setProperty>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap');
        * {
            margin: 10px;
            padding: 5px;
        }

        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
        }
        /*로그인, 회원가입*/
        .content{
            border: 1px solid black;
            margin: auto;
            top: 100px;
        }
        .btns{
            margin-left: 75%;
        }
        /* 로고 스타일  */
        .main_logo {
            margin: auto;
            top: 0px;
            right: 50px;
            font-family: 'Pacifico', cursive;
            font-size: 5em;
            color: #ffb72b;
            font-weight: bold;
        }
        .form-frame{
            margin: auto;
        }
        .table_search {
            margin: auto;
            border: 3px solid navy;
            border-radius: 15px;
            width: 1000px;
            height: 50px;
            align-content: center;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .table_list {
            margin: auto;
            width: 800px;

            font-family: 'Gowun Dodum', sans-serif;
            font-weight: bold;
        }

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

        .consi {
            float: left;
            width: 195px;
            height: 180px;
            margin-left: 50px;
            border: 2px solid navy;
            border-radius: 10px;
            color: black;
        }

        .consi:hover {
            letter-spacing: 2px;
            transform: scale(1.159);
            cursor: pointer;
        }

        .consi_lan {
            float: left;
            padding-left: 10px;
            padding-top: 10px;
            /*margin: 0, 0, 0, 10;*/
        }

        .consi_inch {
            float: right;
            padding-right: 10px;
            padding-top: 10px;
            /*margin: 0, 10, 0, 0;*/
        }

        .consi_area {
            border-bottom: 1px dotted navy;
            border-top: 1px dotted navy;
            line-height: 28px;
            margin-top: 30px;
        }

        select::-ms-expand {
            display: none;
        }

        img {
            margin: 0;
            padding: 0;
        }

        /*버튼*/
        .btn-search {
            position: relative;
            border: none;
            min-width: 100px;
            min-height: 50px;
            background: #ffb72b;
            border-radius: 1000px;
            color: white;
            cursor: pointer;
            font-weight: 700;
            font-size: medium;
            transition: 0.3s;
            font-family: 'Gowun Dodum', sans-serif;
        }

        .btn-search:hover {
            transform: scale(1.2);
        }

        .btn-search:hover::after {
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

        .btn_normal {
            position: relative;
            padding: 10px 10px;
            border-radius: 15px;
            border: none;
            color: #06113c;
            background-color: aliceblue;
            display: inline-block;
            font-family: 'Gowun Dodum', sans-serif;
            text-decoration: none;
            font-weight: 600;
            transition: 0.25s;
        }

        .btn_normal:active {
            transform: scale(1.5);
        }

        .btn_normal:hover {
            letter-spacing: 2px;
            transform: scale(1.2);
            cursor: pointer;
        }
    </style>
    <title>STTO</title>
</head>
<body>
<%
    String mem_id = (String) session.getAttribute("mem_id");
    String mem_name = (String) session.getAttribute("mem_name");
%>
<div class="btns">
    <%
        if (session.getAttribute("id") != null) {
            mem_id = (String) session.getAttribute("id");
        }
        if (mem_id == null) {
    %>
    <a href="index.jsp"></a>
    <input class="btn_normal" type="button" value="로그인"
           onclick="javascript:window.location='Main/login.jsp'">
    &nbsp;
    <input class="btn_normal" type="button" value="회원가입"
           onclick="javascript:window.location='Main/register.jsp'">
    <%
    } else {
    %>
    <input class="btn_normal" type="button" value="글쓰기"
           onclick="location.href='Board/boardWrite.jsp';javascript:form.action='Board/boardWrite.jsp'">
    &nbsp;
    <input class="btn_normal" type="button" value="나의 스터디"
           onclick="javascript:window.location='MyPage/myPage.jsp'">
    &nbsp;
    <input class="btn_normal" type="button" value="로그아웃"
           onclick="javascript:window.location='Main/logOut.jsp'">
    <%
        }
    %>
</div>
<div class="main_logo" align="center">
    STTO
</div>
<div class="form-frame">
    <form action="index.jsp" method="get">
        <table class="table_search" align="center">
            <tr>
                <td align="center">
                    <select id="b_area" name="b_area">
                        <option value="지역" selected="selected" onchange="checkArea()">지역</option>
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
                <td align="center">
                    <select id="b_inter_s" name="b_inter_s">
                        <option value="개발분야" selected="selected">개발 분야</option>
                        <option value="backend">백엔드</option>
                        <option value="frontend">프론트엔드</option>
                    </select>
                </td>
                <td align="center">
                    <select id="b_inter_c" name="b_inter_c">
                        <option value="언어" selected="selected">언어</option>
                        <option value="java">java</option>
                        <option value="javascript">javascript</option>
                        <option value="spring">spring</option>
                        <option value="kotlin">kotlin</option>
                        <option value="python">python</option>
                        <option value="jsp">jsp</option>
                    </select>
                </td>
            </tr>
        </table>

        <table class="table_list" align="center">
            <tr height="25" bgcolor="#F7F7F7"
                onmouseover="this.style.backgroundColor='#eeeeef'"
                onmouseout="this.style.backgroundColor='#f7f7f7'">
                    <%
                    //검색
                    String b_area = request.getParameter("b_area");
                    String b_inter_s = request.getParameter("b_inter_s");
                    String b_inter_c = request.getParameter("b_inter_c");

                    BoardDBBean db = BoardDBBean.getInstance();
                    ArrayList<BoardBean> list = db.listBoard(b_area, b_inter_s, b_inter_c);

				for(int i=0; i<list.size(); i++){
					board = list.get(i);
					int b_group = board.getB_group();
					String b_title = board.getB_title();
					String language = board.getLanguages();
					String inter_c = board.getB_inter_c();
					String area = board.getArea();
					if(i%4==0){
		%>
            <tr></tr>
            <%
                }
            %>
            <td>
                <a href="Board/contentInfo.jsp?b_group=<%=b_group%>">
                    <div class="consi">
                        <div class="consi_lan">
                            <%
                                if (language.equals("java")) {
                            %>
                            <img src="/STTO/icon/java.png">
                            <%
                            } else if (language.equals("javascript")) {
                            %>
                            <img src="/STTO/icon/js.png" rel="icon">
                            <%
                            } else if (language.equals("spring")) {
                            %>
                            <img src="/STTO/icon/spring.png">
                            <%
                            } else if (language.equals("jsp")) {
                            %>
                            <img src="/STTO/icon/jsp.png">
                            <%
                            } else if (language.equals("kotlin")) {
                            %>
                            <img src="/STTO/icon/kotlin.png">
                            <%
                            } else if (language.equals("python")) {
                            %>
                            <img src="/STTO/icon/python.png">
                            <%
                                }
                            %>
                        </div>
                        <div class="consi_inch">
                            <%
                                if (inter_c.equals("backend")) {
                            %>
                            <img src="/STTO/icon/back.png">
                            <%
                            } else if (inter_c.equals("frontend")) {
                            %>
                            <img src="/STTO/icon/front.png">
                            <%
                                }
                            %>
                        </div>
                        <br><br>
                        <div class="consi_area" align=center>
                            지역 : <%=area %>
                        </div>
                        <div class="consi_title" align=center>
                            <%=b_title %>
                        </div>
                    </div>
                </a>
            </td>
            <%
                }
            %>
            </tr>
        </table>
        <div align="center">
            <input class="btn-search" type="submit" value="찾기">
        </div>
    </form>
</div>
</body>
</html>
