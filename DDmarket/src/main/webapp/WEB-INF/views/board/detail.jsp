<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/detail.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
</head>
<body>
<!-- test -->
	<div id="container">
	    <main>
            <section id="section-info">
                <div class="swiper-container">
                    <div class="swiper-wrapper" id="imgSwiper">
                    	<!-- thumeImage 폴더 안만들어짐 (집에서는 학원에서 테스트해보기) -->                        	
                        <div class="swiper-slide">
                        	<img src="/res/img/board/${data.i_board }/${data.thumImage}">
                        </div>
                        <div class="swiper-slide">                            	
                        	<img src="/res/img/board/${data.i_board }/${data.image_1}">
                        </div>
                        <div class="swiper-slide">
                        	<img src="/res/img/board/${data.i_board }/${data.image_2}">
                        </div>
                        <div class="swiper-slide">
                        	<img src="/res/img/board/${data.i_board }/${data.image_3}">
                        </div>
                        <div class="swiper-slide">
                        	<img src="/res/img/board/${data.i_board }/${data.image_4}">
                        </div>
                        <div class="swiper-slide">
                         	<img src="/res/img/board/${data.i_board }/${data.image_5}">
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>            
                <div id="div-info-right">
                    <div class="user-info">
                        <div class="profile-img">
                        	<c:if test="${loginUser.profile_img == null }">
                    		<img src="/res/img/yerin.jpg" onchange="setThumbnail(e)" alt="" class="img">
                     	</c:if>
                     	<c:if test="${loginUser.profile_img != null }">
                             <img src="/res/img/profile_img/user/${loginUser.i_user }/${loginUser.profile_img}" class="img">                    	
                     	</c:if>
                        </div>
                        <div class="profile-desc">
                            <div class="nick">${data.nick}</div>
                            <div class="star-ratings-css">
                                <div class="star-ratings-css-top" style="width:80%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                            </div>
                        </div>
                    </div>
                    <h3 id="product-title">${data.title}</h3>
                    <c:if test="${data.price != 0 }">
                    	<div id="product-price">${data.price}원</div>
                    </c:if>
                    <c:if test="${data.price == 0 }">
                    	<div id="product-price">무료</div>
                   	</c:if>
                    <div id="like">
                    	<span class="iconify" data-inline="false" data-icon="fa:heart" style="color: #aeaeae; font-size: 13px;"></span>
                    		&nbsp;&nbsp;2&nbsp;&nbsp;
                    	<span class="iconify" data-inline="false" data-icon="carbon:view-filled" style="color: #aeaeae; font-size: 15px;"></span>
                    		&nbsp;&nbsp;${data.hits}
                    </div>
                    <div id="cd">${data.cg_nm }<span id="r_dt">3시간전</span></div>
                    <div id="addr">
                    	<span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span>
                    		&nbsp;&nbsp;${data.addr}
                    </div>
                    <div id="buttonWrap">
                    	<c:if test="${loginUser.i_user == data.i_user }">
                    		<button onclick="moveToUpd(${data.i_board})">수정하기</button>
                        	<button onclick="moveToDel(${data.i_board})">삭제하기</button>
                    	</c:if>
                    	<c:if test="${loginUser.i_user != data.i_user }">
                    		<button type="submit">
             	            <span class="iconify icon-btn-heart" data-inline="false" data-icon="clarity:heart-solid" style="color: #f05454; font-size: 20px;"></span>
                        		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜
                       		</button>
                        	<button>연락하기</button>
                    	</c:if>				
                    </div>
                </div>
            </section>
            <h2 class="h2-section-title">상품정보</h2>
            <section id="section-desc">
                <p>${data.ctnt }</p>
            </section>
            <h2 class="h2-section-title">상품문의</h2>
            <section id="section-comment">
                <form>
                    <div id="inputWrap"><textarea placeholder="상품문의를 입력 해 주세요"></textarea></div>
                    <button>등록</button>
                </form>
                <div id="commentWrap">
                    <div class="comment-profile-img"><img src="/res/img/yerin.jpg"></div>
                    <div class="comment-profile-desc">
                        <div class="nick">yerin_back<span class="date">20-10-24 &nbsp; 20:30</span></div>
                        <div class="comment">인형크기가 인형크기가 어떻게 되나요?인형크기가 어떻게 되나요?인형크기가 어떻게 되나요?인형크기가 어떻게 되나요?인형크기가 어떻게 되나요?인형크기가 어떻게 되나요?어떻게 되나요?</div>
                        <div class="etc">
                            <a href="#"><div><span class="iconify icon-cmtReg" data-inline="false" data-icon="bi:arrow-right-square" style="color: #A5A2A2; font-size: 12px;"></span><span>댓글달기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-mod" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></div></a>
                        </div>
                    </div>
                </div>
                <div id="commentWrap">
                    <div class="comment-profile-img"><img src="/res/img/yerin.jpg"></div>
                    <div class="comment-profile-desc">
                        <div class="nick">yerin_back<span class="date">20-10-24 &nbsp; 20:30</span></div>
                        <div class="comment">인형크기가 어떻게 되나요?</div>
                        <div class="etc">
                            <a href="#"><div><span class="iconify icon-cmtReg" data-inline="false" data-icon="bi:arrow-right-square" style="color: #A5A2A2; font-size: 12px;"></span><span>댓글달기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-mod" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></div></a>
                        </div>
                    </div>
                </div>                
                <div id="commentWrap">
                    <div class="comment-profile-img"><img src="/res/img/yerin.jpg"></div>
                    <div class="comment-profile-desc">
                        <div class="nick">yerin_back<span class="date">20-10-24 &nbsp; 20:30</span></div>
                        <div class="comment">인형크기가 어떻게 되나요?</div>
                        <div class="etc">
                            <a href="#"><div><span class="iconify icon-cmtReg" data-inline="false" data-icon="bi:arrow-right-square" style="color: #A5A2A2; font-size: 12px;"></span><span>댓글달기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-mod" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</span></div></a>
                            <a href="#"><div><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></div></a>
                        </div>
                    </div>
                </div>
            <div class="pageWrap">
                <a href="#" class="hidden"><span class="iconify icon-page-left" data-inline="false" data-icon="mdi-light:chevron-double-left" style="color: #3b73c8; font-size: 47px;"></span></a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><span class="iconify icon-page-right" data-inline="false" data-icon="mdi-light:chevron-double-right" style="color: #3b73c8; font-size: 47px;"></span></a>
            </div>
            </section>
            <h2 class="h2-section-title">상품후기</h2>
            <section id="section-review">
                <div id="div-review-left">
                    <div class="review-profile-img"><img src="/res/img/yerin.jpg"></div>
                    <div class="review-profile-nick">yerin_back</div>
                    <div class="star-ratings-css">
                        <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                        <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                    </div>
                    <div class="review-profile-reviewNum">15명의 후기</div>
                </div>
                <div id="div-review-right">
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                                <span>yerin_back</span>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">쿨거래 감사합니다</div>
                        </div>
                    </div>
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                                <span>yerin_back</span>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">쿨거래 감사합니다</div>
                        </div>
                    </div>
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                                <span>yerin_back</span>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">쿨거래 감사합니다</div>
                        </div>
                    </div>
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                                <span>yerin_back</span>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">쿨거래 감사합니다</div>
                        </div>
                    </div>
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">yerin_back<span class="rating">(별점)</span></div>
                            <div class="comment">쿨거래 감사합니다</div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="pageWrap">
                <a href="#" class="hidden"><span class="iconify icon-page-left" data-inline="false" data-icon="mdi-light:chevron-double-left" style="color: #3b73c8; font-size: 47px;"></span></a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><span class="iconify icon-page-right" data-inline="false" data-icon="mdi-light:chevron-double-right" style="color: #3b73c8; font-size: 47px;"></span></a>
            </div>
        </main>
    </div>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/res/js/detail.js"></script>
<script>

	if(${updMsg != null}) {
		alert('${updMsg}');
	}

	function moveToUpd(i_board) {
		location.href="/board/saleReg?i_board="+i_board;
	}
	
	function moveToDel(i_board) {
		location.href="/board/saleDel?i_board="+i_board;
	}
	

</script>
</body>
</html>