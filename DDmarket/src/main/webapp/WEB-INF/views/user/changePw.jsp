<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="/res/css/findPw.css">
</head>
<body>
	<main id="content">
        <div class="div-logo">
            <a href="/index/main"><img src="/res/img/logo.jpg" alt=""></a>
        </div>
        <form id="frm" action="/user/changePw" method="post" class="div-pwFind" onsubmit="return chk()">
            <input type="password" class="id-txt" name="user_pw" placeholder="변경할 비밀번호를 입력해 주세요">
            <input type="password" class="email-txt" name="user_rpw" placeholder="비밀번호를 확인해 주세요">
            <button type="submit" class="pwFindBtn">비밀번호 변경</button>
        </form>
    </main>
</body>
<script>
if(${changePwMsg != null}) {
	alert('${changePwMsg}');
	location.href="/user/login";
}

function chk() {
	if (frm.user_pw.value.length > 0 || frm.user_pw.value.length == 0) {
		const pass = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/
		
		if(!pass.test(frm.user_pw.value)) {
			alert("비밀번호는 숫자,특수문자,영문을 포함한 8자리 이상 입력해주세요");
			frm.user_pw.value = "";
			frm.user_pw.focus();
			return false;
		}
	}			

	if (frm.user_pw.value != frm.user_rpw.value) {
		alert("두 비밀번호를 확인해주세요");
		frm.user_rpw.value = "";
		frm.user_rpw.focus();
		return false;
	}	
	
}
</script>
</html>