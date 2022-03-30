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
<title>검색하기</title>
</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		
		<div class="d-flex justify-content-center p-3">
			<span class="fs-2 fw-bold fst-italic">검색어 : ${searchKeyword}</span>
		</div>
		
		<div class="d-flex p-3">
			<div class="scroll-wrap">
				<c:forEach var="usedShoesSearchList" items="${usedShoesSearchList}">
					<div class="scroll-element">
						<div class="card" style="width:260px;">
							<a href="/shoes/detail_view?UsedShoesListId=${usedShoesSearchList.id}">
							<c:forEach var="SelectInputFileListForSearch" items="${SelectInputFileListForSearch}">
								<c:if test="${SelectInputFileListForSearch.usedShoesId eq usedShoesSearchList.id}">
										<img src="${SelectInputFileListForSearch.imagePath}" class="card-img-top" style="height: 200px;">
								</c:if>
							</c:forEach>
							</a>
							<div class="card-body">
								<h5 class="card-title">판매 ID : ${usedShoesSearchList.id}</h5>
								<c:choose>
									<c:when test="${fn:length(usedShoesSearchList.shoesName) <= 20}">
										<span>${usedShoesSearchList.shoesName}</span>
									</c:when>
									<c:otherwise>
										<span>${fn:substring(usedShoesSearchList.shoesName, 0, 20)}...</span>
									</c:otherwise>
								</c:choose>
								<p class="card-text"></p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">카테고리 : ${usedShoesSearchList.category}</li>
								<li class="list-group-item">모델명 : ${usedShoesSearchList.modelNumber}</li>
								<li class="list-group-item">사이즈 : ${usedShoesSearchList.size}</li>
								<li class="list-group-item">가격 : ${usedShoesSearchList.price}원</li>
								<c:choose>
									<c:when test="${usedShoesSearchList.dealMethod eq 'post'}">
										<li class="list-group-item">거래방법 : 택배거래</li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item">거래방법 : 직거래</li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${usedShoesSearchList.state eq true}">
										<li class="list-group-item">판매여부 : 판매중</li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item">판매여부 : 판매완료</li>
									</c:otherwise>
								</c:choose>

							</ul>
							<div class="card-body d-flex justify-content-between">
								<a href="/shoes/detail_view?UsedShoesListId=${usedShoesSearchList.id}" class="btn btn-primary w-50">상세보기</a> 
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		
	</div>
</body>
</html>