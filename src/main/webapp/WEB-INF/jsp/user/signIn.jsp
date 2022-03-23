<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- bootstrap --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<%-- bootstrap icon--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  

<%-- css파일 --%>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<title>SHUSED 로그인</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section id="join-box">
			<div class="container mt-3 border">
			
				<%-- 로고 --%>
				<div>
					<div class="fs-1 fw-bold fst-italic text-center">SHUSED</div>
					<div class="fst-italic small text-danger text-center">I've never been afraid to fail.</div>
				</div>
				
				<form id="loginForm">
					<div id="input-item mb-3" class="p-3">
						<div class="small fw-bold p-1">아이디</div>
						<div class="d-flex">
							<input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
						</div>
							
						<div class="small fw-bold p-1 mt-2">비밀번호</div>
						<input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
							
						<button type="submit" class="btn btn-info w-100 text-light mt-4" id="joinBtn">로그인</button>
					</div>
				</form>
				
				<div class="d-flex align-items-center justify-content-center mt-1">
					<hr class="w-25"><span class="mx-5 text-secondary">또는</span><hr class="w-25">
				</div>
				
				<div class="d-flex align-items-center justify-content-center small mb-4 mt-2">
					<span class="me-2 text-secondary">계정이 없으신가요?</span><a href="/user/signup_view">회원가입</a>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit",function(e){
				e.preventDefault();
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == "") {
					alert("id를 입력하세요");
					return;
				}
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post"
					,url:"/user/sign_in"
					,data:{"loginId":loginId, "password":password}
					,success:function(data) {
						if(data.result == "success"){
							alert("환영합니다");
							location.href="/shoes/mainPage_view";
						} else {
							alert("아이디나 비밀번호가 틀렸습니다.");
						}
					}, error:function(){
						alert("에러발생");
					}
				});
			});
		});
	</script>
</body>
</html>