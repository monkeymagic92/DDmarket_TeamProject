<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 인증코드 입력</title>
<link rel="stylesheet" href="/res/css/common.css">
<link rel="stylesheet" href="/res/css/cerCode.css">
</head>
<body>
	<div id="myModal" class="modal"> 
		<!-- Modal content -->
		<div class="modal-content">
            <div class="div-logo">
                <img src="/res/img/logo.jpg" alt="">
            </div>
            <div class="div-info">
                <span class="txt-top">회원가입시 입력된 이메일 주소로 인증코드가 전송되었습니다.</span>
                <span class="txt-bottom">인증번호를 확인 후 아래의 인증 코드를 입력해 주세요!</span>
            </div>
		      	<c:if test="${cerCodeCount == null }">
		      		<div></div>
		      	</c:if>
		     	<c:if test="${cerCodeCount > 0 }">
		      		<div id="cerCodeCount">${cerCodeCount }회 실패</div>
		        </c:if>
		    <!-- Modal body -->
		    <div class="modal-body">
		    	<form id="frm" action="/user/cerCode" method="post" onsubmit="return chk()">
		    		<input type="text" name="cerCode" placeholder="이메일 인증코드 입력">
                    <input type="submit" class="codebtn" value="입 력">
		    	</form>
		    </div>
		    
		    <!-- Modal bottom -->
		    <div class="modal-bottom">
				<button type="button" class="pop_bt" onclick="moveToLogin()">
					종료
				</button>
		    </div>
		</div>
    </div>
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

window.onload = function() {
	alert('입력하신 메일로 인증코드가 발송되었습니다');
	var url = "https://www.naver.com";
	var name = "비밀번호찾기 인증코드";
	var option = "width = 980, height = 830, top = 100, left = 200, location = no";
	var win = window.open(url, name, option);
}
	
	if(${cerCodeMsg != null}) {
		alert('${cerCodeMsg}');
	}
	
	
	function moveToLogin() {
		location.href="/user/login";
	}
		
	
	jQuery(document).ready(function() {
	    $('#myModal').show();
	});
	
	function close_pop(flag) {
	 $('#myModal').hide();
	}
	
	function chk() {
		if(frm.cerCode.value.length > 6) {
			alert('인증코드 6자리를 입력해주세요');
			frm.cerCode.value = '';
			return false;
		}
	}
	
	
</script>

</html>