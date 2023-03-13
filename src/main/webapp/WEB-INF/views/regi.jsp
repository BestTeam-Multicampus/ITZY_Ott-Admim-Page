<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin 관리자 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<style type="text/css">

</style>

</head>
<body>

	<section class="vh-100" style="width: 500px; margin: auto; margin-top: 5%;">
		<form action="regiAf.do" method="post" id="regiForm2">
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<input id=companyId name="id" class="form-control" placeholder="로그인시 사용할 아이디" type="text">
				<button type="button" id="BizidChkBtn" class="btn btn-danger">id check</button>
			</div>
			<p id="Bizidcheck" style="margin-left: 10px;"></p>


			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-user"></i>
					</span>
				</div>
				<input id=company name="company" class="form-control" placeholder="회사 이름" type="text">
			</div>
			<!-- form-group// -->

			<p id="idcheck" style="margin-left: 10px;"></p>

			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="Bizemail" name="email" class="form-control" placeholder="이메일주소" type="email">
			</div>
			<!-- form-group// -->

			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-phone"></i>
					</span>
				</div>
				<input type="text" id="contact" name="contact" class="form-control" maxlength="13" placeholder=" '-' 없이 숫자만 입력해주세요" onkeyup="chk_tel(this.value,'contact')">
			</div>
			<!-- form-group end.// -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="biz_pw1" name="pwd" class="form-control" placeholder="비밀번호" type="password">
			</div>
			<!-- form-group// -->

			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="biz_pw2" class="form-control" placeholder="비밀번호 확인" type="password">
			</div>
			<p id="biz_pw_ck" style="margin-left: 10px;"></p>
			<!-- form-group// -->

			<div class="form-group"></div>
			<!--tab-->
			<button type="button" id="regi1Btn2" class="btn btn-primary btn-block">Create Account</button>
			<div>
				<p class="text-center">
					Have an account? <a href="login.do">Log In</a>
				</p>
			</div>
		</form>
	</section>

	<script type="text/javascript">
		//기업회원  아이디 중복 확인
		$(document).ready(function() {

			$("#BizidChkBtn").click(function() {
				// id의 빈칸을 조사!

				$.ajax({
					type : "post",

					url : "idcheck.do",
					data : {
						"id" : $("#companyId").val()
					},

					success : function(msg) {
						if (msg == "YES") {
							$("#Bizidcheck").css("color", "#0000ff");
							$("#Bizidcheck").text("사용할 수 있는 아이디입니다");
						} else {
							$("#Bizidcheck").css("color", "#ff0000");
							$("#Bizidcheck").text("사용중인 아이디입니다");
							$("#companyId").val("");
						}
					},
					error : function() {
						alert('error');
					}
				});
			});
		});

		// 기업회원 비밀번호 확인
		$(function() {
			$('#biz_pw1').keyup(function() {
				$('#biz_pw_ck').text('');
			});

			$('#biz_pw2').keyup(function() {

				if ($('#biz_pw1').val() != $('#biz_pw2').val()) {
					$("#biz_pw_ck").css("color", "#ff0000");
					$('#biz_pw_ck').text('비밀번호 일치하지 않음');

				} else {
					$("#biz_pw_ck").css("color", "#0000ff");
					$('#biz_pw_ck').text('비밀번호 일치');

				}

			});
		});

		//기업회원 회원가입 빈칸알럿
		$(function() {
			// .submit() -> 해당 form에서 sunmit 이벤트가 발생했을 때, 실행
			$("#regi1Btn2").click(
					function() {
						if ($("#company").val().trim() == "") {
							alert("회사명을 입력하세요");
						} else if ($("#companyId").val().trim() == "") {
							alert("아이디를 입력하세요");
						} else if ($("#Bizemail").val().trim() == "") {
							alert("이메일을 입력하세요");
						} else if ($("#contact").val().trim() == "") {
							alert("전화번호를 입력하세요");
						} else if ($("#biz_pw1").val().trim() == "") {
							alert("비밀번호를 입력하세요");
						} else if ($("#biz_pw2").val().trim() == "") {
							alert("확인 비밀번호를 입력하세요");
						} else if ($("#biz_pw2").val().trim() != $("#biz_pw1")
								.val().trim()) {
							alert("비밀번호가 다릅니다");
						} else {
							$("#regiForm2").submit();
						}
					});
		});

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
</html>