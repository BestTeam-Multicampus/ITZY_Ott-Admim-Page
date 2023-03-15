<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
<p>header</p> 
<input type="button" id="logoutBtn" value="로그아웃">
<p>접속한 관리자 아이디 : <%= login.getId()+" 이름 : "+login.getName()%></p>

<script type="text/javascript">

$(function() {
	
	$("#logoutBtn").click(function() {

		session.removeAttribute("login");
		location.href = "login.do";
	});
});

</script>
</body>
</html>