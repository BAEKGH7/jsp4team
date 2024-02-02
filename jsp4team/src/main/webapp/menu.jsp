<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<nav>
			<ul>
				<li onclick="url('./new')">신작도서</li>
				<li onclick="url('./domestic')">국내도서</li>
				<li onclick="url('./foreign')">해외도서</li>
				<li onclick="url('./basket')">장바구니</li> <c:choose> <c:when test="${sessionScope.mname eq null }">
				<li onclick = "url('./login')">로그인</li> </c:when> <c:otherwise>
				<li onclick = "url('./myInfo')">마이페이지</li>
				<li onclick = "url('./logout')">로그아웃</li> </c:otherwise> </c:choose>
			</ul>
		</nav>
