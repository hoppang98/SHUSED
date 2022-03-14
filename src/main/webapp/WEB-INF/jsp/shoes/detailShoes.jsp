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

<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>  
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- bootstrap icon--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<%-- css파일 --%>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<title>신발 상세보기</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<div class="d-flex justify-content-center fs-1 fw-bold p-3">상품정보</div>
		<hr>
		
		<div class="ms-5">
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>모델번호 &nbsp&nbsp</span>
				<span class="fw-bold">${usedShoes.modelNumber}</span>
			</div>
			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>제품명 &nbsp&nbsp</span>
				<span class="fw-bold">${usedShoes.shoesName}</span>
			</div>
			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>가격 &nbsp&nbsp</span>
				<span class="fw-bold">${usedShoes.price} 원</span>
			</div>
			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>사이즈 &nbsp&nbsp</span>
				<span class="fw-bold">${usedShoes.size}</span>
			</div>
			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>상태 &nbsp&nbsp</span>
				<c:choose>
					<c:when test="${usedShoes.condition eq 'new'}">
						<span class="fw-bold">새 것</span>
					</c:when>
					<c:when test="${usedShoes.condition eq 'almostNew'}">
						<span class="fw-bold">거의 새 것</span>
					</c:when>
					<c:when test="${usedShoes.condition eq 'normal'}">
						<span class="fw-bold">보통</span>
					</c:when>
					<c:when test="${usedShoes.condition eq 'bad'}">
						<span class="fw-bold">나쁨</span>
					</c:when>
				</c:choose>
			</div>
			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>거래방식 &nbsp&nbsp</span>
				<c:choose>
					<c:when test="${usedShoes.dealMethod eq 'post'}">
						<span class="fw-bold">택배거래</span>
					</c:when>
					<c:otherwise>
						<span class="fw-bold">직거래</span>
					</c:otherwise>
				</c:choose>
			</div>
			
			<c:choose>
				<c:when test="${usedShoes.dealMethod eq 'direct'}">
					<div class="d-flex justify-content-start fs-3 p-3">
						<span>거래지역 &nbsp&nbsp</span>
						<span class="fw-bold">${usedShoes.place}</span>
					</div>
				</c:when>
			</c:choose>

			
			<div class="d-flex justify-content-start fs-3 p-3">
				<span>상품설명 &nbsp&nbsp</span>
				<div class="d-flex justify-content-start align-items-center">
					<span class="fs-6">${usedShoes.explanation}</span>
				</div>
			</div>
			
			<hr>
			<div class="d-flex justify-content-center fs-2 fw-bold p-1">상품이미지</div>
			
			<img src="${usedShoes.imagePath}" class="mainPageShoes-image">
			
			<div class="d-flex justify-content-end">
				<button class="btn btn-info text-white">상품 구매하기</button>
			</div>
			
			
		</div>
		
	</div>
</body>
</html>