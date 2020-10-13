<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="/res/css/user/login.css">
<link rel="stylesheet" type="text/css" href="/res/css/common/common.css">
</head>
<body>
	<div id="container">
        <main id="main">
            <div class="div-logo"><a href="/index/main"><img class="logo" src="/res/img/logo.jpg"></a></div>
            <div class="div-input">
                <input type="text" placeholder="아이디">
                <input type="text" placeholder="비밀번호">
                <button>로그인</button>
            </div>
            <div class="div-api">
                <div><a href="#"><img src="/res/img/login_naver.png"></a></div>
                <div><a href="#"><img src="/res/img/login_kakao.png"></a></div>
            </div>
            <ul class="ul-bottom">
                <li><a href="#">아이디 찾기</a></li>
                <li><a href="#">비밀번호 찾기</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
        </main>     
    </div>
    <script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
</body>
</html>