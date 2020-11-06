<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/res/css/join.css">
<link rel="stylesheet" type="text/css" href="/res/css/animate.css">
<link rel="stylesheet" type="text/css" href="/res/css/common.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div id="container">
        <main>
            <div class="div-logo">
                <a href="/index/main"><img src="/res/img/logo.jpg" alt=""></a>
            </div>
            <form id="frm" action="/user/join" method="post" class="FrmJoin"  onsubmit="return chk()">
                <h2 class="title">약관동의</h2>
                <span class="line"></span>
                <div class="div-chkbox">
                    <div class="box-1">
                        <input type="checkbox" id="chk1" name="chk1">
                        <label for="chk1">이용약관</label>
                        <div class="box-txt">
                            <a>
                                <span class="material-icons">keyboard_arrow_down</span>
                            </a>
                        </div>
                    </div>
                    <div class="box-2">
                        <input type="checkbox" id="chk2" name="chk2">
                        <label for="chk2">개인정보취급방침</label>
                        <div class="box-txt">
                            <a>
                                <span class="material-icons">keyboard_arrow_down</span>
                            </a>
                        </div>
                    </div>
                    <div class="box-3">
                        <input type="checkbox" id="chk3" name="chk3">
                        <label for="chk3">위치기반서비스 이용약관</label>
                        <div class="box-txt">
                            <a>
                                <span class="material-icons">keyboard_arrow_down</span>
                            </a>
                        </div>
                    </div>
                </div>
                <h2 class="title">가입 여부 조회</h2>
                <span class="line"></span>
                <div class="div-email">
                    <div class="box-email">
                        <input type="email" name="email" placeholder="이메일 주소 입력" id="email_txt">
                        <button type="button" id="emailChk" onclick="chkEmail()">이메일 중복체크</button>
                        <input id="emailUnChk" name="emailUnChk" type="hidden" value="unChk">
                        <i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
                    </div>
                </div>
                <h2 class="title">개인 정보 입력</h2>
                <span class="line"></span>
                <div class="div-input">
                    <div>
                        <input type="text" name="user_id" id="id_input" placeholder="아이디">
                        <button type="button" id="idChk" onclick="chkId()">아이디 중복체크</button>
                        <input type="hidden" id="idUnChk" name="idUnChk" value="unChk">
                        <i id="idClick" class="animate__rubberBand animate__animated fas fa-check" ></i>                        
                    </div>
                    <div><input type="password" name="user_pw" id="pw_input" placeholder="비밀번호"></div>
                    <div><input type="password" name="user_rpw" id="pw_input2" placeholder="비밀번호 확인"></div>
                    <div><input type="text" name="nm" id="nm_input" placeholder="이름"></div>
                    <div>
                        <input type="text" name="nick" id="nick_input" placeholder="닉네임">
                        <button type="button" id="nickChk" onclick="chkNick()">닉네임 중복체크</button>
                        <i id="nickClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
                        <input id="nickUnChk" name="nickUnChk" type="hidden" value="unChk">
                    </div>
                                                  
                    <div>
                    	<input type="text" id="sample4_postcode" name="post" placeholder="클릭할시 주소검색창이 나타납니다" onclick="sample4_execDaumPostcode()" readonly><br>
                    	<input id="addrUnChk" name="addrUnChk" type="hidden" value="unChk">
						<input type="text" id="sample4_jibunAddress" name="addr" placeholder="지번주소" onclick="sample4_execDaumPostcode()"><br>
						<input type="text" id="sample4_roadAddress" name="road" placeholder="도로명주소" onclick="sample4_execDaumPostcode()">
						<input id="postChk" name="postChk" type="hidden" value="unChk">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                    </div>
                    
                    <div>
                    	<input type="hidden" name="uNum" value="${uNumCode }">
                    	<input type="hidden" name="joinPass" value="1">
                    </div>
                </div>
                <button type="submit" id="joinBtn">회원가입</button>
            </form>
        </main>
    </div>
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script>
window.onload = function() {
	frm.email.focus()
}
if (${joinErrMsg != null}) {
	alert('${joinErrMsg}');
}
$('#idClick').hide();
$('#emailClick').hide();
$('#nickClick').hide();
$('#sample4_jibunAddress').hide();
$('#sample4_roadAddress').hide();
$('#sample4_postcode').click(function() {
	frm.addrUnChk.value = 'chk'
})
$('#emailChk').click(function() {
	frm.emailUnChk.value = 'chk'
})
$('#idChk').click(function() {
	frm.idUnChk.value = 'chk'
})
$('#nickChk').click(function() {
	frm.nickUnChk.value = 'chk'
})
$('#nick_input').keydown(function() {
	$('#nickClick').hide();
	frm.nickUnChk.value = 'unChk'
})
$('#email_txt').keydown(function() {
	$('#emailClick').hide();
	frm.emailUnChk.value = 'unChk'
})
$('#id_input').keydown(function() {
	$('#idClick').hide();
	frm.idUnChk.value = 'unChk'
})
//
function chk() {	
	if($('#chk1').is(":checked") == false){
	    alert('약간동의를 체크해 주세요');
	    return false;
	    
	} else if($('#chk2').is(":checked") == false) {
		alert('약간동의를 체크해 주세요');
		return false;
		
	} else if($('#chk3').is(":checked") == false) {
		alert('약간동의를 체크해 주세요');
		return false;
	}
	
		
	if (frm.user_id.value.length < 6) {
		alert("ID는 5글자 이상 입력해주세요");		
		frm.user_id.focus();
		return false;
	} 
	
	if (frm.user_id.value.length > 19) {
		alert("ID가 너무 깁니다");
		frm.user_id.focus();
		return false;
	}
	
	// 아이디 정규화 (영어, 숫자만 가능)
	if(frm.user_id.value.length > 0) {
		const regExpId = /^[0-9a-z]+$/;
		if(!regExpId.test(frm.user_id.value)) {
			alert('아이디는 영문자, 숫자만 가능합니다');
			frm.user_id.focus();
			return false;
		}
	}    
	
	// 비밀번호 정규식 : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
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
	
	if (frm.nm.value.length == 0 || frm.nm.value.length < 2) {
		alert("올바른 이름을 입력해 주세요");
		frm.nm.focus();
		return false;
	}
	
	// 한글 정규화			
	if (frm.nm.value.length > 0) {
		const korean = /[^가-힣]/;
		
		if(korean.test(frm.nm.value)) {
			alert("올바른  이름을 입력해 주세요");
			frm.nm.focus();
			return false;
		}
	}
	
	
	if (frm.nick.value.length == 0 || frm.nick.value.length < 2) {
		alert("닉네임은 2글자 이상입니다");
		frm.nick.focus();
		return false;
	} 
	
	if (frm.nick.value.length > 13) {
		alert("닉네임이 너무 깁니다");
		frm.nick.focus();
		return false;
	}
	
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
	
	// 이메일 정규화 
	if (frm.email.value.length > 0) {
		const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(!email.test(frm.email.value)) {
			alert('올바른 이메일을 입력해 주세요');
			frm.email.focus();
			return false
		}
	}
	
	if(frm.post.value.length == 0) {
		alert('주소를 입력해 주세요');
		return false;
	}
	
	if (frm.nm.value.length > 2 
			&& frm.idUnChk.value != 'unChk' 
			&& frm.emailUnChk.value != 'unChk'
			&& frm.nickUnChk.value != 'unChk'
			) {
		
		alert('회원가입이 되었습니다');
		location.href='/user/login';	
	}
	
	if(frm.emailUnChk.value == 'unChk') {
		alert('이메일 중복확인을 클릭해주세요');
		return false;
	}
	
	if(frm.idUnChk.value == 'unChk') {
		alert('아이디 중복확인을 클릭해주세요')
		return false;
	}
	
	if(frm.nickUnChk.value == 'unChk') {
		alert('닉네임 중복확인을 클릭해주세요')
		return false;
	}	
}
// 이메일 중복확인
function chkEmail() {
	const email = frm.email.value
	axios.post('/user/ajaxEmailChk', {
		
			email
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '1') {
			
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
					return false
				}
			}						
			
			$('#emailClick').show();			
			frm.email.focus()			
			
		} else if(res.data == '2') { //이메일 중복됨
			alert('사용할수 없는 이메일 입니다')
			$('#emailClick').hide();
			frm.email.value = ''
			frm.email.focus()
	
			
		} else {
			alert('이메일을 다시 확인하여 주세요')
			frm.email.focus()
			return false;
		}
	})
}
// 아이디 중복확인
function chkId() {
	const user_id = frm.user_id.value
	axios.post('/user/ajaxIdChk', {
		
			user_id  	
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '2') { //아이디 없음
			
			if (frm.user_id.value.length < 6) {
				alert("ID는 5글자 이상 입력해주세요");		
				frm.user_id.focus();
				return false;
			} 
			
			if (frm.user_id.value.length > 19) {
				alert("ID가 너무 깁니다");
				frm.user_id.focus();
				return false;
			}
			
			if(frm.user_id.value.length > 0) {
				const regExpId = /^[0-9a-z]+$/;
				if(!regExpId.test(frm.user_id.value)) {
					alert('아이디는 영문자, 숫자만 가능합니다');
					frm.user_id.focus();
					return false;
				}
			}
		
			$('#idClick').show();	
			frm.user_pw.focus();
			
		} else if(res.data == '3') { //아이디 중복됨	
			$('#idClick').hide();
	
			alert('사용할수 없는 아이디 입니다.');
			frm.user_id.value = '';
			frm.user_id.focus();
			
		} else if(res.data == '4') { // 아이디 입력안했을시
			alert('아이디를 입력해 주세요');
			frm.user_id.focus()
		}
	})
}
// 닉네임 중복확인
function chkNick() {
	const nick = frm.nick.value
	axios.post('/user/ajaxNickChk', {
		
			nick
			
	}).then(function(res) {
		console.log(res)
		if(res.data == '1') { // 닉네임 없음 (사용가능)
										
						
			if (frm.nick.value.length == 0 || frm.nick.value.length < 2) {
				alert("닉네임은 2글자 이상입니다");
				frm.nick.focus();
				return false;
			} 
			
			if (frm.nick.value.length > 13) {
				alert("닉네임이 너무 깁니다");
				frm.nick.focus();
				return false;
			}
			
			$('#nickClick').show();	
			
			
		} else if(res.data == '2') { // 닉네임 중복됨	
			$('#nickClick').hide();
	
			alert('사용할수 없는 닉네임 입니다.');
			frm.nick.value = '';
			frm.nick.focus();
			
		} else {
			alert('닉네임을 다시 확인해 주세요');
			frm.nick.value = '';
			frm.nick.focus();
		}
	})
}
// 주소검색 api 
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	if(frm.addrUnChk.value == 'chk') {
        		$('#sample4_jibunAddress').show();
        		$('#sample4_roadAddress').show();
        	}
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
</html>