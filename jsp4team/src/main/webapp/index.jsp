<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근서점</title>
<link rel="stylesheet" href="./css/menu.css">
<script type="text/javascript" src="./js/index.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="./css/index.css?ver=0.01">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript">
$(document).ready(function (){
	
	$('.searchBtn').click(function (){
		let searchItem = $('.searchText').val();
		window.location.href="./search?keyword=" + searchItem;
	});
	
});
</script>
</head>
<body>
	<div class="">
		<header>
			<div class="top1">
				<img class="logoImg" alt="logo" src="./img/logo.png" onclick="location.href='./'" width="300px;">
				<div class="search">
					<div class="input-group mb-3 searchInputGroup">
					  <input type="text" class="form-control searchText" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary btn-jelly searchBtn" type="button" id="button-addon2">검색</button>
					</div>
				</div>
				<!-- <div class="search">
					<div class="searchSet">
						<input class="searchText" type="text" placeholder="검색어 입력" color="#a8a8a8;">
						<button class="searchBtn">검색</button>
					</div>
				</div> -->
				<div class="joinLogin"> <c:choose> <c:when test="${sessionScope.mname eq null }">
					<button class="btn btn-jelly" onclick ="window.location.href='./join'">회원가입</button>
					<button class="btn btn-jelly" onclick ="window.location.href='./login'">로그인</button> </c:when> <c:otherwise>
					<button class="btn btn-jelly" onclick ="window.location.href='./myinfo'">마이페이지</button>
					<button class="btn btn-jelly" onclick ="window.location.href='./logout'">로그아웃</button> </c:otherwise> </c:choose>
				</div>
			</div>
			<div class="top2">
				<div class="menu">
				<%@ include file="menu.jsp"%>
				</div>
			</div>
		</header>
		
		<div class="carousel slide">
  			<div class="carousel-inner imgSize">
    			<div class="carousel-item active">
      				<img src="./img/ridi1.png" alt="ridi1">
    			</div>
    			<div class="carousel-item">
      				<img src="./img/ridi2.png" alt="ridi2">
    			</div>
    			<div class="carousel-item">
      				<img src="./img/ridi3.png" alt="ridi3">
    			</div>
  			</div>
  			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
   				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
   				<span class="visually-hidden">Previous</span>
  			</button>
  			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="visually-hidden">Next</span>
  			</button>
		</div>

		<section class="new">
			<div class="new1">
				<h3>당근서점, 화제의 신간</h3>
			<div class="new2">
			<c:forEach items="${newBook }" var="row">
				<div class="col">
					<div class="card h-100">
						<img src="${row.bookcover }" class="card-img-top" alt="newbook">
						<div class="card-body"></div>
						<div class="card-footer">
							<small class="text-body-secondary">${row.booktitle}<br>${row.author}
							</small>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
		</section>


		<section class="domestic">
			<div class="domestic1">
				<h3>국내도서 베스트셀러</h3>
				<div class="domestic2">
				<c:forEach items="${newDomestic}" var="row1" begin="0" end="5">
					<div class="col">
						<div class="card h-100">
							<img src="${row1.bookcover }" class="card-img-top" alt="newbook1">
							<div class="card-body"></div>
							<div class="card-footer">
								<small class="text-body-secondary">${row1.booktitle}<br>${row1.author}
								</small>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</section>

		<section class="foreign">
			<div class="foreign1">
				<h3>해외도서 베스트셀러</h3>
				<div class="foreign2">
				<c:forEach items="${newForeign }" var="row3" >
					<div class="col">
						<div class="card h-100">
							<img src="${row3.bookcover }" class="card-img-top" alt="newbook1">
							<div class="card-body"></div>
							<div class="card-footer">
								<small class="text-body-secondary">${row3.booktitle }<br>${row3.author}
								</small>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
		</section>
	</div>
</body>
</html>