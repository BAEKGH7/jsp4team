<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서정보 입력</title>
<link rel="stylesheet" href="../css/category.css">
<link rel="stylesheet" href="../css/index.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- <link rel="stylesheet" href="./css/menu.css"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
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

	<header>
		<div class="top1">
			<img class="logoImg" alt="logo" src="../img/logo.png" onclick="location.href='../'" width="300px;">
			<div class="search">
				<div class="input-group mb-3 searchInputGroup">
				  <input type="text" class="form-control searchText" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
				  <button class="btn btn-outline-secondary btn-jelly searchBtn" type="button" id="button-addon2">검색</button>
				</div>
			</div>
			<%-- <div class="joinLogin"> <c:choose> <c:when test="${sessionScope.mname eq null }">
				<button class="btn btn-jelly" onclick ="window.location.href='./join'">회원가입</button>
				<button class="btn btn-jelly" onclick ="window.location.href='./login'">로그인</button> </c:when> <c:otherwise>
				<button class="btn btn-jelly" onclick ="window.location.href='./basket'">장바구니</button>
				<button class="btn btn-jelly" onclick ="window.location.href='./logout'">로그아웃</button> </c:otherwise> </c:choose>
			</div> --%>
		</div>
		<div class="bhItem">
			<nav class="nav nav-pills bhNav">
			  <a class="nav-link menuItem" href="./newBooks">신간</a>
			  <a class="nav-link menuItem active" aria-current="page" href="./domestic">국내</a>
			  <a class="nav-link menuItem" href="./foreign">해외</a> <c:choose> <c:when test="${sessionScope.mname eq null }">
			  <a class="nav-link menuItem" href="./login">로그인</a> </c:when> <c:otherwise>
			  <a class="nav-link menuItem" href="./basket">장바구니</a>
			  <a class="nav-link menuItem" href="./logout">로그아웃</a> </c:otherwise> </c:choose>
			</nav>
		</div>
		<%-- <div class="top2">
			<div class="menu">
		<%@ include file="menu.jsp" %>
			</div>
		</div> --%>
	</header>
	<main>
	
	<section class="blContainer">
		<h1>도서 정보 입력 폼</h1>
		<form>
		
		</form>
	
	</section>
	
	</main>


</body>
</html>