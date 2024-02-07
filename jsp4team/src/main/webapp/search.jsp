<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link rel="stylesheet" href="./css/category.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</head>
<body>

	<header>
		<nav class="nav nav-pills bhItem">
		  <a class="nav-link menuItem" href="./">메인화면</a>
		  <a class="nav-link menuItem" href="./newBooks">신간</a>
		  <a class="nav-link menuItem" href="./domestic">국내</a>
		  <a class="nav-link menuItem" href="./foreign">해외</a> <c:choose> <c:when test="${sessionScope.mname eq null }">
		  <a class="nav-link menuItem" href="./login">로그인</a> </c:when> <c:otherwise>
		  <a class="nav-link menuItem" href="./basket">장바구니</a>
		  <a class="nav-link menuItem" href="./logout">로그아웃</a> </c:otherwise> </c:choose>
		</nav>
	</header>
	<main>
	
	<section class="blContainer">
	<!-- 페이징 -->
	<c:set var="totalPage" value="${totalBooks / 10 }"/>
	<fmt:parseNumber integerOnly="true" var="totalPage" value="${totalPage }"/>
	<c:if test="${totalBooks % 10 gt 0 }">
		<c:set var="totalPage" value="${totalPage + 1 }"/>
	</c:if>
	<%-- 전체 페이지 : <c:out value="${totalPage }"/> <br> --%>
	<!-- 시작 페이지, 끝 페이지 -->
	<c:set var="startPage" value="1"/>
	<!-- 페이지 중간부터 페이징버튼 넘어가도록 -->
	<c:if test="${page gt 5 }">
		<c:set var="startPage" value="${page - 5 }"/>
	</c:if>
	<c:set var="endPage" value="${startPage + 9 }"/>
	<!-- 끝페이지가 전체 페이지 넘어서면 -->
	<c:if test="${endPage gt totalPage }">
		<c:set var="startpage" value="${totalPage - 10 }"/>
		<c:set var="endPage" value="${totalPage }"/>
	</c:if>
	<%-- 시작 페이지 : ${startPage } <br>
	끝 페이지 : ${endPage } <br>
	현재 페이지 : ${page } <br> --%>
	<!-- 페이지 버튼 -->
		<nav aria-label="Page navigation example" class="blItem" id="headerNav">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" 
		      <c:choose>
		      <c:when test="${page - 10 lt 1 }">href="./search?keyword=${keyword }&page=1"</c:when>
		      <c:otherwise>href="./search?keyword=${keyword }&page=${page - 10}"</c:otherwise>
		      </c:choose>
		       aria-label="Previous" 
		      	<c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if>
		      	>
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <c:forEach begin="${startPage }" end="${endPage }" var="p">
		    <li class="page-item">
		    <a 
		    <c:if test="${page eq p }">id="currentBtn"</c:if> 
		    class="page-link" href="./search?keyword=${keyword }&page=${p }">${p }</a></li>
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link" 
				<c:choose>
		        <c:when test="${page + 10 gt totalPage }">href="./search?keyword=${keyword }&page=${totalPage }"</c:when>
		        <c:otherwise>href="./search?keyword=${keyword }&page=${page + 10}"</c:otherwise>
		        </c:choose>
				aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
		<c:choose>
		<c:when test="${totalBooks lt 1 }">
			<div>
				<h3>검색 결과가 없습니다.</h3>
			</div>
		</c:when>
		<c:otherwise>
		<table class="table table-hover blItem" id="booklist">
		  <thead>
		    <tr>
		      <th scope="col"><center>표지</center></th>
		      <th scope="col"><center>제목</center></th>
		      <th scope="col"><center>저자</center></th>
		      <th scope="col"><center>출판사</center></th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${searchedList }" var="book">
		    <tr>
		      <th align="center" valign="middle" class="coverth" scope="row">
		      <img class="bookcover" alt="책표지" src="${book.bookcover }" onclick="location.href='./detail?page=${page }&isbn=${book.isbn }'">
		      </th>
		      <td valign="middle" class="titletd">
		      <a href="detail?page=${page }&isbn=${book.isbn }">
		      ${book.booktitle }
		      </a>
		      </td>
		      <td valign="middle" class="authortd">${book.author }</td>
		      <td valign="middle" class="publishertd">${book.publisher }</td>
		    </tr>
	      </c:forEach>
		  </tbody>
		</table>
		</c:otherwise>
		</c:choose>
	</section>
	
	</main>
	<!-- <aside>
		<nav class="nav flex-column">
		  <a class="nav-link active" aria-current="page" href="#">Active</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link disabled" aria-disabled="true">Disabled</a>
		</nav>
	</aside> -->
	<!-- <footer>footer</footer> -->


</body>
</html>