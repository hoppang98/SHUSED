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
<title>SHUSED 마이페이지</title>
</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/jsp/include/header.jsp" />

		<div class="d-flex justify-content-around align-items-center my-3">
			<button type="button" class="btn btn-info w-50 me-2 fs-2 fw-bold text-white" id="myShoesBtn">나의 판매 물품 목록</button> 
			<button type="button" class="btn btn-info w-50 me-2 fs-2 fw-bold text-white" id="myCommunityBtn">나의 커뮤니티 게시글</button>
		</div>

		<div>
			<table class="table text-center border d-none" id="myCommunity">
				<thead>
					<tr>
						<th><p class="fw-bold fs-5">NO.</p></th>
						<th><p class="fw-bold fs-5">제목</p></th>
						<th><p class="fw-bold fs-5">작성일</p></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${myPostlist}">
						<tr>
							<td>${post.id}</td>
							<td><a href="/community/detailPost_view?postId=${post.id}">${post.subject}</a>
							</td>
							<td><fmt:formatDate value="${post.createdAt}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<div class="d-flex" id="myShoes">
			<div class="scroll-wrap">
				<c:forEach var="myUsedShoesList" items="${myUsedShoesList}">
					<div class="scroll-element">
						<div class="card" style="width:260px;">
							<a href="/shoes/detail_view?UsedShoesListId=${myUsedShoesList.id}">
								<c:forEach var="SelectInputFileListForMypage" items="${SelectInputFileListForMypage}">
									<c:if test="${SelectInputFileListForMypage.usedShoesId eq myUsedShoesList.id}">
										<img src="${SelectInputFileListForMypage.imagePath}" class="card-img-top" style="height: 200px;">
									</c:if>
								</c:forEach>
							</a>
							<div class="card-body">
								<h5 class="card-title">판매 ID : ${myUsedShoesList.id}</h5>
								<c:choose>
									<c:when test="${fn:length(myUsedShoesList.shoesName) <= 20}">
										<span>${myUsedShoesList.shoesName}</span>
									</c:when>
									<c:otherwise>
										<span>${fn:substring(myUsedShoesList.shoesName, 0, 20)}...</span>
									</c:otherwise>
								</c:choose>
								<p class="card-text"></p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">카테고리 : ${myUsedShoesList.category}</li>
								<li class="list-group-item">모델명 : ${myUsedShoesList.modelNumber}</li>
								<li class="list-group-item">사이즈 : ${myUsedShoesList.size}</li>
								<li class="list-group-item">가격 : ${myUsedShoesList.price}원</li>
								<c:choose>
									<c:when test="${myUsedShoesList.dealMethod eq 'post'}">
										<li class="list-group-item">거래방법 : 택배거래</li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item">거래방법 : 직거래</li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${myUsedShoesList.state eq true}">
										<li class="list-group-item">판매여부 : 판매중</li>
									</c:when>
									<c:otherwise>
										<li class="list-group-item">판매여부 : 판매완료</li>
									</c:otherwise>
								</c:choose>
								
							</ul>
							<div class="card-body d-flex justify-content-between">
								<a href="/shoes/detail_view?UsedShoesListId=${myUsedShoesList.id}" class="btn btn-primary w-50">상세보기</a> 
								<button type="button" class="btn btn-danger w-50 deleteShoesBtn" data-bs-toggle="modal" data-bs-target="#deleteModal" data-shoes-id="${myUsedShoesList.id}">삭제하기</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	
	
	<!-- 삭제 Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로가기</button>
					<button type="button" class="btn btn-danger" id="realDeleteBtn">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		$(document).ready(function() {
			$("#myShoesBtn").on("click", function(){
				$("#myCommunity").addClass("d-none");
				$("#myShoes").removeClass("d-none");
			});
			$("#myCommunityBtn").on("click", function(){
				$("#myCommunity").removeClass("d-none");
				$("#myShoes").addClass("d-none");
			});
			
			$(".deleteShoesBtn").on("click", function(e){
				e.preventDefault();
				let shoesId = $(this).data("shoes-id");
				$("#realDeleteBtn").data("shoes-id", shoesId);
			});
			
			$("#realDeleteBtn").on("click", function(e){
				e.preventDefault();
				let shoesId = $(this).data("shoes-id");
				
				$.ajax({
					type:"get"
					,url:"/shoes/delete"
					,data:{"shoesId":shoesId}
					,success:function(data) {
						if(data.result == "success"){
							alert("삭제 성공!");
							location.href="/shoes/mainPage_view";
						} else {
							alert("상품 판매자만 삭제가 가능합니다");
						}
					}, error:function(){
						alert("에러발생");
					}
				});
			});
		});
	</script>
	
	</div>
	
</body>
</html>