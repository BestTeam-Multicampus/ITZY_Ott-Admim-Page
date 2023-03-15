<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
List<MemberDto> list = (List<MemberDto>) request.getAttribute("allmem");
%>
<h1>멤버조회</h1>

<div id="allmem"
	style="overflow-y: scroll; height: 300px; width: 800px;">
	<table border="1">
		<col width="80">
		<col width="80">
		<col width="150">
		<col width="150">
		<col width="50">

		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>권한</th>
			<th>수정</th>
			<th>삭제</th>

		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			MemberDto dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getContact()%></td>
			<td><%=dto.getAuth()%></td>
			<td>
				<button>수정</button>
			</td>
			<td>
				<button>삭제</button>
			</td>
		</tr>

		<%
		}
		%>


	</table>

</div>

<h2>기업회원</h2>
<h2>일반회원</h2>
