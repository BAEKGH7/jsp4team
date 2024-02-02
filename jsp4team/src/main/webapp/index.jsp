<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당근서점</title>
<link rel="stylesheet" href="./css/menu.css">
<script type="text/javascript" src="./js/index.js">
	
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/index.css?ver=0.01">

</head>
<body>
	<div class="">
		<header>
			<div class="top1">
				<img alt="logo" src="./img/logo.png" width="300px;">
				<div class="search">
					<input class="searchText" type="text" placeholder="검색어 입력" color="#a8a8a8;">
					<button class="searchBtn">검색</button>
				</div>
				<div class="joinLogin">
					<button class="join">회원가입</button>
					<button class="login">로그인</button>
				</div>
			</div>
			<div class="top2">
				<div class="menu">
				<%@ include file="menu.jsp"%>
				</div>
			</div>
		</header>

		<section class="new">
			<div class="new1">
				<h3>당근서점, 화제의 신간</h3>
			<div class="new2">
			<c:forEach items="${bookNewList }" var="row">
				<div class="col">
					<div class="card h-100">
						<img src="${row.cover }" class="card-img-top" alt="newbook">
						<div class="card-body"></div>
						<div class="card-footer">
							<small class="text-body-secondary">${row.title}<br>${row.author}
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
				<c:forEach items="${bestBookList}" var="row1" begin="0" end="5">
					<div class="col">
						<div class="card h-100">
							<img src="${row1.cover }" class="card-img-top" alt="newbook1">
							<div class="card-body"></div>
							<div class="card-footer">
								<small class="text-body-secondary">${row1.title}<br>${row1.author}
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
				<c:forEach items="${bestFBookList}" var="row3" >
					<div class="col">
						<div class="card h-100">
							<img src="${row3.cover }" class="card-img-top" alt="newbook1">
							<div class="card-body"></div>
							<div class="card-footer">
								<small class="text-body-secondary">${row3.title }<br>${row3.author}
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