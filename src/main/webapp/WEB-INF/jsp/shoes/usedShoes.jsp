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

<%-- jquery --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
 
<%-- bootstrap icon--%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

<%-- css파일 --%>
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
<title>SHUSED 판매 물품 등록</title>
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
					<input class="form-check-input" type="radio" name="categoryInput" id="adidas" value="adidas"> 
					<label class="form-check-label" for="adidas"> 
						<img src="/static/image/adidas logo.jpg" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="categoryInput" id="jordan" value="jordan"> 
					<label class="form-check-label" for="jordan"> 
						<img src="/static/image/jordan logo.png" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="categoryInput" id="newBalance" value="newbalance"> 
					<label class="form-check-label" for="newBalance"> 
						<img src="/static/image/new balance logo.png" class="logoImage-forDropped me-4">
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="categoryInput" id="nike" value="nike"> 
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
				<span>사이즈</span>
				<div class="input-label w-75">
				<select class="form-select" id="sizeInput">
					<option selected>사이즈 선택</option>
					<option value="230">230</option>
					<option value="235">235</option>
					<option value="240">245</option>
					<option value="245">245</option>
					<option value="250">250</option>
					<option value="255">255</option>
					<option value="260">260</option>
					<option value="265">265</option>
					<option value="270">270</option>
					<option value="275">275</option>
					<option value="280">280</option>
					<option value="285">285</option>
					<option value="290">290</option>
					<option value="295">295</option>
					<option value="300">300</option>
				</select>
				</div>
			</div>
			
			<div class="d-flex justify-content-between p-3 ms-5">
				<span>가격</span>
				<div class="w-75 d-flex">
					<input type="text" class="form-control w-75" placeholder="숫자만 입력해주세요" id="shoesPriceInput">
					<div class="col-1 d-flex justify-content-center align-items-center">
						<span class="text-center">원</span>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between p-3 ms-5">
				<span>상태</span>
				<div class="w-75">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="condition" id="new" value="new" checked> 
						<label class="form-check-label" for="new">
						 	새 것 
						 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="condition" id="almostNew" value="almostNew"> 
						<label class="form-check-label" for="almostNew">
							거의 새 것 
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="condition" id="normal" value="normal"> 
						<label class="form-check-label" for="normal"> 
							보통 
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="condition" id="bad" value="bad"> 
						<label class="form-check-label" for="bad"> 
							나쁨 
						</label>
					</div>
				</div>
			</div>



			<div class="d-flex justify-content-between p-3 ms-5">
				<span>거래방식</span>
				<div class="w-75">
					<div class="form-check">
						<input class="form-check-input" type="radio" name="dealMethod" id="direct" value="direct"> 
						<label class="form-check-label" for="direct">
						 	직거래
						 	<input type="text" class="form-control w-75 d-none" placeholder="ex) 서울 강남구" id="placeInput">
						 </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="dealMethod" id="post" value="post"> 
						<label class="form-check-label" for="post">
							택배거래
						</label>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between p-3 ms-5">
				<span>제품설명</span>
				<textarea class="form-control w-75" rows="10" id="explanationInput" placeholder="ex) 상품 설명을 입력해주세요. (10글자 이상) ex) 구입 시기, 착용 횟수"></textarea>
			</div>



			<div class="d-flex justify-content-between p-3 ms-5">
				<span>제품사진</span>
				<div class="d-flex justify-content-end">
					<input class="form-control form-control-user" type="file" multiple="multiple" name="fileInput" id="fileInput" onchange="setDetailImage(event);">
				</div>
			</div>
			<div id="images_container"></div>


			<div class="d-flex justify-content-end p-4">
				<button type="button" class="btn btn-lg btn-outline-secondary" id="usedShoesBtn">등록하기</button>
			</div>
			
		</div>
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


	$(document).ready(function() {
		
		$("[name=dealMethod]").on("click", function(){
			let dealMethod = $("input[name=dealMethod]:checked").val();
			if(dealMethod == "direct") {
				$("#placeInput").removeClass("d-none");
			} else {
				$("#placeInput").addClass("d-none");
			}
		});
		
		
		
		
		$("#usedShoesBtn").on("click", function(){
			let category = $("input[name=categoryInput]:checked").val();
			let modelNumber = $("#modelNumberInput").val().trim();
			let shoesName = $("#shoesNameInput").val().trim();
			let size = $("#sizeInput").val().trim();
			let price = $("#shoesPriceInput").val().trim();
			let condition = $("input[name=condition]:checked").val();
			let dealMethod = $("input[name=dealMethod]:checked").val();
			let explanation = $("#explanationInput").val();
			let state = true;
			let place = $("#placeInput").val();
			
			if(category == "" || category == null) {
				alert("카테고리를 선택해주세요");
				return;
			}
			if(modelNumber == "") {
				alert("모델번호를 입력해주세요");
				return;
			}
			if(shoesName == "") {
				alert("제품명을 입력해주세요");
				return;
			}
			if(size == "") {
				alert("사이즈를 선택해주세요");
				return;
			}
			if(price == "") {
				alert("가격을 입력해주세요");
				return;
			}
			if(condition == "") {
				alert("상태를 선택해주세요");
				return;
			}
			if(explanation == "") {
				alert("제품설명를 입력해주세요");
				return;
			}
			if($("#fileInput")[0].files.length == 0) {	
				alert("파일을 선택해주세요");
				return;
			}
			
			var formData = new FormData();

			formData.append("category", category);
			formData.append("modelNumber", modelNumber);
			formData.append("shoesName", shoesName);
			formData.append("size", size);
			formData.append("price", price);
			formData.append("condition", condition);
			formData.append("dealMethod", dealMethod);
			formData.append("explanation", explanation);
			formData.append("state", state);
			formData.append("place", place);
			formData.append("uploadFile", $("#fileInput")[0].files[0]);
			
			//var inputFile = $("input[name='fileInput']");
			//var files = inputFile[0].files;
			//console.log(files);
			//for(var i = 0; i < files.length; i++){
			//	formData.append("uploadFile", files[i]);
			//}
			
			
			$.ajax({
				type:"post"
				,url:"/shoes/usedShoes"
				,data:formData
				,enctype:"multipart/form-data"
				,processData:false
				,contentType:false
				,success:function(data) {
					if(data.result == "success") {
						alert("입력 성공");
						location.href="/shoes/mainPage_view";
					} else {
						alert("입력 실패");
					}
				}, error:function(){
					alert("오류 발생");
				}
			});
		});
	});
	
	
	</script>
</body>
</html>