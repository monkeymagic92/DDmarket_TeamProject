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
<link rel="stylesheet" href="/res/css/transModal.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
                            	<c:if test="${data.profile_img == null }">
                        		<a href="/user/myPage?i_user=${data.i_user}&i_tap=1"><img src="/res/img/yerin.jpg" onchange="setThumbnail(e)" alt="" class="img"></a>
	                        	</c:if>
	                        	<c:if test="${data.profile_img != null }">
	                                <a href="/user/myPage?i_user=${data.i_user}"><img src="/res/img/profile_img/user/${data.i_user}/${data.profile_img}" class="img"></a>                    	
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
                        		<button type="button" onclick="ToLike()">찜
                        		<c:if test="${data.is_tolike == 1}">
                        			<span id="heart" class="iconify icon-btn-heart heart" data-inline="false" data-icon="clarity:heart-solid" style=" font-size: 20px;"></span>
                        		</c:if>
                        		<c:if test="${data.is_tolike == 0}">
	                 	           	<span id="heart" class="iconify icon-btn-heart unheart" data-inline="false" data-icon="clarity:heart-solid" style=" font-size: 20px;"></span>
               					</c:if>찜 
                           		</button>
                           		
                           		
                           		
                           		<!-- 거래요청 -->
                          		<form id="transFrm" action="/trans/transRequest" method="post">
                           			<input type="hidden" name="i_user" value="${loginUser.i_user }">
                           			<input type="hidden" name="i_board" value="${data.i_board }">
                           			<input type="hidden" name="chk" value="0">
                           			<c:if test="${loginUser != null}">
	                      				<button type="submit" name="chkSubmit" id="chkSubmit" onclick="chkValue()">${transBtn}</button>
                      				</c:if>
                           		</form>
                           		
                         		
                          	                           		
                        	</c:if>				
                        </div>
                    </div>
            </section>
             
            <button class="review" onclick="transBtn()">거래신청 목록보기
		    </button>
		    <div class="myModal modal">
		        <div class="modal-content">
		            <div class="modal-body">
		                <table>		                
		               		<c:forEach items="${selTrans}" var="item">		               			
				               	<tr class="itemRow">
				                	<td onclick="moveToTransChat(${item.i_trans})">${item.i_trans}</td>
				                	<td onclick="moveToDetail(${item.i_user})">
				                		<c:if test="${item.profile_img == null }">
				                			<img src="/res/img/yerin.jpg" onchange="setThumbnail(e)" alt="" class="img">
				                		</c:if>
				                		<c:if test="${item.profile_img != null}">
				                			<img src="/res/img/profile_img/user/${item.i_user}/${item.profile_img}" class="img">
				                		</c:if>
				                	</td>
				                	<td onclick="moveToDetail(${item.i_user})">${item.nick}</td>
				                	<td onclick="moveToDetail(${item.i_user})">${item.grade} grade현재안나옴</td>
				                </tr>
				                <tr>
				                	<td></td>
				                	<td></td>
				                	<td><button>대화하기</button></td>				                	
				                	<td><button>거래완료</button></td>
				                </tr>
		                	</c:forEach>
		                </table>
		            </div>
		            <div class="modal-footer">
		                <button class="close" onclick="closeBtn()">취소</button>
		            </div>
		        </div>
		    </div>
		    
		    
		    
            <h2 class="h2-section-title">상품정보</h2>
            <section id="section-desc">
                <p>${data.ctnt }</p>
            </section>
            <h2 class="h2-section-title">상품문의 (${cmtCount })</h2>
            <section id="section-comment">
            

                        
            	<!-- 댓글 등록 -->
            	
                <form id="frm" action="/cmt/cmtReg" method="post">
                	<br>
                    <div id="inputWrap">
                    	<textarea name="ctnt" placeholder="상품문의를 입력 해 주세요"></textarea>
                    	<input type="hidden" name="i_cmt" value="0">
                    	<input type="hidden" name="scr" value="0">  <%-- 시크릿Cmt 값이 1이 되면 비밀댓글로 정하기 --%>
                    	<input type="hidden" name="i_board" value="${data.i_board}"> <!-- 이값은 아작스할떄는 필요 없는거같음 학원가서 보고 지우든가 쓰던가 하기 -->
                    </div>
                    	<input type="button" id="cmtSubmit" onclick="cmtReg()" value="등록">
                    	<button type="button" onclick="clkCmtCancel()">취소</button>
                    	
	            </form>
	            
                <c:forEach items="${cmtList}" var="item">
	               	<div id="commentWrap" class="cmtList">
	                   <div class="comment-profile-img"><img src="/res/img/profile_img/user/${item.i_user }/${item.profile_img}" class="img"></div>
	                   <div class="comment-profile-desc">
	                       <div class="nick">${item.nick}<span class="date">111</span></div>
	                       <div class="comment">${item.ctnt}</div>
	                       <div class="etc">
	                           <c:if test="${loginUser.i_user == item.i_user }">
	                           
								   				<%-- 수정 --%>	                           
	                           	   <div><a onclick="updCmt('${item.ctnt}', ${item.i_cmt})"><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>수정하기</span></a></div>
	                           	   
	                           	   
	                           	   <div><a onclick="delCmt(${item.i_cmt})"><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></a></div>
	                           	   
	                           </c:if> 
	                       </div>
	                   </div>
	               </div>
    			</c:forEach>
    			
			<div class="pageWrap">
                <c:if test="${cmtPageMaker.prev}">
                	<a href='<c:url value="/board/detail?i_board=${data.i_board}&cmtPage=${cmtPageMaker.startPage-1}"/>'><span class="iconify icon-page-left" data-inline="false" data-icon="mdi-light:chevron-double-left" style="color: #3b73c8; font-size: 47px;"></span></a>
                </c:if>
				<c:forEach begin="${cmtPageMaker.startPage}" end="${cmtPageMaker.endPage}" var="pageNum">
			        <c:choose>
			        <c:when test="${cmtPage == pageNum}">
			        	<a style="color: red;" href='<c:url value="/board/detail?i_board=${data.i_board}&cmtPage=${pageNum}"/>'>${pageNum}</a>
			        </c:when>
			        <c:otherwise>
			        	<a href='<c:url value="/board/detail?i_board=${data.i_board}&cmtPage=${pageNum}"/>'>${pageNum}</a>		        
			        </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:if test="${cmtPageMaker.next && cmtPageMaker.endPage > 0}">
           			<a href='<c:url value="/board/detail?i_board=${data.i_board}&cmtPage=${cmtPageMaker.endPage+1}"/>'><span class="iconify icon-page-right" data-inline="false" data-icon="mdi-light:chevron-double-right" style="color: #3b73c8; font-size: 47px;"></span></a>
           		</c:if>
            </div>
            </section>
            
            
            <h2 class="h2-section-title">판매자 후기</h2>
            <section id="section-review">
                <div id="div-review-left">
                    <div class="review-profile-img"><img src="/res/img/yerin.jpg"></div>

                    <div class="review-profile-nick">${data.nick}</div>

                    <div class="star-ratings-css">
                        <div class="star-ratings-css-top" style="width:85%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                        <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                    </div>
                    <div class="review-profile-reviewNum">15명의 후기</div>
                </div>
                <div id="div-review-right">
                    <div id="reviewWrap">
	                <c:forEach items="${reviewList}" var="item" begin="0" >
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                            	<span>${item.nick}</span>
                            	<span class="rating">${item.rating}</span></div>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-top_1" style="width:75%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">${item.ctnt}</div>
                        </c:forEach>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/res/js/detail.js"></script>
