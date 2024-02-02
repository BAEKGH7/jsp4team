<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="public/css/practice.css" />
<link href="./css/detail.css" rel="stylesheet" />
<title>당근 서점::${dto.title}</title>


<style>
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
$("#comment-btn").click(function(){
	alert("!!!!");
});
});

</script>
<body>
	<nav>
		<div class="container">
			<ul>
				<li onclick="url('./icon')" style="text-align: center;"><img
					src="./img/logo.png" alt="Icon"
					style="width: 50px; height: 23px; vertical-align: middle;"></li>
				<li onclick="url('./domestic')">국내도서</li>
				<li onclick="url('./foreign')">해외도서</li>
				<li onclick="url('./best')">베스트셀러</li>
				<li onclick="url('./basket')">장바구니</li>
				<li onclick="url('./join')">회원가입</li>
			</ul>
		</div>
	</nav>

	<div>
		<table class="table">

			<tbody>
				<tr>
					<td class="cover"><img alt="사진" src="./img/book.webp"
						width="70%;"></td>

					<td>
						<div class="book-info-container">
							<p>
								<b>독서 코드: </b>
							</p>
							<p>
								<b>저자: </b>${book.writer}</p>
							<p>
								<b>출판사: </b>${book.company}</p>
							<p>
								<b>출판일: </b>${book.bdate}</p>
							<p>
								<b>페이지수: </b>${book.totalpage}쪽</p>
							<p>
								<b>재고수: </b>${book.stock}권</p>
							<p>
								<b>상태: </b>${book.condition}</p>

							<div class="price-box">
								<h2>정상가 :</h2>
							</div>
						</div>
					<td>



						<div class="btns">
							<button class="btn btn-success btn-lg btn-block cart"
								onclick="location.href='./ShoppingCart.jsp'">장바구니</button>
							<button class="btn btn-primary btn-lg btn-block buy"
								onclick="location.href='./order.jsp'">바로구매</button>
						</div>
					</td>
				<tr>
					<td colspan="1" class="test">
						<div class="separator"></div> <br> <br>
						<h5>- 목차 -</h5> <br> <br>
						<div class="index">
							<ul>
								<li>1부. 한국 도시의 미래를 예측하는 포인트

									<ul>
										<br>
										<li>1장. 국제 정세
											<ul>
												<br>
												<li>3대 메가시티의 특징</li>
												<li>행정의 연속성</li>
												<li>정세 변화</li>
											</ul> <br> <br>
										</li>
										<li>2장. 3대 메가시티와 소권역
											<ul>
												<br>
												<li>3대 메가시티의 특징</li>
												<li>행정의 연속성</li>
												<li>정세 변화</li>
											</ul> <br> <br>
										</li>
										<li>3장. 인구
											<ul>
												<br>
												<li>지역 소멸은 이번이 처음이 아니다</li>
												<li>도시들의 인구 구조가 바뀌고 있다</li>
												<li>신도시 개발로 인구가 늘어난다는 환상</li>
											</ul> <br> <br>
										</li>
										<li>4장. 교통<br>
											<ul>
												<br>
												<li>철도 건설 공약들, 결국 어떻게 됐나?</li>
												<li>철도역·버스정류장·버스터미널의 위치 문제</li>
												<li>인프라를 갖추기 위한 국제대회·스포츠대회 개최</li>
												<br>
											</ul> <br> <br>
										</li>
									</ul>
								</li>
								<li>2부. 한국 도시의 미래
									<ul>
										<br>
										<li>5장. 국제 정세
											<ul>
												<br>
												<li>3대 메가시티의 특징</li>
												<li>행정의 연속성</li>
												<li>정세 변화</li>
											</ul> <br> <br>
										</li>
										<li>6장. 동남권
											<ul>
												<br>
												<li>동남권 메가시티의 본질</li>
												<li>포스코의 도시, 포항과 광양</li>
												<li>동남권 메가시티를 형성하는 여수와 울산의 석유화학단지</li>
											</ul> <br> <br>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>

					<td colspan="1">

						<h5>- 작가 소개 -</h5> <mark>${dto.author}</mark> <br> <br>
						<p>${dto.authorIntro}</p> <!-- 작가 소개 입력 텍스트 박스 -->
						<blockquote>
							<div contenteditable="false"
								style="width: 182%; min-height: 100px; border: 1px solid #ccc;">
								<ul>
									<br>
									<li>작가명 : 김시덕</li>
									<br>
									<li>국적 : 대한민국</li>
									<br>
									<li>출생 : 1975년</li>
									<br>
									<li>학력 : 일본 국문학연구자료관 박사, 고려대학교 일어일문학과 학사</li>
									<br>
									<li>경력 : 서울대 규장각한국학연구원 조교수</li>
									<br>
								</ul>
							</div>
						</blockquote>
					</td>
				</tr>


				<tr>
               <td colspan="3">
                  <h5>- 댓글 쓰기 -</h5>
                  <blockquote>
                     <div class="comment-write">
                  <div class="comment-form">
                     <textarea id="commentcontent" name="commentcontent"></textarea>
                     <button id="comment-btn">댓글쓰기</button>
                  </div>
               </div>
                  </blockquote>
               </td>
            </tr>
         </tbody>
      </table>

      <script>
      
        /*  document.addEventListener("DOMContentLoaded", function() {
            const commentBtn = document.getElementById("comment-btn");
            commentBtn.addEventListener("click", commentBtnHandler);
         });

         function commentBtnHandler() {
            const commentContent = document
                  .getElementById("commentcontent").value;

            // 여기에 댓글 등록을 처리하는 로직을 추가할 수 있습니다.
            console.log("댓글이 등록되었습니다: " + commentContent);
         } */
      </script>
</body>
</html>