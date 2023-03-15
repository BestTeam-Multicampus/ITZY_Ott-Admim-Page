<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
.tableWrapper {
	width: 1050px;
	height: 500px;
	overflow:auto;
}

#userListTable {
	width: 1000px;
	border: 2px;
	border: 1px solid #888;
}

#userListTable th {
	height: 50px;
	position: sticky;
	top: 0px;
	background-color: gray;

</style>

<%
List<MemberDto> list = (List<MemberDto>) request.getAttribute("allmem");
%>
<h1>멤버조회</h1>


<div class="tableWrapper">
	<table id="userListTable" border="2">
		<col width="80">
		<col width="80">
		<col width="150">
		<col width="150">
		<col width="100">
		<col width="80">
		<col width="80">
		<tr style="cursor: default;">

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
			<td>
				<%
				if (dto.getAuth() == 1) {
				%> 기업회원 <%
				} else if (dto.getAuth() == 2) {
				%> 일반회원 <%
				} else if (dto.getAuth() == 0) {
				%> 관리자 <%
				}
				%>


			</td>
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
