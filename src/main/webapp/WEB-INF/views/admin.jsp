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
}


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>
<h1>어드민</h1>
<h1><%= login.toString() %></h1>

</body>
</html>