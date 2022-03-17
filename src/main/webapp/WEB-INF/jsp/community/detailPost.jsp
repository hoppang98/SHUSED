<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>COMMUNITY 게시글 상세보기</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		

		
		<section class="d-flex justify-content-center">
			<div class="w-75 my-5">
			
				<div class="fs-1 fw-bold fst-italic text-center">COMMUNITY</div>
				
					<div class="d-flex justify-content-end align-items-center">
						<a href="#" class="recommentBtn" data-post-id="${post.id}"> 
							<c:choose>
								<c:when test="${isRecommend}">
									<i class="bi bi-hand-thumbs-up-fill" style="font-size:2rem;"></i>
								</c:when>
								<c:otherwise>
									<i class="bi bi-hand-thumbs-up" style="font-size:2rem;"></i>
								</c:otherwise>
							</c:choose>
						</a>
						<span> 추천 ${recommendCount}개</span>
					</div>
					
				<div class="d-flex justify-content-center align-items-center mt-3">
					<span class="w-auto fs-5 fw-bold">제목 :&nbsp </span>
					<div>${post.subject}</div>
				</div>
				<br>
				<div class="border border-light border-1 rounded">
					${post.content}
				</div>
				<br>
				<div class="d-flex align-items-center justify-content-center">
					<img src="${post.imagePath}">
				</div>
				
				<table class="table text-center">
					<thead>
						<tr>
							<th class="col-2">작성자</th>
							<th>내용</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="commentList" items="${commentList}">
						<tr>
							<td class="fw-bold">${commentList.userNickname}</td>
							<td>
								${commentList.content}
							</td>
							<td>
								<fmt:formatDate value="${commentList.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" />
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="d-flex">
					<input type="text" class="form-control" placeholder="댓글 달기" id="comment${post.id}">
					<button type="button" class="btn btn-info commentInputBtn col-1 text-white" data-post-id="${post.id}">게시</button>
				</div>

				<div class="d-flex justify-content-between mt-3">
					<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${post.id}">삭제</button>
					
					<button type="button" class="btn btn-success" id="updateBtn">수정</button>
				</div>
			</div>

		</section>
		
					
		<div class="d-flex justify-content-between mt-3">
			<a href="/community/main_view" class="btn btn-info text-white">목록으로</a>
		</div>
	
		
		
		
		<script>
			$(document).ready(function(){
				$(".commentInputBtn").on("click", function() {
					let postId = $(this).data("post-id");
					let comment = $("#comment" + postId).val().trim(); 
					
					if(comment == "") {
						alert("내용을 입력하세요");
						return;
					}
					
					$.ajax({
						type:"post"
						,url:"/community/comment/create"
						,data:{"comment":comment, "postId":postId}
						,success:function(data) {
							if(data.result == "success"){
								alert("댓글 입력 성공");
								location.reload();
							} else {
								alert("댓글 입력 실패");
							}
						}, error:function(){
							alert("에러 발생");
						}
					});
				});
				
				$(".recommentBtn").on("click", function(e){
					e.preventDefault();
					let postId = $(this).data("post-id");
					
					$.ajax({
						type:"get"
							,url:"/recommend/like"
							,data:{"postId":postId}
							,success:function(data) {
								alert("좋아요");
								location.reload();
							},error:function(){
								alert("좋아요 에러 발생");
							}
					});
				});
			});
		</script>
		
	</div>
</body>
</html>