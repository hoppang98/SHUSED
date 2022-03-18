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
<title>SHUSED 마이페이지</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<div class="d-flex justify-content-around align-items-center my-3">
			<a href="#" class="btn btn-info w-50 me-2 fs-2 fw-bold text-white">나의 판매 물품 목록</a>
			<a href="#" class="btn btn-info w-50 me-2 fs-2 fw-bold text-white">나의 커뮤니티 게시글</a>
		</div>

		<div class="d-none">
			<table class="table text-center border">
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
							<td><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<c:forEach var="myUsedShoesList" items="${myUsedShoesList}">
			<div class="card" style="width: 18rem;">
				<img src="${myUsedShoesList.imagePath}" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">${myUsedShoesList.shoesName}</h5>
					<p class="card-text">${myUsedShoesList.price}</p>
					<a href="#" class="btn btn-primary">상세보기</a>
				</div>
			</div>
		</c:forEach>
		
		
		
	</div>
</body>
</html>