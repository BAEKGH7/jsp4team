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
<!-- jQuery 라이브러리를 먼저 로드 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 여기에 스크립트 코드 삽입 -->
<script type="text/javascript">
	$(function() {

		/* 댓글 수정기능 */
		//댓글수정 form 만들기
		$(".commentEdit")
				.click(
						function() {
							if (confirm('수정하시겠습니까?')) {
								//필요한 값 cno잡기 / 수정한 내용 + 로그인 ==== 서블릿에서 정리
								let cno = $(this).siblings(".cno").val();
								let comment = $(this).parents(".chead").next(); // 나중에 다시 변경
								$(this).prev().hide();
								$(this).hide();
								comment.css('height', '110');
								comment.css('padding-top', '10px');
								comment.css('backgroundColor', '#c1c1c1');
								let commentChange = comment.html().replaceAll(
										"<br>", "\r\n");
								//alert(cno + " : " + comment);
								let recommentBox = '<div class="recommentBox">';
								recommentBox += '<textarea class="commentcontent">'
										+ commentChange + '</textarea>';
								recommentBox += '<input type="hidden" name="cno" value="' + cno + '">';
								recommentBox += '<button class="comment-btn">댓글 수정</button>';
								recommentBox += '</div>';

								comment.html(recommentBox);
							}
						});

		//댓글수정 동작시키기
		$(document)
				.on(
						'click',
						".comment-btn",
						function() {
							if (confirm('수정하시겠습니까?')) {
								let cno = $(this).prev().val();
								let recomment = $('.commentcontent').val();
								let comment = $(this).parents(".ccomment");//댓글 위치
								//alert("!");
								$
										.ajax({
											url : './recomment',
											type : 'post',
											dataType : 'text',
											data : {
												'cno' : cno,
												'comment' : recomment
											},
											success : function(result) {
												//alert('통신 성공' + result);
												if (result == 1) {
													//수정된 데이터를 화면에 보여주기
													//comment.html(recomment);
													$(this).parent(
															".recommentBox")
															.remove();
													comment.css(
															'backgroundColor',
															'#ffffff');
													comment.css('min-height',
															'100px');
													comment.css('height',
															'auto'); //줄바꿈(feat.시호)
													comment
															.html(recomment
																	.replace(
																			/(?:\r\n|\r|\n)/g,
																			'<br>'));
													$(".commentDelete").show();
													$(".commentEdit").show();
												} else {

													alert("문제가 발생했습니다. 화면을 갱신합니다.")
													//실패 화면 재로드
													location.href = './detail?page=${page}&isbn=${detail.isbn}';
												}
											},
											error : function(error) {
												alert('문제가 발생했습니다.' + error);
											}
										});
							}
						});

		/* 여기부터는 삭제하기~ */
		$(".commentDelete").click(function() {
			if (confirm("삭제 하시겠습니까?")) {
				let text = $(this).parent(".cname").text();
				let cno = $(this).prev().val();
				let point = $(this).closest(".comment");
				$.ajax({
					url : './commentDel', // 주소
					type : 'post', // get, post
					dataType : 'text', // 수신타입 json
					data : {
						no : cno
					}, // 보낼 값
					success : function(result) { //0, 또는 1을 받아옴(commentDel에서)
						//alert("서버에서 온 값 : " + result);
						if (result == 1) {
							//정상삭제 : this의 부모를 찾아서 remove하겠습니다.
							//$(this).closest(".comment").hide(); //숨기기
							//$(this).closest(".comment").remove(); //실제 삭제
							//alert(e);
							point.remove();
						} else {
							alert("삭제할 수 없습니다. 관리자에게 문의하세요");
						}

					},
					error : function(request, status, error) { //통신 오류
						alert("문제가 발생했습니다.");
					}
				}); //end ajax
			}

		});

		/* 이 아래는 1팀장님이 장바구니 추가한 내용 */
		let mid = "${mid}";
		$('.modal').hide();
		$('.addcart')
				.click(
						function() {
							if (!mid) {
								alert("로그인이 필요합니다");
								location.href = './login';
								return; // 로그인이 필요한 경우 여기서 중단
							}

							if (mid) {
								let quantity = $(this).siblings('.quantity')
										.val();
								if (quantity === "수량을 선택해주세요") {
									alert("수량을 선택해주세요!");
									$('.quantity').focus();
									return; // 수량을 선택하지 않은 경우 여기서 중단
								}
								let result = confirm('장바구니에 추가하시겠습니까?');
								if (result) {
									// 장바구니에 추가하는 로직을 여기에 추가
									let urlParams = new URLSearchParams(
											window.location.search);
									let isbn = urlParams.get('isbn');
									let quantity = $(this)
											.siblings('.quantity').val();
									$
											.ajax({
												url : './addbasket',
												type : 'post',
												dataType : 'text',
												data : {
													'isbn' : isbn,
													'mid' : mid,
													'quantity' : quantity
												},
												success : function(result) {
													// alert('성공 : ' + result);
													if (result == 1) {
														$('.modal').show();
														$('.shoppingBtn')
																.click(
																		function() {
																			$(
																					'#modal')
																					.hide();
																			let urlParams = new URLSearchParams(
																					window.location.search);
																			let isbn = urlParams
																					.get('isbn');
																			let page = urlParams
																					.get('page');
																			location.href = './detail?page='
																					+ page
																					+ '&isbn='
																					+ isbn;
																		});
														$('.go_cartBtn')
																.click(
																		function() {
																			$(
																					'#modal')
																					.hide();
																			location.href = './basket';
																		});
													} else {
														alert('오류가 발생했습니다.');
													}
												},
												error : function(error) {
													alert('실패 : ' + error);
												}
											});
								} else {
									return;
								}
							}

						});

		$("#comment-btn").click(function() {
			let content = $("#commentcontent").val();
			//let isbn = ${book.isbn};
			let isbn = $
			{
				param.isbn
			}
			;

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

	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">장바구니 추가 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>장바구니에 상품 추가 완료되었습니다.</p>
					<p>쇼핑을 계속하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary shoppingBtn"
						data-bs-dismiss="modal">쇼핑 계속하기</button>
					<button type="button" class="btn btn-secondary go_cartBtn">장바구니
						이동</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="menu.jsp"%>

	<div class="wrap">
		<div class="inner">
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
						<br> <select
							class="form-select form-select-sm w-25 p-1 quantity"
							aria-label=".form-select-sm example" name="quantity">
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
								<c:choose>
									<c:when test="${empty book.bookindex}">
										<strong>목차 정보가 없습니다.</strong>
									</c:when>
									<c:otherwise>
										<strong>${book.bookindex}</strong>
									</c:otherwise>
								</c:choose>
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
								<strong> ${book.profile} </strong>
							</div>
						</div>
					</div>
				</div>

				<article class="con"></article>
				
				<!-- 별점 창 -->
				<div id="starSection" style="margin-bottom:90px;">
					<h2 class="title_text">별점</h2>
					<!-- 별점 평균 출력 :  -->
					<p style="margin:10px;">평균 별점: <c:choose><c:when test="${empty avgStarPoint }">0.0</c:when><c:otherwise>${avgStarPoint }</c:otherwise></c:choose></p>
					<!-- 로그인한 사람한테만 보이는 별점 입력폼? -->
					<c:if test="${sessionScope.mid ne null && starResult ne 1 }"> <!-- 별점 이미 준 사람한테도 안 보여주기 -->
						<div class="star-input">
							<div class="star-form">
								<form method="post" action="./star">
									<select name="starPoint" class="form-select" aria-label="Default select example">
									  <option selected>별점을 선택하세요.</option>
									  <option value="5">✨✨✨✨✨</option>
									  <option value="4">✨✨✨✨</option>
									  <option value="3">✨✨✨</option>
									  <option value="2">✨✨</option>
									  <option value="1">✨</option>
									</select>
									<input type="hidden" value="${param.isbn }" name="isbn" />
									<button type="submit" class="btn btn-outline-warning star-btn" style="float:right;">별점 주기</button>
								</form>
							</div>
						</div>
					</c:if>
				</div>

				<!-- 댓글쓰는 창을 여기다가 만들어주겠습니다. 댓글내용, 누가, 어느, 2024-01-22 -->
				<div id="replyList">

					<h2 class="title_text">리뷰</h2>
					<c:if test="${sessionScope.mid ne null }">
						<div class="comment-write">
							<div class="comment-form">
								<form method="post" action="./comment">
									<textarea id="commentcontent" name="commentcontent"></textarea>
									<input type="hidden" value="${param.isbn }" name="isbn" />
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
									<div class="cdate">${co.ip }/${co.cdate }</div>
								</div>
								<div class="ccomment">${co.comment }</div>
							</div>
						</c:forEach>
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