<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<a href="/shoes/search_view?searchKeyword=adidas"><img src="/static/image/adidas logo.jpg" class="logoImage"></a>
				<a href="/shoes/search_view?searchKeyword=jordan"><img src="/static/image/jordan logo.png" class="logoImage"></a>
				<a href="/shoes/search_view?searchKeyword=newbalance"><img src="/static/image/new balance logo.png" class="logoImage"></a>
				<a href="/shoes/search_view?searchKeyword=nike"><img src="/static/image/nike_logo_thumbnail.png" class="logoImage"></a>
			</div>
		</div>
		
		<!-- 버튼 -->
		<div class="d-flex justify-content-around align-items-center my-3">
			<a href="/shoes/usedShoes_view" class="btn btn-info w-50 me-2 fs-1 fw-bold">SELL</a>
			<a href="/community/main_view" class="btn btn-info w-50 me-2 fs-1 fw-bold">COMMUNITY</a>
		</div>
		
		
		<!-- 최근 등록 상품 -->
		<div class="border border-3 rounded p-2">
			<span class="fw-bold fst-italic">Recently Added</span>
			<br>
			<span class="fst-italic">최근 등록 상품</span>
			<div class="scroll-wrap">
				<div class="d-flex scroll-element">
					<c:forEach var="UsedShoesList" items="${UsedShoesList}">
						<div class="m-3">
							<a href="/shoes/detail_view?UsedShoesListId=${UsedShoesList.id}">
								<img src="${UsedShoesList.imagePath}" class="mainPageShoes-image">
							</a>
							
							<br>
							<span>${UsedShoesList.category}</span>
							<br>
							
							<c:choose>
								<c:when test="${fn:length(UsedShoesList.shoesName) <= 23}" >
									<span>${UsedShoesList.shoesName}</span>
								</c:when>
								<c:otherwise>
									<span>${fn:substring(UsedShoesList.shoesName, 0, 23)}...</span>
								</c:otherwise>
							</c:choose>
							<br>
							
							
							
							
							<span>사이즈 : ${UsedShoesList.size}</span>
							<br>
							
							<span>상태 : </span>
							<c:choose>
								<c:when test="${UsedShoesList.condition eq 'new'}">
									새 것
								</c:when>
								<c:when test="${UsedShoesList.condition eq 'almostNew'}">
									거의 새 것
								</c:when>
								<c:when test="${UsedShoesList.condition eq 'normal'}">
									보통
								</c:when>
								<c:when test="${UsedShoesList.condition eq 'bad'}">
									나쁨
								</c:when>
							</c:choose>
							<br>
							
							<span>판매가 : ${UsedShoesList.price}원</span>
							<br>
							
							<span>거래방식 : </span>
							<c:choose>
								<c:when test="${UsedShoesList.dealMethod eq 'post'}">
									택배거래
								</c:when>
								<c:otherwise>
									직거래
								</c:otherwise>
							</c:choose>
							<br>
							
							<span>판매여부 : </span>
							<c:choose>
								<c:when test="${UsedShoesList.state eq true}">
									판매중
								</c:when>
								<c:otherwise>
									판매완료
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<hr>
		
		
		<!-- 최근 발매 상품 -->
		<div class="border border-3 rounded p-2">
			<span class="fw-bold fst-italic">Just Dropped</span>
			<br>
			<span class="fst-italic">최근 발매 상품</span>
			<div class="scroll-wrap">
			<div class="d-flex scroll-element">
				<c:forEach var="DroppedShoesList" items="${DroppedShoesList}">
					<div class="m-3">
						<a href="/shoes/search_view?searchKeyword=${DroppedShoesList.modelNumber}">
							<img src="${DroppedShoesList.imagePath}" class="mainPageShoes-image">
						</a>
						<br>
						<span>${DroppedShoesList.category}</span>
						<br>
						<span>${DroppedShoesList.modelNumber}</span>
						<br>
						
						
						<c:choose>
							<c:when test="${fn:length(DroppedShoesList.shoesName) <= 23}" >
								<span>${DroppedShoesList.shoesName}</span>
							</c:when>
							<c:otherwise>
								<span>${fn:substring(DroppedShoesList.shoesName, 0, 23)}...</span>
							</c:otherwise>
						</c:choose>
						<br>
						
						<span>발매일 : </span><fmt:formatDate value="${DroppedShoesList.date}" pattern="yyyy년 MM월 dd일" />
					</div>
				</c:forEach>
			</div>
			</div>
		</div>
		
		<a href="/shoes/droppedShoes_view" class="btn btn-info">발매 신발 등록</a>
		

	</div>
</body>
</html>