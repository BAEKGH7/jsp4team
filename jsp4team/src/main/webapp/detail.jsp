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
	$(document).ready(function() {
		$("#comment-btn").click(function() {
			alert("!!!!");
		});
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
						src="https://th.bing.com/th/id/R.6bd1767fcd505755a61ae6665a48895d?rik=En3i4Ub2INbYBw&riu=http%3a%2f%2fmoonhak.co.kr%2fhome%2fwp-content%2fuploads%2fbookcover%2f%ED%95%B4%EB%A6%AC%ED%8F%AC%ED%84%B01%ED%83%84_72.jpg&ehk=u4qeiFZTu2A%2bWeN0qPLivscWeGztLPzS8OyRd%2b75tKE%3d&risl=&pid=ImgRaw&r=0"
						class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">해리 포터와 마법사의 돌 1</h5>
						<br>
						<div class="card" style="width: 800px;">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">조앤.K.롤링 저 / 강동혁 역</li>
								<li class="list-group-item">출판사 : Pottermore</li>
								<li class="list-group-item">페이지수 : 9781781106303</li>
								<li class="list-group-item">ISBN : 9781781106303</li>
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
									<h1>해리 포터 세대의, 해리 포터 세대를 위한, 해리 포터 세대에 의한 새 번역!</h1> <br>
									<br>

									<p>
										1997년 영국에서 출간된 이래 『해리 포터』 시리즈는 지금까지 200개국 이상 80개의 언어로 번역되고
										출간되어 5억 부 이상을 판매했다. 국내에서도 1999년 『해리 포터와 마법사의 돌』의 출간을 필두로 지금까지
										약 1,500만 부가 판매되었으며, 현재에도 독자들에게 변함없는 사랑을 받고 있다. 이 시리즈는 여덟 편의
										영화로도 제작되어 전 세계 곳곳에서 흥행을 거두었고, 영화와 관련된 새로운 도서가 출간되고 테마 파크가 조성되는
										등 놀라운 기현상을 빚어냈다.<br> <br> 뿐만 아니라 『해리 포터』 시리즈에서 또 다른
										작품들이 문화상품으로 파생되어 지금도 꾸준히 독자들을 만나고 있다. ‘해리 포터’의 다음 세대인 자녀들의
										이야기를 다룬 『해리 포터와 저주 받은 아이』는 시나리오로 출간된 이후 연극으로 만들어져 영국을 시작으로 미국,
										호주, 독일, 캐나다 등 세계 곳곳에서 열띤 호응을 얻으며 공연 중이고, 『해리 포터』의 세계관이 확장된
										『신비한 동물 사전』 시리즈는 계속해서 영화로 제작되고 있다. 이제 『해리 포터』는 소설이라는 단순한 문학
										장르에 머무르지 않고 ‘21세기를 대표하는 시대의 아이콘’으로 불리며 일종의 사회문화 현상으로 받아들여지고
										있다.<br> <br> 20주년을 맞아 새롭게 출간한 『해리 포터』 시리즈는 ‘21세기
										고전’이라 불릴 만한 품격에 맞춰 작품의 완성도를 높였다. 7권 『해리 포터와 죽음의 성물』로 완간된 기존의
										『해리 포터』 시리즈는 빈틈없는 소설적 구성과 생생한 캐릭터 그리고 마법 세계를 정교하게 묘사하며 풍부한
										상상력이 돋보이면서도 정밀한 세계관을 구축해 나갔다. 하지만 지금까지 출간된 책들은 J.K. 롤링이 펼쳐 나가는
										판타지 세계의 규모가 어느 정도이며 그 속에 어떠한 소설적 장치를 심어 놓았는지 알 수 없는 상태에서 번역
										작업이 이루어졌다. 또한 1~7편 모두 완결성을 갖추었지만, 시리즈의 특성상 편과 편을 이어 주며 작품 전체를
										관통하는 서사의 개연성과 완결성은 마지막 편이 출간된 이후에나 파악할 수밖에 없었다. 그러다 보니 작가가 어느
										장면에 복선을 깔아 두었고, 어느 장면이 작가가 창조한 세계관을 이해하는 중요한 역할을 하는지 의미를 파악하며
										번역하기에는 한계가 있었다.<br> <br> 이번에 선보이는 『해리 포터』 시리즈에는 J.K.
										롤링이 작품 속에 이룩해놓은 문학적 성취가 완벽하게 구현되어 있다. 복선과 반전을 선사하는 문학적 장치들을 보다
										정교하고 세련되게 다듬었으며, 인물들 사이의 관계나 그들의 숨겨진 비밀 그리고 성격이 도드라지는 말투의 미세한
										뉘앙스까지 점검했다. 『해리 포터』의 세계에 처음 발을 들여놓는 독자는 물론, 그동안 『해리 포터』의 세계를
										즐겨 찾아왔던 독자 모두에게 완성도 높은 만족과 감동을 선사할 것이다.<br> <br> 1탄
										《해리포터와 마법사의 돌》 어둠의 마왕 볼드모트에게 부모를 잃고 홀로 살아남은 아이, 해리는 안전을 위해
										마법사가 아닌 사람인 ‘머글’ 페투니아 이모와 버논 이모부 손에 길러지며 불우한 어린 시절을 보낸다. 열한 번째
										생일날, 해그리드를 통해 자신이 마법사라는 사실을 알게 된 해리는 호그와트 마법학교에 입학해 헤르미온느
										그레인저, 론 위즐리라는 친구들과 함께 영생을 주는 마법사의 돌을 찾는 엄청난 모험을 시작하게 된다.
									</p> <br> <br> </strong>
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
									<ol>
										<br>
										<li>살아남은 아이</li>
										<br>
										<li>사라진 유리창</li>
										<br>
										<li>발신자 없는 편지들</li>
										<br>
										<li>숲지기</li>
										<br>
										<li>다이애건 앨리</li>
										<br>
										<li>9와 4분의 3번 승강장에서 떠나는 여행</li>
										<br>
										<li>기숙사 배정 모자</li>
										<br>
										<li>마법약 교수</li>
										<br>
										<li>한밤의 결투</li>
										<br>
										<li>핼러윈</li>
										<br>
										<li>퀴디치</li>
										<br>
										<li>소망의 거울</li>
										<br>
										<li>니콜라 플라멜</li>
										<br>
										<li>노르웨이 리지백 노버트</li>
										<br>
										<li>금지된 숲</li>
										<br>
										<li>바닥의 문을 지나서</li>
										<br>
										<li>두 얼굴을 가진 남자</li>
										<br>
									</ol>
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
								<strong><br>
									<h2>조앤 K. 롤링</h2> <br>

									<ul>
										<li>국적: 영국</li>
										<li>출생일: 1965년 7월 31일</li>
									</ul> <br> <br>

									<h2>학력</h2>
									<ul>
										<br>
										<li>하버드대학교 명예박사</li>
										<li>엑시터대학교 명예박사 (불문학, 고전학 학사)</li>
									</ul> <br> <br>

									<h2>경력</h2>
									<ul>
										<br>
										<li>포르투갈 인카운터 영어학교 교사</li>
									</ul> <br> <br>

									<h2>수상</h2>
									<ul>
										<br>
										<li>2012년: 런던시 자유상</li>
										<li>2010년: 안데르센 문학상</li>
										<li>2009년: 레종도뇌르 슈발리에 훈장</li>
										<li>2001년: 휴고상</li>
										<li>2000년: 올해의 작가상</li>
									</ul> <br> <br></strong>
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
						<textarea id="commentcontent"></textarea>
						<button id="comment-btn">댓글쓰기</button>
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