<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단디마켓</title>
<link rel="stylesheet" type="text/css" href="/res/css/index/index.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
	<main>
	    <section class="main-section-banner">
	        <!-- Slider main container -->
	        <div class="swiper-container">
	            <!-- Additional required wrapper -->
	            <div class="swiper-wrapper">
	                <!-- Slides -->
	                <div class="swiper-slide"><div class="banner-div_image"><img src="/res/img/main_banner.jpg"></div></div>
	                <div class="swiper-slide">Slide 2</div>
	                <div class="swiper-slide">Slide 3</div>
	            </div>
	            <!-- If we need pagination -->
	            <div class="swiper-pagination"></div>
	
	            <!-- If we need navigation buttons -->
	            <div class="swiper-button-prev"></div>
	            <div class="swiper-button-next"></div>
	        </div>
	    </section>
	    <div class="sub-title">단디마켓 인기상품</div>
	    <section id="main-section-hot" class="section-cardList">
	            <!-- Slider main container -->
	        <div class="swiper-container">
	            <!-- Additional required wrapper -->
	            <div class="swiper-wrapper">
	                <!-- Slides -->
	                <div class="swiper-slide">
	                    <article class="card-wrap">
	                        <a href="#">
	                            <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
	                            <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
	                            <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
	                            <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
	    <section id="main-section-cd_hot" class="section-cardList">
			   <!-- Slider main container -->
			   <div class="swiper-container">
			    <!-- Additional required wrapper -->
			    <div class="swiper-wrapper">
			        <!-- Slides -->
			        <div class="swiper-slide">
			            <article class="card-wrap">
			                <a href="#">
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
			                    <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
                                <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
                                <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
                                <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
                                <div class="card-pic"><img src="/res/img/gookpap.jpg"></div>
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
		
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/res/js/index/index.js"></script>
</html>