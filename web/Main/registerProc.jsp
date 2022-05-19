<%@ page import="DBBean.MemberDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mb" class="Bean.MemberBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
    MemberDBBean mdb = MemberDBBean.getInstance();
    if (mdb.confirmID(mb.getMem_id()) == 1) {
%>
<script>
    alert("중복되는 아이디가 존재합니다.");
    history.back();
</script>
<%
} else {
    int re = mdb.insertMember(mb);
    //회원가입을 하는 경우이기 때문에 insert해야함

    if (re == 1) {
%>
<script>
    alert("회원가입을 축하드립니다.\n회원으로 로그인 해주세요.");
    document.location.href = "login.jsp";
</script>
<%
} else {
%>
<script>
    alert("회원가입을 실패했습니다.");
    document.location.href = "login.jsp";
</script>
<%
        }
    }
%>