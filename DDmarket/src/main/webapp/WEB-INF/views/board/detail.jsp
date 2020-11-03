<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/detail.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
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
                            <c:if test="${data.image_1 != null}">
                            	<c:if test="${data.image_1 != '' }">
		                            <div class="swiper-slide">                            	
		                            	<img src="/res/img/board/${data.i_board }/${data.image_1}">
		                            </div>
                            	</c:if>
                            	<c:if test="${data.image_2 != '' }">
		                            <div class="swiper-slide">
		                            	<img src="/res/img/board/${data.i_board }/${data.image_2}">
		                            </div>
                            	</c:if>
                            	<c:if test="${data.image_3 != '' }">
		                            <div class="swiper-slide">
		                            	<img src="/res/img/board/${data.i_board }/${data.image_3}">
		                            </div>
                            	</c:if>
                            	<c:if test="${data.image_4 != '' }">
		                            <div class="swiper-slide">
		                            	<img src="/res/img/board/${data.i_board }/${data.image_4}">
		                            </div>
                            	</c:if>
                            	<c:if test="${data.image_5 != '' }">
		                            <div class="swiper-slide">
		                             	<img src="/res/img/board/${data.i_board }/${data.image_5}">
		                            </div>
                            	</c:if>
                            </c:if>
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
                            
                            <!-- 별 -->
                            
                            <div class="profile-desc">
                                <div class="nick">${data.nick}</div>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-css-top" style="width:80%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div>${data.grade}</div>
                            
                            
                            
                        </div>
                        <h3 id="product-title">${data.title}</h3>
                        <c:if test="${data.price != 0 }">
                        	<div id="product-price"><fmt:formatNumber value="${data.price}" pattern="#,###" />원</div>
                        </c:if>
                        <c:if test="${data.price == 0 }">
                        	<div id="product-price">무료</div>
                       	</c:if>
                        <div id="like">
                        	<span class="iconify favorite" data-inline="false" data-icon="fa:heart" style="color: #aeaeae; font-size: 13px;"></span>
                        		&nbsp;&nbsp;${data.tolike}&nbsp;&nbsp;
                        	<span class="iconify" data-inline="false" data-icon="carbon:view-filled" style="color: #aeaeae; font-size: 15px;"></span>
                        		&nbsp;&nbsp;${data.hits}
                        </div>
                        <div id="cd">${data.cg_nm}<span id="r_dt">${data.r_dt}</span></div>
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
                        		<button type="button" onclick="ToLike()">
                        		<c:if test="${data.is_tolike == 1}">
                        			<span id="heart" class="iconify icon-btn-heart heart" data-inline="false" data-icon="clarity:heart-solid" style=" font-size: 20px;"></span>
                        		</c:if>
                        		<c:if test="${data.is_tolike == 0}">
	                 	           	<span id="heart" class="iconify icon-btn-heart unheart" data-inline="false" data-icon="clarity:heart-solid" style=" font-size: 20px;"></span>
               					</c:if>
                                 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;찜
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
            <h2 class="h2-section-title">상품문의 (${cmtCount })</h2>
            <section id="section-comment">
            
            	<!-- 댓글 등록 -->
                <form id="frm" action="/cmt/insert" method="post">
                    <div id="inputWrap">
                    	<textarea name="ctnt" placeholder="상품문의를 입력 해 주세요"></textarea>
                    </div>
                    <button type="button" onclick="insCmt()">등록</button>
	            </form>
	            
                <c:forEach items="${cmtList}" var="item">
	               	<div id="commentWrap" class="cmtList">
	                   <div class="comment-profile-img"><img src="/res/img/profile_img/user/${item.i_user }/${item.profile_img}" class="img"></div>
	                   <div class="comment-profile-desc">
	                       <div class="nick">${item.nick}<span class="date">20-10-24 &nbsp; 20:30</span></div>
	                       <div class="comment">${item.ctnt}</div>
	                       <div class="etc">
	                           <c:if test="${loginUser.i_user == item.i_user }">
	                           	   <div><a onclick="updCmt(${item.i_cmt})"><span><span class="iconify icon-mod" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</span></a></div>
	                           	   <div><a onclick="delCmt(${item.i_cmt})"><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></a></div>
	                           </c:if>
	                       </div>
	                   </div>
	               </div>
               </c:forEach>   
     
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
		alert('${updMsg}')
	}
	
	function moveToUpd(i_board) {
		location.href="/board/saleReg?i_board="+i_board;
	}
	
	function moveToDel(i_board) {
		if(confirm('삭제 하시겠습니까?')){		
		location.href="/board/saleDel?i_board="+i_board;
		}
	}
	
	
	// 별점
	var grade = ${data.grade}/5*80;
	document.querySelector('.star-ratings-css-top').style.width = grade + "%";
	

	
	//찜 하기
	function ToLike(){
		
		
		if(${loginUser.i_user == null}) {
			alert('로그인을 해주세요');
			location.href="/user/login";
			return;
		}
		
		let parameter = {
				params: {
					i_board: `${data.i_board}`
				}
		}
		var icon = heart.classList[2]
		
		switch(icon){
		case "heart":
			parameter.params.proc = 'del'
			break;
		case "unheart":
			parameter.params.proc = 'ins'
			break;
		}
		
		
		axios.get('/user/ajaxToLike', parameter).then(function(res) {
			if(res.data == 1){
				window.location.reload();
				
			}
		})	
    }       



		
	// 댓글 등록
	function insCmt() {
		const i_user = `${loginUser.i_user}`;
		const i_board = `${data.i_board}`
		const ctnt = frm.ctnt.value
		
		
		console.log(ctnt)
		axios.post('/cmt/insert', {
			
			i_user,
			i_board,
			ctnt
			
		}).then(function(res) {
						
			if(res.data == '1') { // 댓글 등록 완료
				location.reload();
				frm.ctnt.value = '';
			
			} else if(res.data == '2') {
				alert("댓글을 입력해 주세요");
				frm.ctnt.value.focus()
				return false;
				
			} else if(res.data == '3') {
				alert('로그인을 해주세요')
				location.href="/user/login";
				return false;
			}
		})
	}	
	
	// 댓글 삭제
	function delCmt(i_cmt) {
				
		axios.post('/cmt/delete', {
			
			i_cmt
			
		}).then(function(res) {
						
			if(res.data == '1') { // 댓글 삭제 완료
				location.reload();
				
			} else if(res.data == '2') {
				alert("잘못된 접근방식 입니다");
				location.href="/user/login";
				return false;
				
			} 
		})
	}
	
	
</script>
</body>
</html>