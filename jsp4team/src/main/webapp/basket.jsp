<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/index.css" rel="stylesheet" />
<link href="./css/basket.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript" src="./js/basket.js"></script>
<script type="text/javascript">
$(function(){
	let allChecked = localStorage.getItem("allChecked") === "1";
    $('.allcheck').prop('checked', allChecked);
	
	$('input[name="choice"]').each(function() {
        let isbn = $(this).closest('tr').find('.isbn').val();
        let checked = localStorage.getItem(isbn) === "1";
        $(this).prop('checked', checked);
    });
	
	$('.allcheck').change(function(){
		let checkbox=$(this);
		let ccheckValue = checkbox.prop('checked') ? "1" : "0";
		localStorage.setItem("allChecked", ccheckValue);
		
		$('input[name="choice"]').each(function() {
            let isbn = $(this).closest('tr').find('.isbn').val();
            localStorage.setItem(isbn, ccheckValue); // 전체 선택 버튼의 상태에 따라 개별 선택 상태 업데이트
            $(this).prop('checked', checkbox.prop('checked')); // 전체 선택 버튼 상태에 따라 개별 선택 업데이트
        });
		
		$.ajax({
			url: './basket',
			type: 'post',
			data : {"ccheck" : ccheckValue},
			success: function(result){
				//alert(result);
				$('.total').text('총 금액: ' + result + '원');
			},
			error: function(error) {
                alert("allcheck 에러 : "+ error);
            }
		});
		
	});
	
	$('input[name="choice"]').change(function() {
		let checkbox = $(this);
	    let isbn = $(this).closest('tr').find('.isbn').val();
	    let ccheckValue = checkbox.prop('checked') ? "1" : "0";
	    let checkboxName = checkbox.attr('name');
	    localStorage.setItem(isbn, ccheckValue);
        
        $.ajax({
            url: "./basket", 
            type: "POST",
            data: { "isbn": isbn, "ccheck": ccheckValue },
            success: function(result) {
            	$('.total').text('총 금액: ' + result + '원');
            },
            error: function(error) {
            	 alert("choice 에러 : "+ error);
            }
        });
    });
	
	$('.minusbtn').click(function(){
		let isbn = $(this).closest('tr').find('.isbn').val(); 
			$.ajax({
	            url: "./basketminus", 
	            type: "POST",
	            data: { "isbn": isbn },
	            success: function(result) {
					if(result==1){
						alert("변경됨");
					}
	            },
	            error: function(error) {

	            }
	        });
	});
	
	$('.pluscbtn').click(function(){
		let isbn = $(this).closest('tr').find('.isbn').val();
			$.ajax({
	            url: "./basketplus", 
	            type: "POST",
	            data: { "isbn": isbn },
	            success: function(result) {
					if(result==1){
						alert(result);
					}
	            },
	            error: function(error) {

	            }
	        });
	});
	/* $('.deleteall_btn').click(function(){
		let isbn =
		let quantity =
		let ccheck = 
			$.ajax({
	            url: "./basketdelete", 
	            type: "POST",
	            data: { "isbn": isbn, "quantity" : quantity, "ccheck": ccheckValue },
	            success: function(result) {

	            },
	            error: function(error) {

	            }
	        });
	});
	
	$('.delete_btn').click(function(){
		let isbn =
		let quantity =
		let 
			$.ajax({
	            url: "./basketdelete", 
	            type: "POST",
	            data: { "isbn": isbn, "quantity": quantity },
	            success: function(result) {

	            },
	            error: function(error) {

	            }
	        });
	}); */
	
});

</script>
</head>
<body>
	<main>
		<header>
			<div class="top1">
				<img alt="logo" src="./img/logo.png" width="300px;">
				<div class="search">
					<input class="searchText" type="text" placeholder="검색어 입력"
						color="#a8a8a8;">
					<button class="searchBtn">검색</button>
				</div>
				<div class="joinLogin">
					<c:choose>
						<c:when test="${sessionScope.mname eq null }">
							<button class="btn btn-jelly"
								onclick="window.location.href='./join'">회원가입</button>
							<button class="btn btn-jelly"
								onclick="window.location.href='./login'">로그인</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-jelly"
								onclick="window.location.href='./myinfo'">마이페이지</button>
							<button class="btn btn-jelly"
								onclick="window.location.href='./logout'">로그아웃</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="top2">
				<div class="menu">
					<%@ include file="menu.jsp"%>
				</div>
			</div>
		</header>
		<div class="cartcontainer">
			<section class="s1">

				<div class="check_box">
					<div class="checkbox">
						<input class="allcheck" type="checkbox" name="allcheck" onclick="selectAll(this)" value="${row.ccheck }"> <b>전체 선택</b>
					</div>
					<div class="d_btn">
						<button class="deleteall_btn">삭제</button>
					</div>
				</div>
				<div class="cart_list">
					<table class="table1">
						<thead>
							<tr>
								<th>선택</th>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>판매가</th>
								<th>수량</th>
								<th>합계</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="row">
								<tr>
									<td class="d1"><input type="checkbox" name="choice"  onclick="checkSelectAll()" value="1"></td>
									<td class="cover"><img alt="책표지" src="${row.bookcover}" width="100px;"></td>
									<td class="d3"><input type="hidden" class="isbn" value="${row.isbn}">${row.booktitle}</td>
									<td class="d1">${row.bookprice}</td>
									<td class="d2">
										<button class="minusbtn" <c:if test="${row.quantity eq 1 }">disabled="disabled"</c:if>>-</button> ${row.quantity}
										<button class="pluscbtn" <c:if test="${row.quantity eq 50 }">disabled="disabled"</c:if>>+</button>
									</td>
									<td class="d1">${row.sumprice}</td>
									<td class="delete_btn"><button>삭제</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="cart_page"></div>
			</section>
			<section class="s2">
				<div class="checklist">
					<div class="checklist">
						<table>
							<thead>
								<tr>
									<th>상품명</th>
									<th>수량</th>
									<th>상품합계</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list2}" var="row2">
									<tr>
										<td>${row2.booktitle}</td>
										<td>${row2.quantity}</td>
										<td>${row2.sumprice}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="total">총 금액: ${totalprice} 원</div>
					<button onclick="url('./order')">구매하기</button>
				</div>
			</section>
		</div>
	</main>
</body>
</html>