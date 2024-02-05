<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국내도서</title>
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
		<nav class="nav bhItem">
		  <a class="nav-link active" aria-current="page" href="#">Active</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link disabled" aria-disabled="true">Disabled</a>
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
	전체 페이지 : <c:out value="${totalPage }"/> <br>
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
	시작 페이지 : ${startPage } <br>
	끝 페이지 : ${endPage } <br>
	현재 페이지 : ${page } <br>
	<!-- 페이지 버튼 -->
		<nav aria-label="Page navigation example" class="blItem" id="headerNav">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" 
		      <c:choose>
		      <c:when test="${page - 10 lt 1 }">href="./domestic?page=1"</c:when>
		      <c:otherwise>href="./domestic?page=${page - 10}"</c:otherwise>
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
		    class="page-link" href="./domestic?page=${p }">${p }</a></li>
		    <!-- <li class="page-item"><a class="page-link" href="./domestic?page=2">2</a></li>
		    <li class="page-item"><a class="page-link" href="./domestic?page=3">3</a></li> -->
		    </c:forEach>
		    <li class="page-item">
		      <a class="page-link" 
				<c:choose>
		        <c:when test="${page + 10 gt totalPage }">href="./domestic?page=${totalPage }"</c:when>
		        <c:otherwise>href="./domestic?page=${page + 10}"</c:otherwise>
		        </c:choose>
				aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
		
		<table class="table table-hover blItem" id="booklist">
		  <thead>
		    <tr>
		      <th scope="col">isbn</th>
		      <th scope="col">제목</th>
		      <th scope="col">저자</th>
		      <th scope="col">출판사</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${domesticList }" var="book">
		    <tr>
		      <th scope="row">${book.isbn }</th>
		      <td>
		      <a href="detail?page=${page }">
		      <%-- <a href="detail?page=${page }&isbn=${domesticList.isbn }"> --%>
		      ${book.booktitle }
		      </a>
		      </td>
		      <td>${book.author }</td>
		      <td>${book.publisher }</td>
		    </tr>
	      </c:forEach>
		  </tbody>
		</table>
	
	</section>
	
	</main>
	<aside>
		<nav class="nav flex-column">
		  <a class="nav-link active" aria-current="page" href="#">Active</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link" href="#">Link</a>
		  <a class="nav-link disabled" aria-disabled="true">Disabled</a>
		</nav>
	</aside>
	<footer>footer</footer>


</body>
</html>