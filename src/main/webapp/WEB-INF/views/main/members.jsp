<%@page import="ITzy.admin.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!DOCTYPE html>

<style>
.container {
	width: 100%;
	height: 500px;
	overflow: auto;
}

#ListTable {
	width: 1000px;
	/* border-collapse: collapse; */
}

#ListTable th {
	height: 50px;
	position: sticky;
	top: 0px;
	background-color: #F0F0F0;
}


.popUpdate {
	position: absolute;
	z-index: 1;
	top: 0;
	width: 100%;
	height: 100%;
	display: none;
}

.popUpdate>article {
	width: 500px;
	height: 400px;
	position: relative;
	z-index: 2;
	background: white;
	box-shadow: 3px 3px 5px black;
	margin: auto;
	cursor: pointer;
	text-align: center;
}
.black { background:rgba(0,0,0,0.6); }
</style>
<body>

	<%
List<MemberDto> list = (List<MemberDto>) request.getAttribute("allmem");
%>
	<h1>회원 조회</h1>


	<div class="container">
		<table id="ListTable" class="table table-hover">
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
				<th>상태변경</th>
			</tr>

			<%
		for (int i = 0; i < list.size(); i++) {
	
			MemberDto dto = list.get(i);
			String s = Integer.toString(i);
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
					<button class="btn btn-primary" id=infoUpdate<%= s %> >수정</button>

				</td>
				<td>
					<button  class="btn btn-danger" id=stateUpdate<%= s %>>변경</button>
				</td>

				<%-- <td class="hidden-col">

				<div class="pop2">
					<article>
						<h1>회원 상태 변경</h1>
						<h2><%=dto.toString()%></h2>

						<button class="popclose">나가기</button>
					</article>
				</div>
			</td> --%>
			</tr>

			<div class=popUpdate id=popUpdate<%= s %>>
				<article>
				<br>
				<h1>회원정보 수정</h1>
				<h2>아이디 : <%= dto.getId() %> 님</h2>
							
				<br>
				
				<form action= "modifyName.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">				
				이름 변경 : <input type="text" id=name<%= s %> name=name placeholder="변경할 이름"> 
				<button type="submit" id=nameBtn<%= s %> class="btn btn-secondary btn-sm">변경</button>
				</form>		
			
				<form action= "modifyEmail.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">	
				<br> email 변경 : <input type="email" id=email<%= s %> name=email placeholder="변경할 email">
				<button type="submit" id=emailBtn<%= s %>  class="btn btn-secondary btn-sm">변경</button>
				</form>	
			
			
				<form action= "modifyContact.do" method="post">
				<input type="hidden" name=id value="<%= dto.getId() %>">	
				<br> 연락처 변경 : <input type="text" id=contact<%= s %> name=contact  maxlength=13 placeholder="숫자만 입력" onkeyup="chk_tel(this.value,'contact<%= s %>')">					
				<button type="submit" id=conBtn<%= s %> class="btn btn-secondary btn-sm">변경</button>
				</form>	
				
				<br>	
				<br>	
				<br>	
				<br>	
					<button class="btn btn-secondary btn-sm" id=popclose<%= s %>>창닫기</button>
				</article>
				
				<script type="text/javascript">
				
			
				$(document).ready(function() {
					$("#infoUpdate"+<%= s %>+":first-of-type").click(function() {
						$("#popUpdate"+<%= s %>).fadeIn();
						$("#popUpdate"+<%= s %>).addClass("black");
					});
					$("#popclose"+<%= s %>).click(function() {
						$("#popUpdate"+<%= s %>).parent().fadeOut();
						location.href ="members.do";
					});
				});

				
				</script>
								
			</div>

			<%
		} %>

		</table>
	</div>




	<script type="text/javascript">


	//전화번호에 하이픈 자동으로 넣는 함수
		function chk_tel(str, id) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.substring(0, 2) == "02") {
				if (str.length < 3) {
					$("#" + id).val(str);
				} else if (str.length < 6) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2);
					$("#" + id).val(tmp);
				} else if (str.length < 10) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 3);
					tmp += '-';
					tmp += str.substr(5);
					$("#" + id).val(tmp);
				} else {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 4);
					tmp += '-';
					tmp += str.substr(6, 4);
					$("#" + id).val(tmp);
				}
			} else {
				if (str.length < 4) {
					$("#" + id).val(str);
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					$("#" + id).val(tmp);
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					$("#" + id).val(tmp);
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
		
		$("#" + id).val(tmp);
				}
			}
		}

	
	
	
	</script>
</body>