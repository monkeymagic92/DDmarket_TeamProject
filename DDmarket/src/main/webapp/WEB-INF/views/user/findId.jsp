<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/res/css/findId.css">
</head>
<body>
	<main id="content">
        <div class="div-logo">
            <a href="/index/main"><img src="/res/img/logo.jpg" alt=""></a>
        </div>
        <form id="frm" action="/user/findId" method="post" class="div-idFind" onsubmit="return chk()">
            <input type="email" class="email-txt" name="email" placeholder="이메일을 입력해 주세요">
            <button type="submit" class="idBtn">아이디 찾기</button>
        </form>
    </main>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

if(${findIdMsg != null}) {
	alert("${findIdMsg}");
	
} else if (${findIdSuccessMsg != null}) {
	alert("${findIdSuccessMsg}")
	location.href="/user/login";
}


function chk() {
	if (frm.email.value.length == 0) {
		alert("올바른 이메일을 입력해주세요");
		frm.email.focus();
		return false;
	} 

	if (frm.email.value.length < 14 ) {
		alert("올바른 이메일을 입력해주세요");
		frm.email.focus();
		return false;
	}

	if (frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('올바른 이메일을 입력해 주세요');
			frm.email.focus();
			return false;
		}
	}
}
</script>
</html>