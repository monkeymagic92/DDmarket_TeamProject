<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/myPage.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
	<div id="container">
        <main>
            <section id="section-top">
                <div id="div-top-left">
                    <div id="profile_img"><img src="/res/img/profile_img/${loginUser.i_user}/${loginUser.profile_img}"></div>
                    <span class="profile_nick">${loginUser.nick}</span>
                    <div class="star-ratings-css">
                        <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                        <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                    </div>
                    <span id="profile_star_num">5.0</span>
                    <button id="profile_btn_change" onclick="moveToInfo()">회원정보변경</button>
                </div>
                <div id="div-top-right">
                    <span class="profile_nick">${loginUser.nick}</span>
                    <div id="profile_info">
                        <div class="profile_info_detail">
                            <span class="iconify" data-inline="false" data-icon="mdi-light:home" style="color: #3b73c8; font-size: 20px;"></span>
                            <span class="profile_info_text">상점 오픈</span>
                            <span class="profile_info_num">${loginUser.r_dt}</span>
                        </div>
                        <div class="profile_info_detail">
                            <span class="iconify" data-inline="false" data-icon="mdi:human-greeting" style="color: #3b73c8; font-size: 20px;"></span>
                            <span class="profile_info_text">상점 방문수</span>
                            <span class="profile_info_num"></span>
                        </div>
                        <div class="profile_info_detail">
                            <span class="iconify" data-inline="false" data-icon="ant-design:shopping-cart-outlined" style="color: #3b73c8; font-size: 18px;"></span>
                            <span class="profile_info_text">상품판매</span>
                            <span class="profile_info_num">1회</span>
                        </div>
                    </div>
                </div>
            </section>
            <section id="section-bottom">
                <div class="tap_basic">
                    <div class="tab_list_wrap">
                        <div class="tab_list tab_active" data-tabnum="0">
                            <a href="#">판매목록</a>
                        </div>
                        <div class="tab_list" data-tabnum="1">
                            <a href="#">구매목록</a>
                        </div>
                        <div class="tab_list" data-tabnum="2">
                            <a href="#">거래후기</a>
                        </div>
                        <div class="tab_list" data-tabnum="3">
                            <a href="#">MY댓글</a>
                        </div>
                        <div class="tab_list" data-tabnum="4">
                            <a href="#">MY후기</a>
                        </div>
                    </div>
                    <div class="tab_container">
                        <div class="tab_content" id="div-wrap-sellList">
                            <article class="card-wrap">
                                <a href="#">
                                    <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                    <div class="card-desc">
                                        <h2 class="card-title">돼지국밥 세트</h2>
                                        <span class="card-border"></span>
                                        <span class="card-price">10,000원</span>
                                        <span class="card-r_dt">3시간전</span>
                                    </div>
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
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
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
                                </a>
                            </article>
                            <article class="card-wrap card-wrap-soldOut">
                                <a href="#">
                                    <div class="card-soldOut">판매완료</div>  <!-- 조건문 사용해서 판매완료시 띄우기-->
                                    <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                    <div class="card-desc">
                                        <h2 class="card-title">돼지국밥 세트</h2>
                                        <span class="card-border"></span>
                                        <span class="card-price">10,000원</span>
                                        <span class="card-r_dt">3시간전</span>
                                    </div>
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
                                </a>
                            </article>
                            <article class="card-wrap card-wrap-soldOut">
                                <a href="#">
                                    <div class="card-soldOut">판매완료</div>  <!-- 조건문 사용해서 판매완료시 띄우기-->
                                    <div class="card-pic"><img src="../img/gookpap.jpg"></div>
                                    <div class="card-desc">
                                        <h2 class="card-title">돼지국밥 세트</h2>
                                        <span class="card-border"></span>
                                        <span class="card-price">10,000원</span>
                                        <span class="card-r_dt">3시간전</span>
                                    </div>
                                    <div class="card-addr"><span class="iconify icon-map" data-inline="false" data-icon="mdi-light:map-marker" style="color: #f84c4c; font-size: 21px;"></span>대구광역시 동구 신사동</div>
                                </a>
                            </article>
                        </div>
                        <div class="tab_content" id="div-wrap-buyList">
                            <article class="div-wrap-buyList-article">
                                <div class="card-image"><img src="../img/gookpap.jpg"></div>
                                <div class="card-right">
                                    <div class="card-title">정품 카카오 오리지날 국밥</div>
                                    <div class="card-price">20,000 원</div>
                                    <div class="card-addr"><span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span><span>대구광역시 동구 신서동</span></div>
                                    <div class="card-date"><span class="card-date-text">구매 날짜</span><span class="card-date-num">2020.10.13</span></div>
                                    <button class="review" onclick="reviewbtn()">후기쓰기</button>
                                </div>
                                
                             	<div id="ModalWrap" class="myModal modal">
								       <div class="modal-header">
								          <span class="material-icons" onclick="Cbtn()">clear</span>
								          <h2 class="title">라이언 덕후 상점과의 거래는 어떠셨나요?</h2>
								       </div>
								       <form id="frm" action="/review/ReviewCmt" method="post">
									       <div class="starPoint">
									       	<div class="startRadio"></div>
									       </div>
								       		<div class="modal-content">
								       		<input type="hidden" name="i_user" value="${loginUser.i_user}">
								       		<input type="hidden" name="i_board" value="1">
								       		<input type="hidden" name="rating" value="0">
											<div class="modal-body">
												<textarea name="ctnt" id="" class="reviewTxt" cols="50" rows="10" placeholder="후기댓글을 남겨주세요" ></textarea>
											</div>
											<div class="modal-footer">
												<button type="submit" class="close" onclick="closebtn()">등록</button>
											</div>
									   </form>
						        </div>
								</div>
                            </article>
                            <article class="div-wrap-buyList-article">
                                <div class="card-image"><img src="../img/yerin.jpg"></div>
                                <div class="card-right">
                                    <div class="card-title">정품 카카오 오리지날 국밥</div>
                                    <div class="card-price">20,000 원</div>
                                    <div class="card-addr"><span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span><span>대구광역시 동구 신서동</span></div>
                                    <div class="card-date"><span class="card-date-text">구매 날짜</span><span class="card-date-num">2020.10.13</span></div>
                                    <button>후기쓰기</button>
                                </div>
                            </article>
                            <article class="div-wrap-buyList-article div-wrap-buyList-article-soldOut">
                                <div class="card-image"><img src="../img/footer_logo.jpg"></div>
                                <div class="card-right">
                                    <div class="card-title">정품 카카오 오리지날 국밥</div>
                                    <div class="card-price">20,000 원</div>
                                    <div class="card-addr"><span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span><span>대구광역시 동구 신서동</span></div>
                                    <div class="card-date"><span class="card-date-text">구매 날짜</span><span class="card-date-num">2020.10.13</span></div>
                                    <button>후기쓰기</button>
                                </div>
                            </article>
                            <article class="div-wrap-buyList-article div-wrap-buyList-article-soldOut">
                                <div class="card-image"><img src="../img/gookpap.jpg"></div>
                                <div class="card-right">
                                    <div class="card-title">정품 카카오 오리지날 국밥</div>
                                    <div class="card-price">20,000 원</div>
                                    <div class="card-addr"><span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span><span>대구광역시 동구 신서동</span></div>
                                    <div class="card-date"><span class="card-date-text">구매 날짜</span><span class="card-date-num">2020.10.13</span></div>
                                    <button>후기쓰기</button>
                                </div>
                            </article>
                        </div>
                        <div class="tab_content" id="div-wrap-reviewList">
                                <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">
                                            <span>yerin_back</span>
                                            <div class="star-ratings-css">
                                                <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                                <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                            </div>
                                            <span class="date">2020-10-16 03:35</span>
                                        </div>
                                        <div class="comment">쿨거래 감사합니다</div>
                                    </div>
                                </div>
                                <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">
                                            <span>yerin_back</span>
                                            <div class="star-ratings-css">
                                                <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                                <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                            </div>
                                            <span class="date">2020-10-16 03:35</span>
                                        </div>
                                        <div class="comment">쿨거래 감사합니다</div>
                                    </div>
                                </div>
                                <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">
                                            <span>yerin_back</span>
                                            <div class="star-ratings-css">
                                                <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                                <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                            </div>
                                            <span class="date">2020-10-16 03:35</span>
                                        </div>
                                        <div class="comment">쿨거래 감사합니다</div>
                                    </div>
                                </div>
                        </div>
                        <div class="tab_content" id="div-wrap-myCmtList">
                            <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">yerin_back<span class="date">2020-10-16 03:35</span></div>
                                        <div class="comment">댓글댓글댓글댓글댓댓글댓글댓글댓글댓댓글댓글댓글글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</div>
                                    </div>
                            </div>                              
                            <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">yerin_back<span class="date">2020-10-16 03:35</span></div>
                                        <div class="comment">댓글댓글댓글댓글댓댓글댓글댓글댓글댓댓글댓글댓글글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</div>
                                    </div>
                            </div>                              
                            <div id="reviewWrap">
                                    <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                    <div class="review-right-profile-desc">
                                        <div class="nick">yerin_back<span class="date">2020-10-16 03:35</span></div>
                                        <div class="comment">댓글댓글댓글댓글댓댓글댓글댓글댓글댓댓글댓글댓글글댓글댓글댓글댓글댓글댓글댓글댓글댓글댓글</div>
                                	</div>
                            </div>                              
                        </div>
                        <div class="tab_content" id="div-wrap-myReviewList">
                            <div id="reviewWrap">
                                <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                <div class="review-right-profile-desc">
                                    <div class="nick">
                                        <span>yerin_back</span>
                                        <div class="star-ratings-css">
                                            <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                            <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                        </div>
                                        <span class="date">2020-10-16 03:35</span>
                                    </div>
                                    <div class="comment">쿨거래 감사합니다</div>
                                    <div class="control">
                                        <a href="#"><div class="mod"><span class="iconify" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</div></a>
                                        <a href="#"><div class="del"><span class="iconify" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 13px;"></span>삭제하기</div></div></a>
                               </div>
                            </div>
                            <div id="reviewWrap">
                                <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                <div class="review-right-profile-desc">
                                    <div class="nick">yerin_back<span class="rating">(별점)</span><span class="date">2020-10-16 03:35</span></div>
                                    <div class="comment">쿨거래 감사합니다</div>
                                    <div class="control">
                                        <a href="#"><div class="mod"><span class="iconify" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</div></a>
                                        <a href="#"><div class="del"><span class="iconify" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 13px;"></span>삭제하기</div></div></a>
                               </div>
                            </div>
                            <div id="reviewWrap">
                                <div class="review-right-profile-img"><img src="../img/yerin.jpg"></div>
                                <div class="review-right-profile-desc">
                                    <div class="nick">yerin_back<span class="rating">(별점)</span><span class="date">2020-10-16 03:35</span></div>
                                    <div class="comment">쿨거래 감사합니다</div>
                                    <div class="control">
                                        <a href="#"><div class="mod"><span class="iconify" data-inline="false" data-icon="si-glyph:arrow-change" style="color: #a5a2a2; font-size: 12px;"></span>수정하기</div></a>
                                        <a href="#"><div class="del"><span class="iconify" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 13px;"></span>삭제하기</div></div></a>
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
<script src="/res/js/myPage.js"></script>
<script>
	var starlist = ['0.5', '1', '1.5', '2',
        '2.5', '3', '3.5', '4',
        '4.5', '5']


	
	function radiobox(){
            
          var starRadio = document.querySelector('.startRadio')
          for (let i = 0; i < starlist.length; i++) {                
              var label = document.createElement('label')
              label.setAttribute('class', 'startRadio__box')
              var input = document.createElement('input')
              input.setAttribute('name', 'star')
              input.setAttribute('type', 'radio')
              input.addEventListener('click', function(){
                  var num = starlist[i]
                  if(input.value == 'checked'){
                      num++
                      frm.rating.value = num
                  }
                  console.log(num);
              })                  
              var span = document.createElement('span')
              span.setAttribute('class', 'startRadio__img')
              var spanBlind = document.createElement('span')
              spanBlind.setAttribute('class', 'blind')
              spanBlind.innerText = '별'+starlist[i]+'개'
              label.append(input)
              label.append(span)
              span.append(spanBlind)
              starRadio.append(label)
            }
            
        }
	radiobox()
	
	function Cbtn(){
		var modalwrap = document.querySelector('#ModalWrap')
		modal.style.display = "none";
	
	}
	var modal = document.querySelector(".myModal");
	
	function reviewbtn() {
		modal.style.display = "block";
	}
	
	function closebtn() {
		var txt = document.querySelector('textarea').value
		if(txt.length == '' || txt.length == 0){
		alert('후기를 작성해 주세요.')
		return false
	}
	
	if(txt.length != '' || txt.length != 0){
		modal.style.display = "none";
		}
	}
</script>
</body>
</html>