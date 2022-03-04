<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>SHUSED</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<!-- 로고 이미지 -->
		<div class="d-flex justify-content-around align-items-center border-bottom border-info border-3 mt-2">
			<div class="mb-2">
				<img src="/static/image/adidas logo.jpg" class="logoImage">
				<img src="/static/image/jordan logo.png" class="logoImage">
				<img src="/static/image/new balance logo.png" class="logoImage">
				<img src="/static/image/nike_logo_thumbnail.png" class="logoImage">
			</div>
		</div>
		
		<!-- 버튼 -->
		<div class="d-flex justify-content-around align-items-center my-3">
			<button type="button" id="sellBtn" class="btn btn-info w-50 me-2 fs-1 fw-bold">SELL</button>
			<button type="button" id="sellBtn" class="btn btn-info w-50 fs-1 fw-bold">COMMUNITY</button>
		</div>
		
		<!-- 최근 등록 상품 -->
		<div class="border border-3 rounded p-2">
			<span class="fw-bold fst-italic">Recently Added</span>
			<br>
			<span class="fst-italic">최근 등록 상품</span>
			<div class="d-flex">
				<c:forEach var="DroppedShoesList" items="${DroppedShoesList}">
					<div class="m-3">
						<img src="${DroppedShoesList.imagePath}" class="droppedShoes-image">
						<span>${DroppedShoesList.category}</span>
						<br>
						<span>${DroppedShoesList.modelNumber}</span>
						<br>
						<span>${DroppedShoesList.shoesName}</span>
						<br>
						<span>발매일 : </span><fmt:formatDate value="${DroppedShoesList.date}" pattern="yyyy년 MM월 dd일" />
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>