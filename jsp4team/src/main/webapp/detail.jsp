<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.teamfour.dto.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>당근서점</title>
<link href="./css/detail.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script type="text/javascript" src="./js/menu.js"></script>
<!-- ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- jQuery 라이브러리를 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 여기에 스크립트 코드 삽입 -->
<script type="text/javascript">
$(function() {
		let mid = "${mid}";
		$('.modal').hide();
		$('.addcart').click(function() {
			if (!mid) {
	            alert("로그인이 필요합니다");
	            location.href = './login';
	            return; // 로그인이 필요한 경우 여기서 중단
	        }
			
			if (mid) {
				let quantity = $(this).siblings('.quantity').val();
		            if (quantity === "수량을 선택해주세요") {
		                alert("수량을 선택해주세요!");
		                $('.quantity').focus();
		                return; // 수량을 선택하지 않은 경우 여기서 중단
		            }
				let result = confirm('장바구니에 추가하시겠습니까?');
				if (result) {
					// 장바구니에 추가하는 로직을 여기에 추가
					let urlParams = new URLSearchParams(window.location.search);
		            let isbn = urlParams.get('isbn');
		            let quantity = $(this).siblings('.quantity').val();
		            $.ajax({
		                url: './addbasket',
		                type: 'post',
		                dataType: 'text',
		                data: {'isbn': isbn, 'quantity' : quantity},
		                success: function(result) {
		                   // alert('성공 : ' + result);
		                },
		                error: function(error) {
		                   // alert('실패 : ' + error);
		                }
		            });
				} else {
					let urlParams = new URLSearchParams(window.location.search);
		            let isbn = urlParams.get('isbn');
		            let page = urlParams.get('page');
					location.href = './detail?page='+page+'&isbn='+isbn; // ISBN을 사용하여 상세 페이지로 이동
				}
			}
			
		});
		
	$("#comment-btn").click(function() {
		let content = $("#commentcontent").val();
		//let isbn = ${book.isbn};
		let isbn = ${param.isbn};
		
		if (commentcontent.length < 5) {
			alert("댓글은 다섯글자 이상으로 적어주세요.");
			$("#commentcontent").focus();
		} else {
			let form = $('<form></form>');
			form.attr('name', 'form');
			form.attr('method', 'post');
			form.attr('action', './comment');

			form.append($('<input/>', {
				type : 'hidden', 
				name : 'commentcontent', 
				value : content
			}));
			form.append($('<input/>', {
				type : 'hidden',
				name : 'isbn',
				value : isbn
			}));
			form.appendTo('body');
			form.submit();
		}
		// getList 함수를 여기로 이동
		//getList();
	});
});
</script>

</head>
<body>

	<%@ include file="menu.jsp"%>

	<div class="modal" style="display: none;">
		<p>장바구니에 상품 추가 완료되었습니다.</p>
		<p>쇼핑을 계속하시겠습니까?</p>
		<button class="shopping">쇼핑 계속하기</button>
		<button class="go_cart">장바구니 이동</button>
	</div>
	<div class="wrap">
		<div class="inner">
			<header></header>
			<div class="contents">

				<div class="card" style="width: 100%; margin: auto;">
					<img src="${book.bookcover}" class="card-img-top" alt="bookcover">
					<%-- 					<img
						src="https://th.bing.com/th/id/R.6bd1767fcd505755a61ae6665a48895d?rik=En3i4Ub2INbYBw&riu=http%3a%2f%2fmoonhak.co.kr%2fhome%2fwp-content%2fuploads%2fbookcover%2f%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B01%ED%83%84_72.jpg&ehk=u4qeiFZTu2A%2bWeN0qPLivscWeGztLPzS8OyRd%2b75tKE%3d&risl=&pid=ImgRaw&r=0"
						class="card-img-top" alt="bookcover"> ${book.bookcover} --%>
					<div class="card-body">
						<h5 class="card-title">${book.booktitle }</h5>
						<br>
						<div class="card" style="width: 860px; margin: center;">
							<ul class="list-group">
								<li class="list-group-item">${book.author }</li>
								<li class="list-group-item">출판사 : ${book.publisher }</li>
								<li class="list-group-item">출판 날짜: ${book.publishdate }</li>
								<li class="list-group-item">ISBN : ${book.isbn}</li>
								<li class="list-group-item">정가 : ${book.bookprice} 원</li>
							</ul>
						</div>
						<br>
						<select class="form-select form-select-sm w-25 p-1 quantity" aria-label=".form-select-sm example" name="quantity">
  							<option selected>수량을 선택해주세요</option>
  							<option value="1">1</option>
  							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
						<button type="button" class="btn-card addcart" href="">장바구니</button>
						<button type="button" class="btn-card buy" href="">구매하기</button>
					</div>

				</div>


				<article class="con"></article>

				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
								작품 소개</button>
						</h2>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body">${book.bookdetail}</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseTwo"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
								목차</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse">
							<div class="accordion-body">
								<strong> ${book.bookindex} </strong>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseThree"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseThree">저자 프로필</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse">
							<div class="accordion-body" style="font-weight: lighter;">
								<strong> ${book.bookdetail} </strong>
							</div>
						</div>
					</div>
				</div>

				<article class="con"></article>

				<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 댓글내용, 누가, 어느, 2024-01-22 -->
				<div id="replyList"></div>

				<h2 class="title_text">리뷰</h2>
				<c:if test="${sessionScope.mid ne null }">
				<div class="comment-write">
					<div class="comment-form">
						<form method="post" action="./comment">
							<textarea id="commentcontent" name="commentcontent"></textarea>
							<input type="hidden" value="${param.isbn }" name="isbn"/>
							<button id="comment-btn" type="submit">댓글쓰기</button>
						</form>
					</div>
				</div>
				</c:if>
				<!-- 댓글 출력창 -->
					<div class="comments">
						<c:forEach items="${commentList }" var="co">
							<div class="comment">
								<div class="chead">
									<div class="cname">${co.mname }님 
										<c:if test="${co.mid eq sessionScope.mid }">
											<input type="hidden" class="cno" value="${co.cno }">
											
											<img alt="삭제" src="./img/delete.png" class="commentDelete">
											<img alt="수정" src="./img/edit.png" class="commentEdit">
											
										</c:if>
									</div>
									<div class="cdate">${co.ip } / ${co.cdate }</div>
								</div>
								<div class="ccomment">${co.comment }</div>
							</div>
						</c:forEach>
					
					</div>
			</div>
		</div>
	</div>

	<script>
		
	</script>
</body>
<footer></footer>
</html>