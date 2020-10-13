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
				
				<!-- 지도 -->
				<input type="text" id="sample5_address" placeholder="주소">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				
            </form>
        </div>
        <button type="submit" id="joinBtn">회원가입</button>
        </main>
    </div>
</body>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9996836ad8617fab6206b5bcc9625c1f&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});

////////////// 아래부터는 주소검색관련 //////////////
//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.


//위에서 생성한 themeObj객체를 우편번호 서비스 생성자에 넣습니다.
//생성자의 자세한 설정은 예제 및 속성탭을 확인해 주세요.
/*
new daum.Postcode({
   theme: themeObj
}).open();

new daum.Postcode({
   theme: themeObj
}).embed(target);
*/

var width = 550;
var height = 650;

function sample5_execDaumPostcode() {
	new daum.Postcode({
				
		width : width,
		height : height,
		
		
	    oncomplete: function(data) {
	        var addr = data.address; // 최종 주소 변수
	
	        // 주소 정보를 해당 필드에 넣는다.
	        document.getElementById("sample5_address").value = addr;
	        // 주소로 상세 정보를 검색
	        geocoder.addressSearch(data.address, function(results, status) {
	            // 정상적으로 검색이 완료됐으면
	            if (status === daum.maps.services.Status.OK) {
	
	                var result = results[0]; //첫번째 결과의 값을 활용
	
	                // 해당 주소에 대한 좌표를 받아서
	                var coords = new daum.maps.LatLng(result.y, result.x);
	                // 지도를 보여준다.
	                mapContainer.style.display = "block";
	                map.relayout();
	                // 지도 중심을 변경한다.
	                map.setCenter(coords);
	                // 마커를 결과값으로 받은 위치로 옮긴다.
	                marker.setPosition(coords)
	            }
	        });
	    }
	}).open({
		left: (window.screen.width / 2) - (width / 2),
	    top: (window.screen.height / 2) - (height / 2)
	});
}
</script>
</html>