<script>

	if(${transErr != null}) {
		alert('${transErr}')
		
	}
	
	// 클릭했을시 1:1 채팅 가능하게끔
	function moveToTransChat(i_trans) {
		location.href="/test/test?i_trans="+i_trans
	}
		
	function moveToDetail(i_user) {
		location.href="/user/myPage?i_user="+i_user
	}
	
	
	function chkValue() {
		transFrm.chk.value = 1
		location.reload()
	}
	
	/*
	function chkUpd() {
		
		const i_user = transFrm.i_user.value
		const i_board = transFrm.i_board.value
		const chk = transFrm.chk.value
		
		
		console.log('i_user : ' + i_user)
		console.log('i_board : ' + i_board)
		console.log('chk : ' + chk)
		
		ajaxTrans(i_user, i_board, chk)
	}	
	
	
	function ajaxTrans(i_user, i_board, chk) {
		axios.post('/trans/transRequest',{
			i_user,
			i_board,
			chk
			
		}).then(function(res) {
			if(res.data == '1') {
				console.log('리설트 1')
				transFrm.chkSubmit.value = '구매요청'
				
			} else if(res.data == '2') {
				console.log('리설트 2')
				transFrm.chkSubmit.value = '구매취소'
			}
				
		})
	}
	*/
	
	// 업데이트 메소드 만들기 (아작스로)
	function updCmt(ctnt, i_cmt) {
		frm.ctnt.value = ctnt
		frm.i_cmt.value = i_cmt
		cmtSubmit.value = '수정'
		console.log(i_cmt)
	}
	
	
	function clkCmtCancel() {
		frm.i_cmt.value = 0
		frm.ctnt.value = ''  //홑따옴표

		cmtSubmit.value = '등록'
	}
	
	function ajaxPost(i_user, i_board, ctnt, i_cmt) {
		console.log('i_cmt : ' + i_cmt)
		console.log('ctnt : ' + ctnt)
		console.log('i_user : ' + i_user)
		console.log('i_board : ' + i_board)
		
		axios.post('/cmt/cmtReg',{
			i_user : i_user,
			i_board : i_board,
			i_cmt : i_cmt,
			ctnt : ctnt
			
		}).then(function(res) {
			if(res.data == '1') { // 댓글 등록 완료
				location.reload()
				frm.ctnt.value = ''
						
			} else if(res.data == '3') {
				alert('로그인을 해주세요')
				location.href="/user/login"
				return false;
			}
		})
	}
	
	//댓글 등록
	function cmtReg() {
		const i_user = `${loginUser.i_user}`;
		const i_board = `${data.i_board}`
		const ctnt = frm.ctnt.value
		const i_cmt = frm.i_cmt.value
		
		console.log('i_cmt : ' + i_cmt)
		console.log('ctnt : ' + ctnt)
		console.log('i_user : ' + i_user)
		console.log('i_board : ' + i_board)
		
		ajaxPost(i_user, i_board, ctnt, i_cmt)
	}	
	
	

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
	/*var rating_1 = 1.5/5*75;
	var starbar_1 = document.querySelector('.star-ratings-top_1')
		starbar_1.style.width = rating + "%";

	var rating_2 = 1.5/5*75;
	var starbar_2 = document.querySelector('.star-ratings-top_2')
		starbar_2.style.width = rating + "%";
	
	var rating_3 = 1.5/5*75;
	var starbar_3 = document.querySelector('.star-ratings-top_3')
		starbar_3.style.width = rating + "%";
	
	var rating_4 = 1.5/5*75;
	var starbar_4 = document.querySelector('.star-ratings-top_4')
		starbar_4.style.width = rating + "%";
	
	var rating_5 = 1.5/5*75;
	var starbar_5 = document.querySelector('.star-ratings-top_5')
		starbar_5.style.width = rating + "%";
	*/
	var grade = ${data.grade}/5*125;
	document.querySelector('.star-ratings-css-top').style.width = grade + "%"
	

	
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

		
	
	
	// 댓글 삭제
	function delCmt(i_cmt) {
		console.log('삭제값 : ' + i_cmt)				
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
	

    function transBtn() {
	var modal = document.querySelector(".myModal");
       modal.style.display = "block";
    }
    
    function closeBtn() {
    	var modal = document.querySelector(".myModal");
           modal.style.display = "none";
        }
</script>
</body>
</html>