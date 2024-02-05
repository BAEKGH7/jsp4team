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

<!-- jQuery 라이브러리를 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- 여기에 스크립트 코드 삽입 -->
<script type="text/javascript">
	$("#comment-btn").click(function() {
		let content = $("#commentcontent").val();
		console.log(content);
		/* let cno = ${detail.no};
		if (content.length < 5) {
			alert("댓글은 다섯글자 이상으로 적어주세요.");
			$("#commentcontent").focus();
		} else {
			let form = $('<form></form>');
			form.attr('name', 'form');
			form.attr('method', 'post');
			form.attr('action', './detail');
			form.append($('<input/>', {
				type : 'hidden',
				name : 'commentcontent',
				value : content
			}));//json
			form.append($('<input/>', {
				type : 'hidden',
				name : 'cno',
				value : cno
			}));
			form.appendTo("body");
			form.submit();
		} */
	});
</script>

</head>
<body>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<%@ include file="menu.jsp"%>
	<script type="text/javascript" src="./js/menu.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<div class="wrap">
		<div class="inner">
			<header></header>
			<div class="contents">

				<div class="card" style="width: 100%; margin: auto;">
					<img
						src="${book.bookcover}"
						class="card-img-top" alt="bookcover"> 
<%-- 					<img
						src="https://th.bing.com/th/id/R.6bd1767fcd505755a61ae6665a48895d?rik=En3i4Ub2INbYBw&riu=http%3a%2f%2fmoonhak.co.kr%2fhome%2fwp-content%2fuploads%2fbookcover%2f%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B01%ED%83%84_72.jpg&ehk=u4qeiFZTu2A%2bWeN0qPLivscWeGztLPzS8OyRd%2b75tKE%3d&risl=&pid=ImgRaw&r=0"
						class="card-img-top" alt="bookcover"> ${book.bookcover} --%>
					<div class="card-body">
						<h5 class="card-title"> ${book.booktitle }</h5>
						<br>
						<div class="card" style="width: 800px;">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">${book.author }</li>
								<li class="list-group-item">출판사 : ${book.publisher }</li>
								<li class="list-group-item">출판 날짜: ${book.publishdate }</li>			
								<li class="list-group-item">ISBN : ${book.isbn} </li>
								<li class="list-group-item">정가 : ${book.bookprice} 원 </li>
							</ul>
						</div>
						<br>
						<button type="button" class="btn-card" href="">장바구니</button>
						<button type="button" class="btn-card" href="">구매하기</button>
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
							<div class="accordion-body">
								<strong><br>
									<p>
									${$book.bookdetail}
									${book.bookdetail}
									</p> </strong>
							</div>
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
								<strong>
									 ${book.bookindex} 
								</strong>
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
							<div class="accordion-body">
								<strong>
								 ${book.profile} 
								</strong>
							</div>
						</div>
					</div>
				</div>

				<article class="con"></article>

				<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 댓글내용, 누가, 어느, 2024-01-22 -->
				<div id="replyList"></div>

				<h2 class="title_text">리뷰</h2>

				<div class="comment-write">
					
					<div class="comment-form">
					<form action="./detail" method="post">
						<textarea id="commentcontent" name="commentcontent"></textarea>
						<button id="comment-btn" type="submit">댓글쓰기</button>
					</form>
					</div>
					
				</div>
			</div>

		</div>
	</div>
	<script>
		
	</script>

</body>
<footer></footer>
</html>