<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/res/css/login.css">
</head>
<body>
	<div class="container">
        <main id="main">
            <div class="div-logo"><a href="/index/main"><img class="logo" src="/res/img/logo.jpg"></a></div>
            <form id="frm" action="/user/login" class="div-input" method="post">
            	<!--     확인 다되면 위에 주석풀고 밑에 아디 비번 value값 지우기  -->
            	<!--  <input type="text" name="user_id" value="${user_id }" placeholder="아이디">
                <input type="password" name="user_pw" placeholder="비밀번호">
                -->
                <input type="text" name="user_id" value="test321" placeholder="아이디">
                <input type="password" name="user_pw" value="tkfkd121!@!" placeholder="비밀번호">
                <button type="submit">로그인</button>
                
            </form>
            <div class="div-api">
                <div><a href="#"><img src="/res/img/login_naver.png"></a></div>
                <div><a href="#"><img src="/res/img/login_kakao.png"></a></div>
            </div>
            <ul class="ul-bottom">
                <li><a href="/user/findId">아이디 찾기</a></li>
                <li><a href="/user/findPw">비밀번호 찾기</a></li>
                <li><a href="/user/join">회원가입</a></li>
            </ul>
        </main>     
    </div>
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script>
window.onload = function() {
	frm.user_id.focus();
}
	
if(${data != null}) {
	alert('${data}');
	frm.user_id.focus();
	
} else if (${emailErr != null}) {
	alert('${emailErr}')
}


</script>
</html>