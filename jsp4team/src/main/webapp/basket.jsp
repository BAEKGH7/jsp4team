<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/basket.css" rel="stylesheet" />
<link href="./css/menu.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="../js/menu.js"></script>
<script type="text/javascript" src="../js/basket.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body>
	<main>
	<header class="top">
		<img alt="logo" src="./img/logo.png" width="300px;">
		<%@ include file="menu.jsp" %>
	</header>
		<section class="s1">
			<div class="cart">
				<div class="check_box">
					<input type="checkbox" name="allcheck" onclick="selectAll(this)"> <b>전체 선택</b>
					<button>삭제</button>
				</div>
				<div class="cart_list">
					<table>
						<thead>
							<tr>
								<th>선택</th>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>수량</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${list}" var="row">
							<tr>
								<td><input type="checkbox" name="choice" onclick="checkSelectAll()"></td>
								<td>${row.bookcover}</td>
								<td>${row.booktitle}</td>
								<td>${row.bookprice}</td>
								<td><button class="minuscount" onclick="minus()">-</button>수량: ${row.ccount}<button class="pluscount" onclick="plus()">+</button></td>
								<td><button>삭제</button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="cart_page">
				
				</div>
			</div>
		</section>
		<section class="2">
			<div class="checklist">
				<div class="checklist">
					<table>
						<thead>
							<tr>
								<th>상품명</th>
								<th>수량</th>
								<th>상품가</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list2}" var="row2">
								<tr>
									<td>${row2.booktitle}</td>
									<td>${row2.quantity}</td>
									<td>${row2.bookprice}</td>
									<td>${row2.totalprice}</td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<button onclick="url('./payment')">구매하기</button>
			</div>
		</section>
	</main>
</body>
</html>