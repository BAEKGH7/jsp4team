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
<script type="text/javascript" src="./js/menu.js"></script>
<meta http-equiv="Refresh" content="5; ./index">
</head>
<body>
	<header>
   	<%@ include file="menu.jsp"%>
	</header>
   <div class="container">
      <div class="main">
         <div class="mainStyle">
            <article>
            <div class="logout">
               <h1>로그아웃 완료 ! 🫠 </h1><br>
               <b>5초 후 메인 화면으로 이동합니다~</b>
            </div>
            </article>
         </div>
      </div>
   </div>
</body>
</html>