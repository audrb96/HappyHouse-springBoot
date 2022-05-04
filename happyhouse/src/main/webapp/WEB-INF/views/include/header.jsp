<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="${root}/css/style.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="${root}/js/googleMap.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC0-HJ8XQXXWU52TxrGLViCHP8o1plZhmo&callback=initMap"></script>

<script type="text/javascript">
$(()=>{
	$("#login-btn").on("click", () => {
	    document.getElementById("Pop").style.display = 
	      document.getElementById("Pop").style.display == "none"
	        ? "inline"
	        : "none";
	  });
	  
	$("#logout-btn").on("click", () => {
		location.href = "${root}/user/logout";
	});

	// 회원정보 버튼 클릭
	$("#user-info").on("click", () => {
		location.href = "${root}/user/mvUserinfo";
	});	
	
	
	
})

</script>
<c:if test="${!empty msg}">
	<script>
	alert("${msg}");
	</script>
</c:if>
<div class="header-top">
	<div class="button-group">
	<c:if test = "${empty userinfo}">
		<a href="${root}/user/mvSignUp"><button type="button" id="signUp-btn"
				class="btn btn-dark">Sign up</button></a>
		<button type="button" class="btn btn-dark" id="login-btn">Login</button>
	</c:if>
	<c:if test = "${!empty userinfo}">
		<button type="button" class="btn btn-dark" id="logout-btn">Logout</button>
		<button type="button" class="btn btn-dark" id="user-info">회원 정보</button>
	</c:if>
	</div>
</div>

<form method="post" action= "${root}/user/login">
	<div id="Pop"
		style="position: absolute; right: 0; width: 300px; height: 300px; background-color: black; color: white; display: none;">
		<div style="margin-top: 20px; margin-left: 15px;">아이디</div>
		<input class="form-control form-control-lg" id="login-id" type="text" name = "ID"
			placeholder="아이디" aria-label=".form-control-lg example"
			style="margin-top: 10px; margin-left: 15px; margin-right: 15px; width: 280px;">
		<div style="margin-top: 20px; margin-left: 15px;">비밀번호</div>
		<input class="form-control form-control-lg" id="login-password" name = "password"
			type="text" placeholder="비밀번호" aria-label=".form-control-lg example"
			style="margin-top: 10px; margin-left: 15px; margin-right: 15px; width: 280px;">
		<button type="submit" class="btn btn-light" id="inner-login-btn"
			style="margin-left: 15px;">로그인</button>
		<a href="${root}/user/mvPwFind"><button type="button" class="btn btn-dark">비밀번호
				찾기</button></a>

	</div>
</form>
<div class="header-container">
	<div class="header">
		<a href="${root}/"><img src="${root}/img/logo.jpg" width="200px" /></a>

		<ul class="nav justify-content-end">
			<li class="nav-item"><a href="${root}/notice/mvNotice">공지사항</a></li>
			<li class="nav-item"><a href="#">오늘의 뉴스</a></li>
			<c:if test = "${!empty userinfo}">
			<li id="find-around" class="nav-item" ><a>주변
					탐방</a></li>
			<li id="interested-region" class="nav-item">
				<a>관심 지역 설정</a>
			</li>
			<li id="interested-around" class="nav-item">
				<a>관심 지역 둘러보기</a>
			</li>
			</c:if>
		</ul>
	</div>
</div>