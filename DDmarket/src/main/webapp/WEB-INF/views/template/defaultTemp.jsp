<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단디마켓</title>
</head>
<!--(header / nav) : 머리글 / (section / article ) : 본문 / (aside) : 사이드 본문 / (footer) : 바닥글-->
<body>	
	<div id="container">
		<!-- header -->
        <header id="header">
            <div id="header-title">
                <a href="/index/main"><img class="logo" src="/res/img/logo.jpg"></a>
                <div id="search-wrap" >
                    <input type="text" placeholder="상품명, 지역명 검색">
                    <button id="header-search-btn"><span class="iconify icon-search" data-inline="false" data-icon="mdi-light:magnify" style="color: #3b73c8; font-size: 30px;"></span></button>
                </div>
                <a href="#"><span class="iconify icon-account" data-inline="false" data-icon="mdi-light:account" style="color: #3b73c8; font-size: 50px;"></span></a>
                <a href="#"><span class="iconify icon-cart" data-inline="false" data-icon="mdi-light:cart" style="color: #3b73c8; font-size: 50px;"></span></a> 
            </div>
            <div id="header-cd">
                <span class="iconify icon-menu" data-inline="false" data-icon="mdi-light:menu" style="color: #3b73c8; font-size: 50px;"></span>
            </div>
            <div id="header-user">
                <span class="header-user-text"><a href="/user/login">로그인</a> ㅣ <a href="/user/join">회원가입</a></span>
            </div>
        </header>	
	    
	    <!-- main -->  
	    <main>
	    	<section>
	    		<jsp:include page="/WEB-INF/views/${view}.jsp"></jsp:include>
	    	</section>			      
	    </main>
	        
   		<!-- footer -->	    
	    <footer id="footer">
	        <div id="footer-container">
	            <div id="footer-left">
	               <div id="footer-logo"><a href="#"><img src="/res/img/footer_logo.jpg"></a></div>
	                <ul class="footer-left-list footer-list">
	                    <li class="footer-left-list-item"><span class="iconify icon-FAQ" data-inline="false" data-icon="emojione-monotone:question-mark" style="color: #aeaeae; font-size: 20px;"></span><span>자주 묻는 질문</span></li>
	                    <li class="footer-left-list-item"><span class="iconify icon-news" data-inline="false" data-icon="ic:baseline-notifications" style="color: #aeaeae; font-size: 23px;"></span><span>단디소식</span></li>
	                    <li class="footer-left-list-item"><span class="iconify icon-customer" data-inline="false" data-icon="ri:customer-service-2-fill" style="color: #aeaeae; font-size: 20px;"></span><span>고객센터</span></li>
	                </ul>
	                <div class="footer-left-border"></div>
	                <div class="footer-desc">사업자 등록번호 : 000-00-00000 대구광역시 중구 중앙대로 366 반월센트럴타워 10층</div>
	                <div class="footer-dsec">©Dandi Market Inc.</div>
	            </div>
	            <div id="footer-right">
	                <ul class="footer-right-logo_list">
	                    <li class="footer-right-logo_list_item"><span class="iconify icon-facebook" data-inline="false" data-icon="fa-brands:facebook-square" style="color: #aeaeae; font-size: 30px;"></span></li>
	                    <li class="footer-right-logo_list_item"><span class="iconify icon-kakaotalk" data-inline="false" data-icon="vs:kakaotalk-square" style="color: #aeaeae; font-size: 28px;"></span></li>
	                    <li class="footer-right-logo_list_item"><span class="iconify icon-instagram" data-inline="false" data-icon="entypo-social:instagram" style="color: #aeaeae; font-size: 30px;"></span></li>
	                </ul>
	                <div class="footer-right-border"></div>
	                <ul class="footer-right-list">
	                    <li class="footer-right-list_item">이용약관</li>
	                    <li class="footer-right-list_item">개인정보취금방침</li>
	                    <li class="footer-right-list_item">위치기반서비스 이용약관</li>
	                </ul>
	            </div>
	        </div>
	    </footer>
	</div>
</body>
</html>