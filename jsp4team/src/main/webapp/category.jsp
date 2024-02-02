<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>국내도서</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/category.css">
<style type="text/css">
.eachrow:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<div id="container">
<!-- header -->
<header>
header
</header>
<h1>국내도서</h1>
<nav>
	<%-- <%@ include file="./menu.jsp" %> --%>
			<ul class="nav justify-content-center book-nav">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">국내도서</a></li>
				<li class="nav-item"><a class="nav-link" href="#">해외도서</a></li>
				<li class="nav-item"><a class="nav-link" href="#">신간</a></li>
				<li class="nav-item"><a class="nav-link disabled" aria-disabled="true">ebook</a></li>
			</ul>
</nav>
<div id="all-box">
<!-- aside -->
<aside class="sidebar">
aside
</aside>
<!-- main -->
<main class="wrap">
	<div class="mainStyle">
		<article>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">저자</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr class="eachrow">
						<th scope="row">1</th>
						<td>파견자들</td>
						<td>김초엽</td>
						<td>2024-01-30</td>
					</tr>
				</tbody>
			</table>
		</article>
		<section>
		section
		</section>
	</div>
</main>
<!-- footer -->
<footer>
footer
</footer>
</div>
</div>
</body>
</html>