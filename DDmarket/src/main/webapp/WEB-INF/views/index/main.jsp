<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <div class="sub-title">${loginUser == null ? "단디마켓 인기상품" : "단디마켓 추천상품"}</div>
                <section id="main-section-hot" class="section-cardList">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                           <c:set var="hotBoardList_endNum" value="0" />
                           <c:choose>
                              <c:when test="${fn:length(hotBoardList) <= 4}">
                                 <c:set var="hotBoardList_endNum" value="1" />
                              </c:when>
                              <c:when test="${fn:length(hotBoardList) <= 8}">
                                 <c:set var="hotBoardList_endNum" value="5" />
                              </c:when>
                              <c:otherwise>
                                 <c:set var="hotBoardList_endNum" value="9" />
                              </c:otherwise>
                           </c:choose>
                           <c:set var="recBoardList_endNum" value="0" />
                           <c:choose>
                              <c:when test="${fn:length(recBoardList) <= 4}">
                                 <c:set var="recBoardList_endNum" value="1" />
                              </c:when>
                              <c:when test="${fn:length(recBoardList) <= 8}">
                                 <c:set var="recBoardList_endNum" value="5" />
                              </c:when>
                              <c:otherwise>
                                 <c:set var="recBoardList_endNum" value="9" />
                              </c:otherwise>
                           </c:choose>
                           <c:forEach var="i" begin="1" end="${loginUser == null ? hotBoardList_endNum : recBoardList_endNum}" step="4">
                                 <div class="swiper-slide">
                               <c:forEach var="item" items="${loginUser == null ? hotBoardList : recBoardList}" begin="${i-1}" end="${i+2}">
                                   <article class="card-wrap">
                                       <a href="/board/detail?i_board=${item.i_board}">  
                                           <div class="card-pic">
                                              <c:choose>
                                                 <c:when test="${item.thumImage == ''}">
                                                    <img src="/res/img/lion.jpg">
                                                 </c:when>
                                                 <c:otherwise>
                                                    <img src="/res/img/board/${item.i_board}/${item.thumImage}">
                                                 </c:otherwise>
                                              </c:choose>
                                           </div>
                                           <div class="card-desc">
                                               <h2 class="card-title">${item.title}</h2>
                                               <span class="card-border"></span>
                                               <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>${item.addr}</div>
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
                    <div class="swiper-container">
                            <c:set var="newBoardList_endNum" value="0" />
                           <c:choose>
                              <c:when test="${fn:length(newBoardList) <= 4}">
                                 <c:set var="newBoardList_endNum" value="1" />
                              </c:when>
                              <c:when test="${fn:length(newBoardList) <= 8}">
                                 <c:set var="newBoardList_endNum" value="5" />
                              </c:when>
                              <c:otherwise>
                                 <c:set var="newBoardList_endNum" value="9" />
                              </c:otherwise>
                           </c:choose>
                        <div class="swiper-wrapper">
                           <c:forEach var="i" begin="1" end="${newBoardList_endNum}" step="4">
                                 <div class="swiper-slide">
                               <c:forEach var="item" items="${newBoardList}" begin="${i-1}" end="${i+2}">
                                   <article class="card-wrap">
                                       <a href="/board/detail?i_board=${item.i_board}">  
                                           <div class="card-pic">
                                              <c:choose>
                                                 <c:when test="${item.thumImage == ''}">
                                                    <img src="/res/img/lion.jpg">
                                                 </c:when>
                                                 <c:otherwise>
                                                    <img src="/res/img/board/${item.i_board}/${item.thumImage}">
                                                 </c:otherwise>
                                              </c:choose>
                                           </div>
                                           <div class="card-desc">
                                               <h2 class="card-title">${item.title}</h2>
                                               <span class="card-border"></span>
                                               <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>${item.addr}</div>
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
                <div class="sub-title">카테고리별 인기상품</div>
                <div class="tab_basic">
                    <div class="tab_list_wrap">
                          <div class="tab_list tab_active" data-tabnum="0">
                                <a href="#">여성의류</a>
                            </div>
                       <c:forEach var="item" items="${cgList}" begin="1">
                              <div class="tab_list" data-tabnum="${item.i_cg-1}">
                                <a href="#">${item.cg_nm}</a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="tab_container">
                       <c:forEach var="innerList" items="${cList}">
                       <div class="tab_content">
                                   <c:forEach var="item" items="${innerList}"  begin="0" end="7">
                                      <article class="card-wrap">
                                                <a href="/board/detail?i_board=${item.i_board}">  
                                                    <div class="card-pic">
                                                       <c:choose>
                                                          <c:when test="${item.thumImage == ''}">
                                                             <img src="/res/img/lion.jpg">
                                                          </c:when>
                                                          <c:otherwise>
                                                             <img src="/res/img/board/${item.i_board}/${item.thumImage}">
                                                          </c:otherwise>
                                                       </c:choose>
                                                    </div>
                                                    <div class="card-desc">
                                                        <h2 class="card-title">${item.title}</h2>
                                                        <span class="card-border"></span>
                                                        <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>${item.addr}</div>
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
                </div>
                <section class="main-section-banner">
                    <div class="banner-div_image"><img src="/res/img/sub_banner_2.jpg"></div>
                </section>
                <div class="sub-title">무료나눔</div>
                <section id="main-section-free" class="section-cardList">
                    <div class="swiper-container">
                            <c:set var="freeBoardList_endNum" value="0" />
                           <c:choose>
                              <c:when test="${fn:length(freeBoardList) <= 4}">
                                 <c:set var="freeBoardList_endNum" value="1" />
                              </c:when>
                              <c:when test="${fn:length(freeBoardList) <= 8}">
                                 <c:set var="freeBoardList_endNum" value="5" />
                              </c:when>
                              <c:otherwise>
                                 <c:set var="freeBoardList_endNum" value="9" />
                              </c:otherwise>
                           </c:choose>
                        <div class="swiper-wrapper">
                           <c:forEach var="i" begin="1" end="${freeBoardList_endNum}" step="4">
                                 <div class="swiper-slide">
                               <c:forEach var="item" items="${freeBoardList}" begin="${i-1}" end="${i+2}">
                                   <article class="card-wrap">
                                       <a href="/board/detail?i_board=${item.i_board}">  
                                           <div class="card-pic">
                                              <c:choose>
                                                 <c:when test="${item.thumImage == ''}">
                                                    <img src="/res/img/lion.jpg">
                                                 </c:when>
                                                 <c:otherwise>
                                                    <img src="/res/img/board/${item.i_board}/${item.thumImage}">
                                                 </c:otherwise>
                                              </c:choose>
                                           </div>
                                           <div class="card-desc">
                                               <h2 class="card-title">${item.title}</h2>
                                               <span class="card-border"></span>
                                               <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>${item.addr}</div>
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
            </main>
        </div>
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/res/js/main.js"></script>
<script>





</script>
</html>