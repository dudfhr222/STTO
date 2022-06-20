<%@page import="DBBean.groupPageDBBean" %>
<%@page import="java.util.*" %>
<%@ page import="DBBean.groupPageDBBean" %>
<%@ page import="Bean.GroupBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>내가 쓴 글</title>
    <style>
        *{
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
        }
        .wrapper{
            background-color: green;
            position:absolute;
        }

        .top{
            top: 0;
            height: 30%;
            position: absolute;
            background-color: red;
        }
        .main-buttons{
            width: 10%;
            height: 15%;
            background-color: yellow;
            margin-left:60%;
            margin-top: 10%;
        }
        .main-title{
            width: 40%;
            height: 40%;
            background-color: royalblue;
            margin-left:30%;
            margin-bottom: 10%;
            margin-top: 2%;
        }

        .content{
            top: 18%;
            height: 90%;
            position: absolute;
            background-color: blue;
        }

        .list{
            width: 65%;
            height: 65%;
            background-color: blueviolet;
            position: relative;
            margin-left: 10%;
            margin-top: 5%;
            display: inline-block;
        }
        .sub-list{
            width: 15%;
            height: 65%;
            background-color: blueviolet;
            position: relative;
            margin-left: 5%;
            margin-top: 5%;
            display: inline-block;
        }
        .item{
            height: 5%;
        }
    </style>
    <%
        request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
%>
<%
    int gr_mem_gnum = Integer.parseInt(request.getParameter("gr_mem_gnum"));
    int gr_mem_number = Integer.parseInt(request.getParameter("gr_mem_number"));
    String gr_mem_date = request.getParameter("gr_mem_date");
    String gr_mem_name = request.getParameter("gr_mem_name");
    String gr_mem_study = request.getParameter("gr_mem_study");
    int gr_mem_conid = Integer.parseInt(request.getParameter("gr_mem_conid"));

    groupPageDBBean gsrd = groupPageDBBean.getInstance();
    GroupBean gsr = new GroupBean();

    try {
        gsr = gsrd.getRecord(gr_mem_name, gr_mem_conid);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>
<%
    ArrayList<GroupBean> conlist = gsrd.contentList(gr_mem_gnum, gr_mem_name);
%>
<div class="wrapper">
    <input type="hidden" name="groupmember" value="<%=gr_mem_name%>">
    <input type="hidden" name="content" value="<%=gr_mem_study%>">
    <div class = "top">
        <div class = "main-title">
            <h1 class="title" align="center">내가 쓴 글</h1>
        </div>
    </div>

    <div class = "main-buttons">
        <button style="position: relative; left : 120px;" class="btn_normal"
                onclick="location.href='groupPage.jsp';javascript:form.action='confirm.jsp'">나가기
        </button>
    </div>
    <div class = "content">
        <div class="list">
            <p>
                <%=gr_mem_study %>
            </p>
        </div>
        <div class="sub-list">
            <%
                for(int i =0; i< conlist.size();i++){
                    gsr = conlist.get(i);
            %>
            <li class="item">
                <form method = "post" action = "show_t.jsp">
                    <input type ="hidden" name ="gr_mem_gnum" value ="<%=gsr.getGr_mem_gnum() %>">
                    <input type ="hidden" name ="gr_mem_number" value ="<%=gsr.getGr_mem_number() %>">
                    <input type= "hidden" name = "gr_mem_date" value = "<%=gsr.getGr_mem_date() %>">
                    <input type= "hidden" name = "gr_mem_name" value = "<%=gsr.getGr_mem_name() %>">
                    <input type= "hidden" name = "gr_mem_conid" value = "<%=gsr.getGr_mem_conid() %>">
                    <input type= "hidden" name = "gr_mem_study" value = "<%=gsr.getGr_mem_study() %>">
                    <strong>
                        <%= (i+1)+". " + gsr.getGr_mem_date()%>
                    </strong>
                    <input type="submit" value="확인하기"/>
                </form>
            </li>
            <%
                }
            %>
        </div>
    </div>
</div>
<%--
<div style="display: inline-block; text-align: center;" align="center">

    <div align="center">
        <form method="post" name="form">
            <input type="hidden" name="gr_mem_gnum" value="<%=gr_mem_gnum%>">
            <input type="hidden" name="gr_mem_number" value="<%=gr_mem_number%>">
            <input type="hidden" name="gr_mem_name" value="<%=gr_mem_name%>">
            <input type="hidden" name="gr_mem_date" value="<%=gr_mem_date%>">
            <input type="hidden" name="gr_mem_study" value="<%=gr_mem_study%>">
            <input type="hidden" name="gr_mem_conid" value="<%=gr_mem_conid%>">
            <input style="position: relative; right: 130px; top: 232px;" class="btn_normal" type="submit" value="글 수정"
                   onclick="javascript:form.action='edit.jsp';"/>
        </form>
    </div>
    <div id="txt" align="center">
        <%
            for (int i = 0; i < conlist.size(); i++) {
                gsr = conlist.get(i);
        %>
        <form method="post" action="showOther.jsp">
            <strong><%=(i + 1) + ". " + gsr.getGr_mem_date()%> - <span><%=gr_mem_study%>
            </strong></span>
            <input type="hidden" name="gr_mem_gnum" value="<%=gsr.getGr_mem_gnum()%>">
            <input type="hidden" name="gr_mem_number" value="<%=gsr.getGr_mem_number()%>">
            <input type="hidden" name="gr_mem_date" value="<%=gsr.getGr_mem_date()%>">
            <input type="hidden" name="gr_mem_name" value="<%=gsr.getGr_mem_name()%>">
            <input type="hidden" name="gr_mem_conid" value="<%=gsr.getGr_mem_conid()%>">
            <input type="hidden" name="gr_mem_study" value="<%=gsr.getGr_mem_study()%>">
            <input style="position: relative; right : 123px; top: 118px;" class="btn_normal" type="submit"
                   value="확인하기"/>
        </form>
        <%
            }
        %>
    </div>
    <div align="center">
    </div>
</div>
--%>
</body>
</html>


