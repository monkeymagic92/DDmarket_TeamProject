<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 변경</title>
<link rel="stylesheet" href="/res/css/info.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div id="container">
        <main>
            <div class="user-header">
                <div class="div-logo">
                    <a href="/index/main"><img src="/res/img/logo.jpg" alt=""></a>
                </div>
                <div class="head-user">
                    <span class="head-user-txt">
                        <a href="/user/logout">로그아웃</a> ㅣ <a href="#">단디톡</a>
                    </span>
                </div>
            </div>
            <h2 class="title">프로필 사진 변경</h2>
            <span class="line"></span>
            
            <section class="pro_Img">
                <div class="imgBtn">
                    <div class="pImgbox">
                        <label for="file">
                        	<c:if test="${loginUser.profile_img == null }">
                        		<img src="/res/img/lion.jpg" onchange="setThumbnail(e)" alt="" class="img">
                        	</c:if>
                        	<c:if test="${loginUser.profile_img != null }">
                                <img src="/res/img/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="img">                    	
                        	</c:if>
                        </label>
                        <div class="div-cngBtn">
                            <form id="imgFrm" action="/user/imgUpload" method="post" enctype="multipart/form-data" onsubmit="return imgChk()">
                                <input type="file" name="user_profile_img" id="file" accept="image/png, image/jpeg, image/jpg">
                                <input class="cngImg" type="submit" value="사진변경">
                            </form>
                        </div>
                        <div class="delBtn">
                            <form id="imgDelFrm" action="/user/imgDel" method="post">
                                <input class="cngImg" type="submit" value="사진삭제">
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            
            <h2 class="title">비밀번호 변경</h2>
            <span class="line"></span>
            <section class="user-pw">
                <form id="pwFrm" action="/user/info" method="post" onsubmit="return pwChk()">
                    <div class="pw-chg">
                        <input type="password" name="user_pw" class="pw" placeholder="비밀번호">
                        <input type="password" name="user_rpw" class="pwre" placeholder="비밀번호 확인">
                        <input type="hidden" name="result" value="3">
                        <button type="submit" class="pwBtn" >비밀번호 변경</button>
                    </div>
                </form>
            </section>
            <h2 class="title">닉네임 변경</h2>
            <span class="line"></span>
            <section class="user-nick">
                <form id="nickFrm" action="/user/info" method="post" onsubmit="return nickChk()">
                    <input type="text" name="nick" id="nick_input" value="${loginUser.nick}" placeholder="닉네임">
                    <i id="nickClick" class="animate__rubberBand animate__animated fas fa-check" ></i>
                    <input type="hidden" name="result" value="4">                    
                    <button type="button" class="nickChk" onclick="chkNick()">중복체크</button>                    
                    <input type="hidden" id="nickUnChk" name="nickUnChk" value="unChk">
                    <button class="fixBtn">변경</button>
                </form>
            </section>
            <!-- input 태그에서 키보드로 임의적으로 주소 못치게 막아주기 (input 태그속성 사용하거나, jquery 함수사용) -->
            <h2 class="title">주소 변경</h2>
            <span class="line"></span>
            <section class="user-addr">
                <form id="addrFrm" action="/user/info" method="post" onsubmit="return addrChk()">
                	<div class="div_addr">
                    	<input type="text" id="sample4_postcode" name="post" class="addr_input" placeholder="클릭할시 주소검색창이 나타납니다" onclick="sample4_execDaumPostcode()"><br>
                    	<input id="addrUnChk" name="addrUnChk" type="hidden" value="unChk">
						<input type="text" id="sample4_jibunAddress" name="addr" class="addr_input" placeholder="지번주소" onclick="sample4_execDaumPostcode()"><br>
						<input type="text" id="sample4_roadAddress" name="road" class="addr_input" placeholder="도로명주소" onclick="sample4_execDaumPostcode()">
						<input id="postChk" name="postChk" type="hidden" value="unChk">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
						<input type="hidden" name="result" value="5">
					</div>
					<div class="div-btn">
                    	<button class="addrBtn">변경</button>
                    </div>
                </form>
            </section>
            <h2 class="title">이메일 변경</h2>
		    <span class="line"></span>
		    <section class="user-email">
		    <form id="emailFrm" action="/user/info" method="post" onsubmit="return emailChk()">
			    <input type="email" name="email" id="email_input" value="${loginUser.email }" placeholder="이메일">
			    <i id="emailClick" class="animate__rubberBand animate__animated fas fa-check"></i>
			    <input id="emailUnChk" name="emailUnChk" type="hidden" value="unChk">
			    <button type="button" class="emailChk" onclick="chkEmail()">중복체크</button>			    			    
			    <input type="hidden" name="result" value="6">
			    <button class="emailfixBtn">변경</button>
		    </form>
			</section>
            <h2 class="title">관심 카테고리 선택</h2>
            <div id="categoryChkResult" class="cgMsg"></div>
            <span class="line"></span>
            <section id="category">
                <form id="likeFrm" action="/user/info" method="post" onsubmit="return likeChk()">
	                    <div class="category-box">
	                    	<c:forEach items="${categoryList}" var="item">
		                    	<input type="checkbox" name="categoryLike" id="f-wear" value="${item.i_cg }" onclick="count_ck(this);">
		                        <label for="f-wear">${item.cg_nm }</label>
	                        </c:forEach>
	                    </div>          	
                    <input type="hidden" name="result" value="7">
                    <button class="categoryChg">등록</button>
                </form>
            </section>
        </main>        
    </div>
