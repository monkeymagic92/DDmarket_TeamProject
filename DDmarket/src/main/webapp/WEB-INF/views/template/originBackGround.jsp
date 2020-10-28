<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<!-- 비밀번호 찾기 인증코드 입력할때 백그라운드 -->
<style>		
	.logo {
		background-color: #6e6868;
		margin-left: 730px;
		margin-top: 45px;
		width: 480px;
		height: 190px;
	}
</style>
<body>
	<div class="backContainer">
		<img class="logo" src="/res/img/logo.jpg">
		<main>
			<c:if test="${view != null }">
		    	<section>
		    		<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
		    	</section>			      
	    	</c:if>
	    </main>
	</div>
</body>
<script>

// 로그아웃 메세지 띄움
if(${logoutMsg != null}) {
	alert('${logoutMsg}');
	location.href="/index/main";
}

// 로그인상태에서 url검색으로 로그인창 갔을시
if(${isLogin != null}) {
	alert('${isLogin}');
	location.href="/index/main"
}

// 로그아웃 상태에서 info 페이지 넘어갈경우 
if(${loginMsg != null}) {
	alert('${loginMsg}');
	location.href="/user/login";
}

</script>
</html>