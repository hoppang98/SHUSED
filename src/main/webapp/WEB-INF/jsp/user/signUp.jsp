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

<title>SHUESD 회원가입</title>
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
				
				<%-- 아이디 --%>
				<div id="input-item mb-3" class="p-3">
					<div class="small fw-bold p-1">아이디</div>
					<div class="d-flex">
						<input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
						<button class="btn btn-danger badge duplicate-btn"  id="checkDuplicateIdBtn">id<br>중복체크</button>
					</div>
						<small class="text-danger d-none" id="duplicationId">이미 사용 중인 아이디입니다.</small>
						<small class="text-danger d-none" id="availableId">사용 가능한 아이디입니다.</small>
						
					<div class="small fw-bold p-1 mt-2">비밀번호</div>
					<input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
					<input type="password" class="form-control mt-1" placeholder="비밀번호 확인" id="passwordConfirmInput">
						<small class="text-danger d-none" id="confirmPassword">비밀번호가 일치하지 않습니다.</small>
						
					<div class="small fw-bold p-1 mt-2">닉네임</div>
					<div class="d-flex">
						<input type="text" class="form-control" placeholder="닉네임" id="nicknameInput">
						<button class="btn btn-danger badge duplicate-btn"  id="checkDuplicateNicknameBtn">닉네임<br>중복체크</button>
					</div>
						<small class="text-danger d-none" id="duplicationNickname">이미 사용 중인 닉네임입니다.</small>
						<small class="text-danger d-none" id="availableNickname">사용가능한 닉네임입니다.</small>
						
					<div class="small fw-bold p-1 mt-2">전화번호</div>
					<div class="d-flex">
						<input type="text" class="form-control" placeholder="ex) 010-0000-0000" id="phoneNumberInput">
						<button class="btn btn-danger badge duplicate-btn"  id="checkDuplicatePhoneNumberBtn">전화번호<br>중복체크</button>
					</div>
						<small class="text-danger d-none" id="notCorrectTypePhoneNumber">형식이 일치하지 않습니다.</small>
						<br>
						<small class="text-danger d-none" id="duplicationPhoneNumber">이미 사용 중인 전화번호입니다.</small>
						<small class="text-danger d-none" id="availablePhoneNumber">사용가능한 전화번호입니다.</small>
					
					<button class="btn btn-info w-100 text-light mt-2" id="joinBtn">회원가입</button>
					
					
					<div class="d-flex align-items-center justify-content-center mt-2">
						<hr class="w-25"><span class="mx-5 text-secondary">또는</span><hr class="w-25">
					</div>
					
					<div class="d-flex align-items-center justify-content-center small">
						<span class="me-2 text-secondary">이미 계정이 있으신가요?</span><a href="/user/signin_view">로그인</a>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(document).ready(function(){
			
			// 중복체크와 형식 확인이 되어있지 않으면 회원가입을 못하도록 설정
			var isDuplicateId = true;
			var isIdCheck = false;
			var isDuplicateNickname = true;
			var isNicknameCheck = false;
			var isDuplicatePhoneNumber = true;
			var isPhoneNumberCheck = false;
			var isPhoneNumberFormatCheck = false;
			
			// input에 입력이 있을 경우 중복체크 상태 초기화와 원래대로 버튼 색상 변경
			$("#loginIdInput").on("input", function() {
				$("#duplicationId").addClass("d-none");
				$("#availableId").addClass("d-none");
				$("#checkDuplicateIdBtn").addClass("btn-danger");
				$("#checkDuplicateIdBtn").removeClass("btn-info");
				isIdCheck = false;
				isDuplicateId = true;
			});
			
			$("#nicknameInput").on("input", function() {
				$("#duplicationNickname").addClass("d-none");
				$("#availableNickname").addClass("d-none");
				$("#checkDuplicateNicknameBtn").addClass("btn-danger");
				$("#checkDuplicateNicknameBtn").removeClass("btn-info");
				isNicknameCheck = false;
				isDuplicateNickname = true;
			});
			
			$("#phoneNumberInput").on("input", function() {
				$("#duplicationPhoneNumber").addClass("d-none");
				$("#availablePhoneNumber").addClass("d-none");
				$("#checkDuplicatePhoneNumberBtn").addClass("btn-danger");
				$("#checkDuplicatePhoneNumberBtn").removeClass("btn-info");
				isPhoneNumberCheck = false;
				isDuplicatePhoneNumber = true;
			});
			

			
			// 전화번호 형식 확인
            $('#phoneNumberInput').keyup(function(){
                var phoneNumber = $("#phoneNumberInput").val();
                if (phoneNumber.length == 13) {
                	if(phoneNumber.charAt(3) == "-") {
                		if(phoneNumber.charAt(8) == "-") {
                   			$('#notCorrectTypePhoneNumber').addClass('d-none');
                   			isPhoneNumberFormatCheck = true;
                		}
                	}
                } else {
                	$('#notCorrectTypePhoneNumber').removeClass('d-none');
                }
            });
            
			
			
        	// id중복체크 버튼
        	 $("#checkDuplicateIdBtn").on("click", function() {
        		 
        		 var loginId = $("#loginIdInput").val();
        		 
        		 if(loginId == ""){
 					alert("아이디를 입력하세요");
 					return;
 				}
        		 
        		 $.ajax({
        			 type:"get"
        			 ,url:"/user/is_duplicate_id"
        			 ,data:{"loginId":loginId}
        		 	 ,success:function(data) {
        		 		isIdCheck = true;
        		 		
        		 		if(data.isDuplicate == true) { // 중복인 경우
							isDuplicateId = true;
							$("#duplicationId").removeClass("d-none");
							$("#availableId").addClass("d-none");
							$("#checkDuplicateIdBtn").removeClass("btn-info");
							$("#checkDuplicateIdBtn").addClass("btn-danger");
						} else { 						//중복이 아닌 경우
							isDuplicateId = false;
							$("#availableId").removeClass("d-none");
							$("#duplicationId").addClass("d-none");
							$("#checkDuplicateIdBtn").removeClass("btn-danger");
							$("#checkDuplicateIdBtn").addClass("btn-info");
						}
        		 	 }, error:function(){
        		 		 alert("에러발생");
        		 	 }
        		 });
        	 });

        	
        	 // 닉네임 중복체크 버튼
        	 $("#checkDuplicateNicknameBtn").on("click", function() {
        		 
        		 var nickname = $("#nicknameInput").val();
        		 
        		 if(nickname == ""){
 					alert("닉네임을 입력하세요");
 					return;
 				}
        		 
        		 $.ajax({
        			 type:"get"
        			 ,url:"/user/is_duplicate_nickname"
        			 ,data:{"nickname":nickname}
        		 	 ,success:function(data) {
        		 		 isNicknameCheck = true;
        		 		 
         		 		if(data.isDuplicate == true) { // 중복인 경우
							isDuplicateNickname = true;
							$("#duplicationNickname").removeClass("d-none");
							$("#availableNickname").addClass("d-none");
							$("#checkDuplicateNicknameBtn").removeClass("btn-info");
							$("#checkDuplicateNicknameBtn").addClass("btn-danger");
						} else { 						//중복이 아닌 경우
							isDuplicateNickname = false;
							$("#availableNickname").removeClass("d-none");
							$("#duplicationNickname").addClass("d-none");
							$("#checkDuplicateNicknameBtn").removeClass("btn-danger");
							$("#checkDuplicateNicknameBtn").addClass("btn-info");
						}
        		 	 }, error:function(){
        		 		 alert("에러발생");
        		 	 }
        		 });
        	 });
        	 
        	 
        	 // 전화번호 중복체크 버튼
        	 $("#checkDuplicatePhoneNumberBtn").on("click", function() {
        		 
        		 var phoneNumber = $("#phoneNumberInput").val();
        		 
        		 if(phoneNumber == ""){
 					alert("전화번호를 입력하세요");
 					return;
 				}
        		 
        		 $.ajax({
        			 type:"get"
        			 ,url:"/user/is_duplicate_phoneNumber"
        			 ,data:{"phoneNumber":phoneNumber}
        		 	 ,success:function(data) {
        		 		 isPhoneNumberCheck = true;
        		 		 
         		 		if(data.isDuplicate == true) { // 중복인 경우
         		 			if(isPhoneNumberFormatCheck == false) {
         		 				alert("전화번호 형식을 먼저 확인하세요");
         		 			} else {
								isDuplicatePhoneNumber = true;
								$("#duplicationPhoneNumber").removeClass("d-none");
								$("#availablePhoneNumber").addClass("d-none");
								$("#checkDuplicatePhoneNumberBtn").removeClass("btn-info");
								$("#checkDuplicatePhoneNumberBtn").addClass("btn-danger");
         		 			}
						} else { 						//중복이 아닌 경우
							if(isPhoneNumberFormatCheck == false) {
         		 				alert("전화번호 형식을 먼저 확인하세요");
         		 			} else {
								isDuplicatePhoneNumber = false;
								$("#availablePhoneNumber").removeClass("d-none");
								$("#duplicationPhoneNumber").addClass("d-none");
								$("#checkDuplicatePhoneNumberBtn").removeClass("btn-danger");
								$("#checkDuplicatePhoneNumberBtn").addClass("btn-info");
         		 			}
						}
        		 	 }, error:function(){
        		 		 alert("에러발생");
        		 	 }
        		 });
        	 });
        	 
        	 
        	 
        	// 회원가입 버튼 클릭
			$("#joinBtn").on("click", function(){
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var nickname = $("#nicknameInput").val();
				var phoneNumber = $("#phoneNumberInput").val();
				
				if(isIdCheck == false) {
					alert("id 중복상태를 체크하세요");
					return;
				}
				if(isDuplicateId) {
					alert("중복된 id입니다");
					return;
				}
				
				if(isNicknameCheck == false) {
					alert("닉네임 중복상태를 체크하세요");
					return;
				}
				if(isDuplicateNickname) {
					alert("중복된 닉네임입니다");
					return;
				}
				
				if(isPhoneNumberFormatCheck == false) {
					alert("전화번호 형식을 확인하세요");
					return;
				}
				if(isPhoneNumberCheck == false) {
					alert("전화번호 중복상태를 체크하세요");
					return;
				}
				if(isDuplicatePhoneNumber) {
					alert("중복된 전화번호입니다");
					return;
				}
				

				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					$("#confirmPassword").removeClass("d-none");
					
					return;
				}
				
				$.ajax({
					type:"post"
					,url:"/user/sign_up"
					,data:{"loginId":loginId, "password":password, "nickname":nickname, "phoneNumber":phoneNumber}
					,success:function(data){
						if(data.result == "success") {
							alert("회원가입을 축하합니다");
							location.href="/user/signin_view";
						} else {
							alert("회원가입 실패");
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