</body>
 
<script src="/res/js/info.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

if(${imgErr != null}) {
	alert('${imgErr}');
	
} else if(${serverErr != null}) {
	alert('${serverErr}');
	
} else if(${categoryMsg != null}) {
	alert('${categoryMsg}');
}

// 닉네임, 이메일 칸에 입력이 들어올시 체크 아이콘은 숨기고, 다시 체크하도록 유도
$('#nick_input').keydown(function() {
	$('#nickClick').hide();
	nickFrm.nickUnChk.value = 'unChk'
})

$('#email_input').keydown(function() {
	$('#emailClick').hide();
	emailFrm.emailUnChk.value = 'unChk'
})
//


$('.nickChk').click(function() {
	nickFrm.nickUnChk.value = 'chk'
})

$('#emailClick').hide();
$('#nickClick').hide();

$('#sample4_jibunAddress').hide();
$('#sample4_roadAddress').hide();

$('#sample4_postcode').click(function() {
	addrFrm.addrUnChk.value = 'chk'
})

$('.emailChk').click(function() {
	emailFrm.emailUnChk.value = 'chk'
})

	
	// 프로필 이미지 체크
	function imgChk() {
		if(imgFrm.user_profile_img.value.length == 0 ||
				imgFrm.user_profile_img.value == null ||
				imgFrm.user_profile_img.value == '') {
			alert('사진을 변경해주세요')
			return false;
		}
	}
	
	// 비밀번호 체크
	function pwChk() {
		if (pwFrm.user_pw.value.length > 0 || pwFrm.user_pw.value.length == 0) {
			const pass = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/
			
			if(!pass.test(pwFrm.user_pw.value)) {
				alert("비밀번호는 숫자,특수문자,영문을 포함한 8자리 이상 입력해주세요");
				pwFrm.user_pw.value = "";
				pwFrm.user_pw.focus();
				return false;
			}
		}			
		
		if (pwFrm.user_pw.value != pwFrm.user_rpw.value) {
			alert("두 비밀번호를 확인해주세요");
			pwFrm.user_rpw.value = "";
			pwFrm.user_rpw.focus();
			return false;
		}
		
		if(pwFrm.user_pw.value.length > 8) {
			alert('비밀번호가 변경되었습니다')
		}
	}
	
	// 닉네임 체크
	function nickChk() {
		if (nickFrm.nick.value.length == 0 || nickFrm.nick.value.length < 2) {
			alert("닉네임은 2글자 이상입니다");
			nickFrm.nick.focus();
			return false;
		} 
		
		if (nickFrm.nick.value.length > 13) {
			alert("닉네임이 너무 깁니다");
			nickFrm.nick.focus();
			return false;
		}
		
		if(nickFrm.nickUnChk.value != 'chk') {
			alert('닉네임 중복체크를 해주세요')
			return false;			
		}
		
		if(nickFrm.nick.value.length > 2) {
			alert('닉네임이 변경되었습니다')
		}
	}
	
	
	// 주소 체크
	function addrChk() {
		if(addrFrm.post.value.length == 0) {
			alert('주소를 입력해 주세요')
			return false;
		} 
		
		if(addrFrm.post.value == '' || addrFrm.post.value == null) {
			alert('주소를 입력해 주세요')
			return false;
		} else {
			alert('주소가 변경되었습니다')
		}
	}
	
	
	// 이메일 체크
	function emailChk() {
		if (emailFrm.email.value.length == 0) {
			alert("올바른 이메일을 입력해주세요");
			frm.email.focus();
			return false;
		} 
		
		if (emailFrm.email.value.length < 14 ) {
			alert("올바른 이메일을 입력해주세요");
			frm.email.focus();
			return false;
		}
		
		// 이메일 정규화 
		if (emailFrm.email.value.length > 0) {
			const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
			if(!email.test(emailFrm.email.value)) {
				alert('올바른 이메일을 입력해 주세요');
				emailFrm.email.focus();
				return false
			}
		} 
		
		if(emailFrm.emailUnChk.value != 'chk') {
			alert('이메일 중복확인을 클릭해 주세요');
			return false;
		}
		
		if (emailFrm.email.value.length > 14 ) {
			alert("이메일이 변경되었습니다");
		}
	}
	
	// 관심사 체크, 최대갯수 3개제한 
	function count_ck(obj){
		var chkbox = document.getElementsByName("categoryLike");
		var chkCnt = 0;
		for(var i=0; i<chkbox.length; i++){
			if(chkbox[i].checked){
				chkCnt++;
			}			
		}
		
		if(chkCnt > 3){
			alert("관심사는 최대 3개까지 선택가능합니다");
			obj.checked = false;
			return false;
			
		} else if (chkCnt < 3) {
			categoryChkResult.innerText = '관심사는 총 3가지를 선택하세요.';		
			obj.chechked = false;
			return false;
			
		} else if (chkCnt == 3) {
			categoryChkResult.innerText = '';
		} 
	}
	
	
	
	
	// 닉네임 중복체크 (ajax)
	function chkNick() {
		const nick = nickFrm.nick.value
		axios.post('/user/ajaxNickChk', {
			
				nick
				
		}).then(function(res) {
			console.log(res)
			if(res.data == '1') { // 닉네임 없음 (사용가능)
											
							
				if (nickFrm.nick.value.length == 0 || nickFrm.nick.value.length < 2) {
					alert("닉네임은 2글자 이상입니다");
					nickFrm.nick.focus();
					return false;
				} 
				
				if (nickFrm.nick.value.length > 13) {
					alert("닉네임이 너무 깁니다");
					nickFrm.nick.focus();
					return false;
				}
				
				$('#nickClick').show();	
				
				
			} else if(res.data == '2') { // 닉네임 중복됨	
				$('#nickClick').hide();
			
				alert('사용할수 없는 닉네임 입니다.');
				nickFrm.nick.value = '';
				nickFrm.nick.focus();
				
			} else {
				alert('닉네임을 다시 확인해 주세요');
				nickFrm.nick.value = '';
				nickFrm.nick.focus();
			}
		})
	}
	
	
	// 이메일 중복확인
	function chkEmail() {
		const email = emailFrm.email.value
		axios.post('/user/ajaxEmailChk', {
			
				email
				
		}).then(function(res) {
			console.log(res)
			if(res.data == '1') {
				
				if (emailFrm.email.value.length < 14 ) {
					alert("올바른 이메일을 입력해주세요");
					frm.email.focus();
					return false;
				}
				
				if (emailFrm.email.value.length > 0) {
					const email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
					if(!email.test(emailFrm.email.value)) {
						alert('올바른 이메일을 입력해 주세요');
						emailFrm.email.focus();
						return false
					}
				}						
				
				$('#emailClick').show();			
				emailFrm.email.focus()			
				
			} else if(res.data == '2') { //이메일 중복됨
				alert('사용할수 없는 이메일 입니다')
				$('#emailClick').hide();
				emailFrm.email.value = ''
				emailFrm.email.focus()
		
				
			} else {
				alert('이메일을 다시 확인하여 주세요')
				emailFrm.email.focus()
				return false;
			}
		})
	}
	
	
	// 주소api
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	if(addrFrm.addrUnChk.value == 'chk') {
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