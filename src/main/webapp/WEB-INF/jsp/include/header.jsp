<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="d-flex align-items-center justify-content-between border-bottom border-info border-3">
	<p class="fs-1 p-2 fw-bold fst-italic">SHUSED</p>
	<div>
	
		<c:choose>
			<c:when test="${not empty userId}">
				<div class="small d-flex justify-content-end me-2">${nickname}님 환영합니다</div>
				<div class="d-flex justify-content-center">
					<div class="small"><a href="#" class="text-dark text-decoration-none fw-light me-2">마이페이지</a></div>
					<div class="small"><a href="/user/sign_out" class="text-dark text-decoration-none fw-light me-2">로그아웃</a></div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="small"><a href="/user/sign_in" class="text-dark text-decoration-none fw-light me-2">로그인</a></div>
			</c:otherwise>
		</c:choose>
		
		<div class="d-flex align-items-center justify-content-center mt-1">
			<input type="text" class="form-control" placeholder="검색">
			<button type="button" class="btn btn-outline-secondary"><i class="bi bi-search"></i></button>
		</div>
		
	</div>
			
</header>