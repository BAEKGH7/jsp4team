<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="./css/login.css">
<link rel="stylesheet" href="./css/menu.css">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/login.js"></script>
<script type="text/javascript">
	function err(){
		let errBox = document.querySelector("#errorMSG");
		errBox.innerHTML = "<b>올바른 id와 pw를 입력하세요.</b>";
		errBox.style.color = 'red';
		errBox.style.fontsize = "10pt";
	}
</script>

</head>
<body>
		<header>
			<div class="top1">
				<img alt="logo" src="./img/logo.png" width="300px;">
				<div class="search">
					<input class="searchText" type="text" placeholder="검색어 입력" color="#a8a8a8;">
					<button class="searchBtn">검색</button>
				</div>
				<div class="joinLogin"> <c:choose> <c:when test="${sessionScope.mname eq null }">
					<button class="btn btn-jelly" onclick ="window.location.href='./join'">회원가입</button>
					<button class="btn btn-jelly" onclick ="window.location.href='./login'">로그인</button> </c:when> <c:otherwise>
					<button class="btn btn-jelly" onclick ="window.location.href='./basket'">장바구니</button>
					<button class="btn btn-jelly" onclick ="window.location.href='./logout'">로그아웃</button> </c:otherwise> </c:choose>
				</div>
			</div>
			<div class="top2">
				<div class="menu">
				<%@ include file="menu.jsp"%>
				</div>
			</div>
		</header>
	<h1>로그인 페이지</h1>
	<div class="container">
		<div class="main">
			<div class="mainStyle">
				<article>
					<h1>login</h1>
					
					<div class="login">
						<form action="./login" method="post">
							<img alt="login" src="./img/login.png" width="200px;">
							<input type="text" name="id" placeholder="아이디를 입력하세요">
							<input type="password" name="pw" placeholder="암호를 입력하세요">
							<button type="reset">지우기</button>
							<button type="submit">로그인</button>
							<div id="errorMSG"></div>
						</form>
						<a href="./join">회원가입</a>
					</div>
				</article>
			</div>
		</div>
		<footer>
		
		</footer>
	</div>
	
	<c:if test="${param.error ne null }">
		<script type="text/javascript">
			err();
		</script>
	
	</c:if>

</body>
</html>