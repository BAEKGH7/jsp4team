<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<nav>
			<ul>
				<li onclick="window.location.href='./newBooks'">신작도서</li>
				<li onclick="window.location.href='./domestic'">국내도서</li>
				<li onclick="window.location.href='./foreign'">해외도서</li>
				<li onclick="window.location.href='./basket'">장바구니</li> <c:choose> <c:when test="${sessionScope.mname eq null }">
				<li onclick ="window.location.href='./login'">로그인</li> </c:when> <c:otherwise>
				<li onclick ="window.location.href='./logout'">로그아웃</li> </c:otherwise> </c:choose>
			</ul>
		</nav>
