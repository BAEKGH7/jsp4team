<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<link href="./css/index.css" rel="stylesheet" /> 
<link href="./css/menu.css" rel="stylesheet" />
<link href="./css/logout.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
//카운트 시작 숫자
var count = 5;
//카운트다운함수
var countdown = setInterval(function(){
//해당 태그에 아래 내용을 출력
$("p.countdown").html("<b><font size='66pt'>" + count + "</font><b>초 후 이동 합니다.");
    //0초면 초기화 후 이동되는 사이트
    if (count == 0) {
        clearInterval(countdown);
        window.open('./index', "_self");
        }
    count--;//카운트 감소
}, 1000);

</script>

</head>
<body>
		<header>
			<div class="top1">
				<img alt="logo" src="./img/logo.png" width="300px;">
				<div class="search">
					<input class="searchText" type="text" placeholder="검색어 입력" color="#a8a8a8;">
					<button class="searchBtn">검색</button>
				</div>
			</div>
			<div class="top2">
				<div class="menu">
				<%@ include file="menu.jsp"%>
				</div>
			</div>
		</header>
   <div class="container">
      <div class="main">
         <div class="mainStyle">
            <article>
            <div class="logout">
               <h1>로그아웃 완료 ! 🫠 </h1><br>
               <p class="countdown"></p>
            </div>
            </article>
         </div>
      </div>
   </div>
</body>
</html>