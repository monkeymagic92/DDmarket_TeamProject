<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/res/css/user/join.css">
<link rel="stylesheet" type="text/css" href="/res/css/common/common.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	 <div id="container">
        <main>
            <div class="div-logo">
                <a href="/index/main"><img src="/res/img/logo.jpg" alt=""></a>
            </div>
            <h2 class="title">약관동의</h2>
            <span class="line"></span>
            <div class="div-chkbox">
                <div class="box-1">
                    <input type="checkbox" id="chk1" name="chk1" onsubmit="return chk()">
                    <label for="chk1">이용약관</label>
                    <div class="box-txt">
                        <a>내용보기
                            <span class="material-icons">keyboard_arrow_down</span>
                        </a>
                    </div>
                </div>
                <div class="box-2">
                    <input type="checkbox" id="chk2">
                    <label for="chk2">개인정보취급방침</label>
                    <div class="box-txt">
                        <a>내용보기
                            <span class="material-icons">keyboard_arrow_down</span>
                        </a>
                    </div>
                </div>
                <div class="box-3">
                    <input type="checkbox" id="chk3">
                    <label for="chk3">위치기반서비스 이용약관</label>
                    <div class="box-txt">
                        <a>내용보기
                            <span class="material-icons">keyboard_arrow_down</span>
                        </a>
                    </div>
                </div>
            </div>
        <h2 class="title">가입 여부 조회</h2>
        <span class="line"></span>
        <div class="div-email">
            <form action="/user/join" method="post" id="frm-email">
                <div class="box-email">
                    <input type="email" placeholder="이메일 주소 입력" id="email_txt">
                    <button type="button" id="emailChk">이메일 중복체크</button>
                </div>
            </form>
        </div>
        <h2 class="title">개인 정보 입력</h2>
        <span class="line"></span>
        <div class="div-input">
            <form id="frm" action="/user/join" method="post">
                <div>
                    <input type="text" placeholder="아이디">
                    <button type="button" id="idChk">아이디 중복체크</button>
                </div>
                <div><input type="password" placeholder="비밀번호"></div>
                <div><input type="password" placeholder="비밀번호 확인"></div>
                <div><input type="text" placeholder="이름"></div>
                <div>
                    <input type="text" placeholder="닉네임">
                    <button type="button" id="nickChk">닉네임 중목체크</button>
                </div>
                
                
                
                <!-- 주소 api (재용작업중) -->
                <div class="form-group">                   
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
				    <button type="button" class="btn btn-default" onclick="execPostCode()">우편번호 찾기</button>                               
				</div>
				<div class="form-group">
				    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				
                <!-- id 받아오기 (우현작업한거)
                <div>
                    <input type="text" placeholder="우편번호" id="addr_front">
                    <input type="text" placeholder="주소" id="addr_back">
                </div>
                 -->
            </form>
        </div>
        <button type="button" id="joinBtn">회원가입</button>
        </main>
    </div>
</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/res/js/addr/addr.js"></script>
<script>

</script>
</html>