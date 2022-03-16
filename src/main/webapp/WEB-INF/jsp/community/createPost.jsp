<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>COMMUNITY 게시글 입력</title>
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<div class="w-75 my-5">
				<div class="fs-1 fw-bold fst-italic text-center">COMMUNITY</div>
				<div class="fs-4 fw-bold fst-italic text-center">게시글 입력</div>
				
				<div class="d-flex justify-content-center align-items-center mt-3">
					<span class="w-auto fs-5 fw-bold">제목 :&nbsp </span>
					<input type="text" class="form-control w-75" id="titleInput" placeholder="제목을 입력하세요">
				</div>
				
				<textarea class="form-control mt-3" rows="5" id="contentInput" placeholder="내용을 입력하세요"></textarea>
				
				<div class="d-flex justify-content-between mt-2">
					<i class="bi bi-card-image me-2" id="imgBtn" style="font-size:2rem;"></i>
					<input type="file" id="fileInput" class="d-none" onchange="setDetailImage(event);">
					<button type="button" class="btn btn-success" id="saveBtn" style="height:35px;">등록</button>
				</div>
				<div id="images_container"></div>
			</div>
			
			
		</section>
		
		<div class="d-flex justify-content-between mt-3">
			<a href="/community/main_view" class="btn btn-info text-white">목록으로</a>
		</div>
		
		
		<script>
		
		function setDetailImage(event){
			for(var image of event.target.files){
				var reader = new FileReader();
				
				reader.onload = function(event){
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "col-lg-4");
					document.querySelector("div#images_container").appendChild(img);
				};
				console.log(image);
				reader.readAsDataURL(image);
			}
		}
		
		
		$(document).ready(function(){
			$("#imgBtn").on("click", function(){
				$("#fileInput").click();
			});
			
			$("#saveBtn").on("click", function(){
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				
				if(title == "") {
					alert("제목을 입력하세요");
					return;
				}
				if(content == "") {
					alert("내용을 입력해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("subject", title);
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					,url:"/community/postCreate"
					,data:formData
					,enctype:"multipart/form-data"		
					,processData:false				
					,contentType:false		
					,success:function(data){
						if(data.result == "success"){
							alert("게시글 입력 성공");
							location.href="/community/main_view";
						} else {
							alert("게시글 입력 실패");
						}
					}
					,error:function(){
						alert("에러발생");
					}
					
				});
			});
			
		});
		</script>
	</div>
</body>
</html>