<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="ITzy.admin.dto.MemberDto"%>
    
<%
MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert('로그인 해 주십시오');
	location.href = "login.do";
</script>
<%
} %>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>header</h1> 
<button id="logoutBtn">로그아웃</button>
<h3>접속한 관리자 아이디 : <%= login.getId()+" 이름 : "+login.getName()%></h3>

<script type="text/javascript">

$(function() {
	$("#logoutBtn").click
});


</script>
</body>
</html>