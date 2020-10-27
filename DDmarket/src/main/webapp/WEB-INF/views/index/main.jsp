<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index - main</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css" href="/res/css/index.css">
</head>
<body>
<div id="container">
            <main>
                <section class="main-section-banner">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide"><div class="banner-div_image banner-div_mainImage"><img src="/res/img/main_banner.jpg"></div></div>
                            <div class="swiper-slide"><div class="banner-div_image banner-div_mainImage"><img src="/res/img/main_banner_2.jpg"></div></div>
                            <div class="swiper-slide"><div class="banner-div_image banner-div_mainImage"><img src="/res/img/main_banner_3.jpg"></div></div>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </section>
                <div class="sub-title">단디마켓 인기상품</div>
                <section id="main-section-hot" class="section-cardList">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        	<c:forEach var="i" begin="1" end="9" step="4">
	                           	<div class="swiper-slide">
	                            <c:forEach var="item" items="${hotBoardList}" begin="${i-1}" end="${i+3}">
	                                <article class="card-wrap">
	                                    <a href="#">  
	                                        <div class="card-pic">
	                                        	<c:choose>
	                                        		<c:when test="${item.image_1 == null}">
	                                        			<img src="/res/img/lion.jpg">
	                                        		</c:when>
	                                        		<c:otherwise>
	                                        			<img src="/res/img/board/${item.i_board}/${item.image_1}">
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </div>
	                                        <div class="card-desc">
	                                            <h2 class="card-title">${item.title}</h2>
	                                            <span class="card-border"></span>
	                                            <div>
	                                            <span class="card-price">
	                                            	<c:choose>
		                                            	<c:when test="${item.price == 0}"><span class="card-price">무료</span></c:when>
		                                            	<c:otherwise><span class="card-price"><fmt:formatNumber value="${item.price}" pattern="#,###" />원</span></c:otherwise>
	                                            	</c:choose>
	                                            <span class="card-r_dt">${item.r_dt}</span>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </article>
	                              </c:forEach>
	                            </div>
                            </c:forEach>
                        </div>
                        <div class="swiper-pagination"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                        <div class="swiper-scrollbar"></div>
                    </div>
                </section>
                <section class="main-section-banner">
                    <div class="banner-div_image"><img src="/res/img/sub_banner_1.jpg"></div>
                </section>
                <div class="sub-title" id="sub-title-new"><span class="iconify icon-new" data-inline="false" data-icon="mdi:new-box" style="color: #f84c4c; font-size: 40.488094329833984px;"></span>새로 등록된 상품</div>
                <section id="main-section-new" class="section-cardList">
                            <!-- Slider main container -->
                            <div class="swiper-container">
                                <!-- Additional required wrapper -->
                                <div class="swiper-wrapper">
                                    <!-- Slides -->
                                    <div class="swiper-slide">
                                        <article class="card-wrap">
                                            <a href="#">
                                                <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                <div class="card-desc">
                                                    <h2 class="card-title">돼지국밥 세트</h2>
                                                    <span class="card-border"></span>
                                                    <span class="card-price">10,000원</span>
                                                    <span class="card-r_dt">3시간전</span>
                                                </div>
                                            </a>
                                        </article>
                                        <article class="card-wrap">
                                            <a href="#">
                                                <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                <div class="card-desc">
                                                    <h2 class="card-title">돼지국밥 세트</h2>
                                                    <span class="card-border"></span>
                                                    <span class="card-price">10,000원</span>
                                                    <span class="card-r_dt">3시간전</span>
                                                </div>
                                            </a>
                                        </article>
                                        <article class="card-wrap">
                                            <a href="#">
                                                <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                <div class="card-desc">
                                                    <h2 class="card-title">돼지국밥 세트</h2>
                                                    <span class="card-border"></span>
                                                    <span class="card-price">10,000원</span>
                                                    <span class="card-r_dt">3시간전</span>
                                                </div>
                                            </a>
                                        </article>
                                        <article class="card-wrap">
                                            <a href="#">
                                                <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                <div class="card-desc">
                                                    <h2 class="card-title">돼지국밥 세트</h2>
                                                    <span class="card-border"></span>
                                                    <span class="card-price">10,000원</span>
                                                    <span class="card-r_dt">3시간전</span>
                                                </div>
                                            </a>
                                        </article>
                                    </div>
                                    <div class="swiper-slide">Slide 2</div>
                                    <div class="swiper-slide">Slide 3</div>
                                </div>
                                <!-- If we need pagination -->
                                <div class="swiper-pagination"></div>
        
                                <!-- If we need navigation buttons -->
                                <div class="swiper-button-prev"></div>
                                <div class="swiper-button-next"></div>
        
                                <!-- If we need scrollbar -->
                                <div class="swiper-scrollbar"></div>
                            </div>
                </section>
                <div class="sub-title">카테고리별 인기상품</div>
                <div class="tab_basic">
                    <div class="tab_list_wrap">
                            <div class="tab_list tab_active" data-tabnum="0">
                                <a href="#">여성의류</a>
                            </div>
                            <div class="tab_list" data-tabnum="1">
                                <a href="#">남성의류</a>
                            </div>
                            <div class="tab_list" data-tabnum="2">
                                <a href="#">패션잡화</a>
                            </div>
                            <div class="tab_list" data-tabnum="3">
                                <a href="#">도서ㅣ티켓</a>
                            </div>
                            <div class="tab_list" data-tabnum="4">
                                <a href="#">생활ㅣ가구</a>
                            </div>
                            <div class="tab_list" data-tabnum="5">
                                <a href="#">디지털ㅣ가전</a>
                            </div>
                            <div class="tab_list" data-tabnum="6">
                                <a href="#">뷰티ㅣ미용</a>
                            </div>
                            <div class="tab_list" data-tabnum="7">
                                <a href="#">유아동ㅣ출산</a>
                            </div>
                            <div class="tab_list" data-tabnum="8">
                                <a href="#">기타</a>
                            </div>
                            <div class="tab_list" data-tabnum="9">
                                <a href="#">무료 나눔</a>
                            </div>
                    </div>
                        <div class="tab_container">
                            <div class="tab_content">
                                <section id="main-section-cd_hot" class="section-cardList">
                                    <!-- Slider main container -->
                                    <div class="swiper-container">
                                     <!-- Additional required wrapper -->
                                     <div class="swiper-wrapper">
                                         <!-- Slides -->
                                         <div class="swiper-slide">
                                             <article class="card-wrap">
                                                 <a href="#">
                                                     <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                     <div class="card-desc">
                                                         <h2 class="card-title">돼지국밥 세트</h2>
                                                         <span class="card-border"></span>
                                                         <span class="card-price">10,000원</span>
                                                         <span class="card-r_dt">3시간전</span>
                                                     </div>
                                                 </a>
                                             </article>
                                             <article class="card-wrap">
                                                 <a href="#">
                                                     <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                     <div class="card-desc">
                                                         <h2 class="card-title">돼지국밥 세트</h2>
                                                         <span class="card-border"></span>
                                                         <span class="card-price">10,000원</span>
                                                         <span class="card-r_dt">3시간전</span>
                                                     </div>
                                                 </a>
                                             </article>
                                             <article class="card-wrap">
                                                 <a href="#">
                                                     <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                     <div class="card-desc">
                                                         <h2 class="card-title">돼지국밥 세트</h2>
                                                         <span class="card-border"></span>
                                                         <span class="card-price">10,000원</span>
                                                         <span class="card-r_dt">3시간전</span>
                                                     </div>
                                                 </a>
                                             </article>
                                             <article class="card-wrap">
                                                 <a href="#">
                                                     <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                                     <div class="card-desc">
                                                         <h2 class="card-title">돼지국밥 세트</h2>
                                                         <span class="card-border"></span>
                                                         <span class="card-price">10,000원</span>
                                                         <span class="card-r_dt">3시간전</span>
                                                     </div>
                                                 </a>
                                             </article>
                                         </div>
                                         <div class="swiper-slide">Slide 2</div>
                                         <div class="swiper-slide">Slide 3</div>
                                     </div>
                                     <!-- If we need pagination -->
                                     <div class="swiper-pagination"></div>
             
                                     <!-- If we need navigation buttons -->
                                     <div class="swiper-button-prev"></div>
                                     <div class="swiper-button-next"></div>
             
                                     <!-- If we need scrollbar -->
                                     <div class="swiper-scrollbar"></div>
                                 </div>
                         </section>
                            </div>
                            <div class="tab_content">
                            2 
                            </div>
                            <div class="tab_content">
                            3
                            </div>
                            <div class="tab_content">
                            4
                            </div>
                            <div class="tab_content">
                            5
                            </div>
                            <div class="tab_content">
                            6
                            </div>
                            <div class="tab_content">
                            7
                            </div>
                            <div class="tab_content">
                            8
                            </div>
                            <div class="tab_content">
                            9
                            </div>
                            <div class="tab_content">
                            10
                            </div>
                        </div>
             </div>
                <section class="main-section-banner">
                    <div class="banner-div_image"><img src="/res/img/sub_banner_2.jpg"></div>
                </section>
                <div class="sub-title">무료나눔</div>
                <section id="main-section-free" class="section-cardList">
                           <!-- Slider main container -->
                           <div class="swiper-container">
                            <!-- Additional required wrapper -->
                            <div class="swiper-wrapper">
                                <!-- Slides -->
                                <div class="swiper-slide">
                                    <article class="card-wrap">
                                        <a href="#">
                                            <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                            <div class="card-desc">
                                                <h2 class="card-title">돼지국밥 세트</h2>
                                                <span class="card-border"></span>
                                                <span class="card-price">10,000원</span>
                                                <span class="card-r_dt">3시간전</span>
                                            </div>
                                        </a>
                                    </article>
                                    <article class="card-wrap">
                                        <a href="#">
                                            <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                            <div class="card-desc">
                                                <h2 class="card-title">돼지국밥 세트</h2>
                                                <span class="card-border"></span>
                                                <span class="card-price">10,000원</span>
                                                <span class="card-r_dt">3시간전</span>
                                            </div>
                                        </a>
                                    </article>
                                    <article class="card-wrap">
                                        <a href="#">
                                            <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                            <div class="card-desc">
                                                <h2 class="card-title">돼지국밥 세트</h2>
                                                <span class="card-border"></span>
                                                <span class="card-price">10,000원</span>
                                                <span class="card-r_dt">3시간전</span>
                                            </div>
                                        </a>
                                    </article>
                                    <article class="card-wrap">
                                        <a href="#">
                                            <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                            <div class="card-desc">
                                                <h2 class="card-title">돼지국밥 세트</h2>
                                                <span class="card-border"></span>
                                                <span class="card-price">10,000원</span>
                                                <span class="card-r_dt">3시간전</span>
                                            </div>
                                        </a>
                                    </article>
                                </div>
                                <div class="swiper-slide">Slide 2</div>
                                <div class="swiper-slide">Slide 3</div>
                            </div>
                            <!-- If we need pagination -->
                            <div class="swiper-pagination"></div>
    
                            <!-- If we need navigation buttons -->
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-button-next"></div>
    
                            <!-- If we need scrollbar -->
                            <div class="swiper-scrollbar"></div>
                        </div>
                </section>
            </main>
        </div>
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/res/js/main.js"></script>
</html>