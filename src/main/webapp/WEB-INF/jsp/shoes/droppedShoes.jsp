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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- css파일 --%>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<title>SHUSED 최근 발매 상품 등록</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<div class="mt-4 ms-4">
			<span class="fs-3 fw-bold">발매정보</span>
			<hr>
			<span class="fs-5 fw-bold">카테고리</span>
	
			<!-- 카테고리 선택을 위한 로고 -->
			<div class="d-flex justify-content-around mb-2 mt-2">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="adidas" value="adidas" checked> 
					<label class="form-check-label" for="adidas"> 
						<img src="/static/image/adidas logo.jpg" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="jordan" value="jordan"> 
					<label class="form-check-label" for="jordan"> 
						<img src="/static/image/jordan logo.png" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="newBalance" value="newBalance"> 
					<label class="form-check-label" for="newBalance"> 
						<img src="/static/image/new balance logo.png" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="flexRadioDefault" id="nike" value="nike"> 
					<label class="form-check-label" for="nike"> 
						<img src="/static/image/nike_logo_thumbnail.png" class="logoImage-forDropped">
					</label>
				</div>
			</div>
			<hr>
			
			
			<div class="d-flex justify-content-between p-3 ms-5">
				<span>모델번호</span>
				<input type="text" class="form-control w-75" placeholder="ex) DD1391-100" id="modelNumberInput">
			</div>
			
			<div class="d-flex justify-content-between p-3 ms-5">
				<span>제품명</span>
				<input type="text" class="form-control w-75" placeholder="ex) Dunk Low Retro Black" id="shoesNameInput">
			</div>
			
			<div class="d-flex justify-content-between p-3 ms-5">
				<span>발매일자</span>
				<input type="text" class="form-control w-75" id="dateInput" name="date" placeholder="ex) 20-01-01">
			</div>
			
			<div class="d-flex justify-content-between p-3 ms-5">
				<span>제품 사진</span>
				<input type="file" id="fileInput" onchange="setThumbnail(event);" id="fileInput">
			</div>
			
			<!-- 썸네일 기능 -->
			<div class="d-flex justify-content-end">
				<div id="image_container"></div>
			</div>
			
			<div class="d-flex justify-content-end p-4">
				<button type="button" class="btn btn-lg btn-outline-secondary" id="recentlyDroppedBtn">등록하기</button>
			</div>
			
		</div>
	</div>
	
	
	<script>
	
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-8");
			document.querySelector("div#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
	
	$(document).ready(function() {
		
		 $.datepicker.setDefaults({
		        dateFormat: 'yy-mm-dd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		    });
		 
		$('#dateInput').datepicker({
			dateFormat : 'yy-mm-dd',
			changeMonth : true,
			changeYear : true
		});
		
		
		
		
		
		$("#recentlyDroppedBtn").on("click", function(){
			
			let category = $("input[name=flexRadioDefault]:checked").val();
			console.log(category);
			let modelNumber = $("#modelNumberInput").val().trim();
			let shoesName = $("#shoesNameInput").val().trim();
			let date = $("#dateInput").val();
			console.log(dateInput);
			
			
			if(modelNumber == "") {
				alert("제품번호를 입력해주세요");
			}
			if(shoesName == "") {
				alert("제품명을 입력해주세요");
			}
			if(dateInput == "") {
				alert("발매일자를 입력해주세요");
			}
			if($("#fileInput")[0].files.length == 0) {	
				alert("파일을 선택해주세요");
				return;
			}
			
			var formData = new FormData();
			formData.append("category", category);
			formData.append("modelNumber", modelNumber);
			formData.append("shoesName", shoesName);
			formData.append("date", date);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post"
				,url:"/shoes/dropped_shoes"
				,data:formData
				,enctype:"multipart/form-data"
				,processData:false
				,contentType:false
				,success:function(data) {
					if(data.result == "success") {
						alert("입력 성공");
						location.href="/shoes/mainPage_view"
					} else {
						alert("입력 실패");
					}
				},error:function(){
					alert("오류 발생");
				}
			});
		});
	});
	</script>
</body>
</html>


