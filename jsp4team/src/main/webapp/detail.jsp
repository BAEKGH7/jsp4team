<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="./css/detail.css" rel="stylesheet" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>당근 서점::${dto.title}</title>


<style>
</style>
</head>

<body>
	<nav>
		<div class="container">
			<div class="menu">
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
					<td><img alt="사진" src="./img/book.webp" width="200px;">
					</td>
					<td>

						<div class="title">${dto.title}</div>
						<div class="copy">${dto.copy}</div>


						<div class="priceinfo">
							<h1 class="info_title_wrap">한국 도시의 미래</h1>
							<br> <br>
							<div class="info_title_sub_wrap">인문학자가 직접 탐사한 대한민국 임장 보고서</div>

							<span class="metadata_item author_item_wrapper">
								<div class="info_title_sub_wrap">김시덕 저</div>
								<div class="info_title_sub_wrap">포레스트북스 출판</div>
								<div class="info_title_sub_wrap">페이지수</div>
								<div class="info_title_sub_wrap">도서번호</div>
							</span>
						</div>

					</td>
					<td>
						<div class="btns">
							<button class="btn btn-success btn-lg btn-block cart" onclick="">장바구니</button>
							<button class="btn btn-primary btn-lg btn-block buy">바로구매</button>
						</div>
					</td>

				</tr>
				<tr>


					<td colspan="1">
						<h5>목차</h5>
						<div class="index">
							<p>${dto.contents}</p>

							<ul>
								<li>한국 도시의 미래 목차</li>
								<li>이 책의 핵심</li>

								<li>1부. 한국 도시의 미래를 예측하는 포인트</li>
								<ul>
									<li>1장. 국제 정세</li>
									<ul>
										<li>3대 메가시티의 특징</li>
										<li>행정의 연속성</li>
										<li>정세 변화</li>
									</ul>

									<li>2장. 3대 메가시티와 소권역</li>
									<ul>
										<li>3대 메가시티의 특징</li>
										<li>행정의 연속성</li>
										<li>정세 변화</li>
									</ul>

									<li>3장. 인구</li>
									<ul>
										<li>지역 소멸은 이번이 처음이 아니다</li>
										<li>도시들의 인구 구조가 바뀌고 있다</li>
										<li>신도시 개발로 인구가 늘어난다는 환상</li>
									</ul>

								</ul>
								<li>4장. 교통</li>
								<ul>
									<li>철도 건설 공약들, 결국 어떻게 됐나?</li>
									<li>철도역·버스정류장·버스터미널의 위치 문제</li>
									<li>인프라를 갖추기 위한 국제대회·스포츠대회 개최</li>
								</ul>

								<li>2부. 한국 도시의 미래</li>
								<ul>
									<li>5장. 국제 정세</li>
									<ul>
										<li>3대 메가시티의 특징</li>
										<li>행정의 연속성</li>
										<li>정세 변화</li>
									</ul>
										<li>6장.동남권</li>
									<ul>
										<li>동남권 메가시티의 본질</li>
										<li>포스코의 도시, 포항과 광양</li>
										<li>동남권 메가시티를 형성하는 여수와 울산의 석유화학단지</li>
									</ul>
								</ul>


							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<h5>작가 소개</h5>
						<blockquote>
							<mark>${dto.author}</mark>
							<p>${dto.authorIntro}</p>
						</blockquote>
					</td>
				</tr>


				<tr>
					<td colspan="3">
						<h5>댓글 쓰기</h5>
						<blockquote>
							<mark>${dto.author}</mark>
							<p>${dto.authorIntro}</p>
						</blockquote>
					</td>
				</tr>
			</tbody>
		</table>

	</div>


	<script>
		
	</script>

</body>

</html>