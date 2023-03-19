<%@page import="ITzy.admin.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>


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
%>



<div class="container" style="height: 100%;">

	<ul class="list-group">
		<li class="list-group-item"><a href="calendar.do">메인화면</a></li>
		<li class="list-group-item"><a href="members.do">전체회원</a></li>
		<li class="list-group-item"><a href="BizMems.do">기업회원</a></li>
		<li class="list-group-item"><a href="NomalMems.do">일반회원</a></li> 
		<li class="list-group-item"><a href="BanMems.do">활동정지회원</a></li> 
		<li class="list-group-item"><a href="Managers.do">관리자</a></li> 
		<li class="list-group-item"><a href="bulletins.do">게시판 관리</a></li>
		<li class="list-group-item"><a href="recruits.do">모집공고 관리</a></li>
		<li class="list-group-item"><a href="#none">프로필 관리</a></li>
		<li class="list-group-item"><a href="qnalist.do">Q&A</a></li>
		<li class="list-group-item"><a href="hoewonQ.do">회원문의</a></li>
		<li class="list-group-item"><a href="gongoQ.do">공고문의</a></li>
		<li class="list-group-item"><a href="orewQ.do">오류신고</a></li>
		<li class="list-group-item"><a href="ansComplete.do">답변완료</a></li>
	</ul>
</div>