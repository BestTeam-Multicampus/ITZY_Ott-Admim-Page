<%@page import="java.util.List"%>
<%@page import="ITzy.admin.dto.MemoDto"%>
<%@page import="ITzy.admin.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<%
MemberDto login = (MemberDto)session.getAttribute("login");
if (login == null) {
%>
<script>
	alert("로그인 세션이 만료되었습니다");
</script>
<%
response.sendRedirect("login.do");
}

List<MemoDto> list = (List<MemoDto>) request.getAttribute("memo");
	
%>


<h1 class="page-header">Memo</h1>

<div class="container" style="height: 100%;">
<table class="table table-bordered">
	<tr>
		<th>메모</th>		
		<th>날짜</th>
		<th>삭제</th>
		
	</tr>
<%-- 
<%
		for (int i = 0; i < list.size(); i++) {
	
			MemoDto dto = list.get(i);
			String s = Integer.toString(i);
		%>

	<tr>

		<td><%= dto.getMemo() %></td>
		<td><%= dto.getWdate()%></td>
		<td><button type="button" id=Btn<%=s%> class="btn btn-default btn-sm">삭제하기</button></td>
	
	</tr>
	
	 <script type="text/javascript">


	$(document).ready(function() {
		$("#Btn"+<%=s%>).click(function() {

			if ($("#answer"+<%= s %>).val().trim() == "") {
				alert("답변을 기입해 주십시오");					
			} else {
				$("#frm"+<%= s %>).submit();
			}
		});
	});
</script>
	
			<%
		} %>
 --%>
</table>

</div>
<!-- 
<div>
	<button type="button" class="btn btn-default" 
		onclick="location.href='/spring/add.memo';">메모쓰기</button>
</div> -->

