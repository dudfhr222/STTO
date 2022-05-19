<%@page import="Bean.BoardBean" %>
<%@page import="Bean.MemberBean" %>
<%@page import="DBBean.MemberDBBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- login.jsp에서 데이터 받아옴-->
<%
    String mem_id = request.getParameter("mem_id"); //회원 아이디
    String mem_pw = request.getParameter("mem_pw"); //회원 비밀번호

    MemberDBBean mdb = MemberDBBean.getInstance();
    BoardBean board = new BoardBean();

    int check = mdb.userCheck(mem_id, mem_pw);
    MemberBean mb = mdb.getMember(mem_id);

    if (mb == null) {
%>
<script>
    alert('존재하지 않는 회원');
    history.go(-1);
</script>
<%
} else {
    String mem_name = mb.getMem_name();

    if (check == 1) { //세션에 사용자 정보 추가 후, main.jsp로 이동
        session.setAttribute("mem_id", mem_id);
        session.setAttribute("mem_name", mem_name);
        response.sendRedirect("../index.jsp");
    } else if (check == 0) {
%>
<script>
    alert('비밀번호가 틀렸습니다.');
    history.go(-1);
</script>
<%
} else {
%>
<script>
    alert('아이디가 맞지 않습니다');
    history.go(-1);
</script>
<%
        }
    }
%>
