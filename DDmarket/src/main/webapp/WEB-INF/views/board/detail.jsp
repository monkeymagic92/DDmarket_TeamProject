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






								<%-- 밑에 buyChatBtn() 만들었음 온클릭했을때 판매자와 구매자 채팅창 아작스로 띄우기 --%>
                                <br><br>
                           		<c:if test="${data.i_user != loginUser.i_user}">
                           			<c:if test="${buyList != null}">
                           				<button class="buyChat" onclick="buyChatBtn()">${buyList}</button>
                           			</c:if>
                           		</c:if>
                           		
                           		
                           		
                           		
                           		
                           		
                           		
                           		
                           		
                           		                           		
                           		
                           		<%-- 구매요청 버튼 --%>
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
             
            <%-- <button class="review" onclick="transBtn()">거래신청 목록보기</button>--%>
            <button id="chatting" onclick="chatBtn()">버튼</button>
            <div id="ChatBox">
		        <div id="SaleList">
		            <div id="close" onclick="CloBox()">
		                                  닫기
		            </div>
		            
		            
		            <div id="Buyers">
		            	<c:forEach items="${selTrans}" var="item">
			                <div class="buyer" onclick="moveChat()">
			                    <c:if test="${item.profile_img == null }">
		                			<img src="/res/img/lion.jpg" onchange="setThumbnail(e)" alt="" class="img">
		                		</c:if>
		                		<c:if test="${item.profile_img != null}">
		                			<img src="/res/img/profile_img/user/${item.i_user}/${item.profile_img}" class="img">
		                		</c:if>
			                    <p>
			                        <strong>${item.nick}</strong>
			                        <span>${item.grade}</span>
			                    </p>
			                </div>
			            </c:forEach>		               
		            </div>
		        </div>
		        
		        <%-- '판매자'가 구매요청 유저 리스트에서 1:1 대화창 --%>
		        <div id="chatView" draggable="true" ondrag="moveCtnt()">
		            <div id="chatClose" class="p1" onclick="CloChat()">
		              	  닫기
		            </div>
		            <div id="chat-Msg">
		            
		            	<%-- 판매자 --%>
		            
		                <div class="message">
		                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/1_copy.jpg" alt="">
		                    <div class="bubble">안녕하세요
		                        <div class="corner"></div>
		                        <span>1분</span>
		                    </div>
		                </div>
		                
		                
		                <%-- 구매자 --%>
		                
		                <div class="message Mychat">
		                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" alt="">
		                    <div class="bubble">안녕하세요
		                        <div class="corner"></div>
		                        <span>10초</span>
		                    </div>
		                </div>
		            </div>
		            
		            
		            <%-- 아작스로 댓글 등록하기 --%>
		            <div id="sendMessage">
		                <input  type="text" name="transCmt">
		                <button id="send"></button>
		            </div>
		        </div>
		    </div>
		    
		    
		    
		    
		    
		    
		    
		    
		    <%-- '구매자'만 보이는 채팅창(판매자 1:1) --%>
		    <div class="buyChatList" id="buyChatView" draggable="true" ondrag="moveCtnt()">
	            <div id="chatClose" class="p1" onclick="CloBuyChat()">
	              	  닫기
	            </div>
	            <div id="chat-Msg">
	            
	            	<c:if test="${loginUser != null}">
		                <div id="TransChatView" class="message Mychat">
		                   
		                </div>             
	                </c:if>
	                <c:if test="${loginUser == null}">
	                	<div id="TransChatView" class="message Mychat">
		                   
		                </div>
	                </c:if>	              
	            </div>
	                        
	            
	            <%-- 아작스로 댓글 등록하기 --%>
	            <div id="sendMessage">
	                <input id="transCmtId" type="text" name="transCmt">
	                <button id="send" onclick="transCmt()"></button>
	            </div>
	        </div>
		    
		    
		    
		    
		    
		    <%-- -	-	-	-	-	-	-	-	-	-	-	-	-	-	-	-	 --%>
		    
		    
		    
		    
		    
		    
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
	            
	           
	            <div id="cmtListBox">
	            	
	            </div>
	             
	            
	            
	            <%--
                <c:forEach items="${cmtList}" var="item">
	               	<div id="commentWrap" class="cmtList">
	                   <div class="comment-profile-img">
	                       <img src="/res/img/profile_img/user/${item.i_user }/${item.profile_img}" class="img">
	                   </div>
	                   
	                   <div class="comment-profile-desc">
	                       <div class="nick">${item.nick}
	                       <span class="date">${item.r_dt}</span>
	                       </div>
	                       <div class="comment">${item.ctnt}</div>
	                       
	                       <div class="etc">
	                           <c:if test="${loginUser.i_user == item.i_user }">
								   					                           
	                           	   <a onclick="updCmt('${item.ctnt}', ${item.i_cmt})"><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>수정하기</span></a>
	                           	   
	                           	   
	                           	   <a onclick="delCmt(${item.i_cmt})"><span><span class="iconify icon-del" data-inline="false" data-icon="ant-design:delete-outlined" style="color: #A5A2A2; font-size: 12px;"></span>삭제하기</span></a>
	                           	   
	                           </c:if> 
	                       </div>
	                   </div>
	               </div>
    			</c:forEach>
    			 --%>
    			
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
        </main>
    </div>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/res/js/detail.js"></script>
<script>
	
	
	//-	-	- 재용	-	-	-	-	-
	
	// 1:1문의 창 띄웠을시 여기서 아작스로 select 해서 채팅창 띄우기
	function buyChatBtn(i_user, loginI_user, i_board) {
		$('.buyChatList').show();
		console.log(i_user)
		console.log(loginI_user)
		console.log(i_board)
	}
	
	
	function CloBuyChat() {
		buyChatView.style.display = 'none'
	}
	
	
	
	// '구매자 채팅입력'
	function transCmt() {
		var transCmt = transCmtId.value
		
		axios.post('/trans/insTransCmt', {
			
			i_board : `${data.i_board}`,
			i_user : `${loginUser.i_user}`,	
			saleI_user : `${data.i_user}`,
			transCmt
			
		}).then(function(res) {
			
			refreshBuyChat(res.data)
			
		})
	}
	
		
	// 구매자 1:1문의 채팅창 띄우기	-	-	-	-	-	-	-	-	-	-	-	-
	var saleProfile_img = `${data.profile_img}`
	
	function buyChatBtn() {
		axios.get('/trans/selTransCmt', {
			
			// saleProfile_img (판매자 사진) 못받을경우 대체이미지로 if문 써서 서버에 넘기거나 서버단에서 if문으로 get에 넣기 
			
			params: {
				saleI_user : `${data.i_user}`,
				i_user : `${loginUser.i_user}`,				
				i_board : `${data.i_board}`
			}
		
		}).then(function(res) {
			refreshBuyChat(res.data)
			$('.buyChatList').show();
		})
	}
	
	function refreshBuyChat(arr) {
		for (let i = 0; i < arr.length; i++) {
			makeTransBuyChat(arr)
		}
	}
	
	
	
	
	function makeTransBuyChat(arr) {
		
		var img = document.createElement('img')
		if(arr.profile_img != null || arr.profile_img != '') {
			img.setAttribute('src',`/res/img/profile_img/user/\${arr.transCmtChk}/\${arr.profile_img}`)
		} else {
			img.setAttribute('src','/res/img/lion.jpg')
		}
		TransChatView.append(img)
		
		var divBubble = document.createElement('div')
		divBubble.setAttribute('class', 'bubble')
		TransChatView.append(divBubble)
		
		var spanChatDate = document.createElement('span')
		spanChatDate.setAttribute('class', 'chatDate')
		spanChatDate.append(arr.r_dt)
		
		divBubble.append(spanChatDate)
		
	}
	//	-	-	-	- 1:1구매 부분	-	-	-	-	-
	
	//	-	-	- 재용	-	-	-	-	-
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
				// DMZ구역
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//	-	-	- 누나	-	-	-
	var cmtList = []
   function ajaxSelCmt() {
      console.log(`i_board : ${data.i_board}`)
      axios.get('/cmt/selCmt', {
         params: {
            i_board: `${data.i_board}`
         }
      
      }).then(function(res) {   
         console.log(res)
         refreshMenu(res.data)
      })
   }
   
   function refreshMenu(arr) {      
      for (let i = 0; i<arr.length; i++) {
         makeCmtList(arr[i])
      }   
   }
   
   
   
   function makeCmtList(arr) {
      
      var divCommentWrap = document.createElement('div')
      divCommentWrap.setAttribute('id', 'commentWrap')
   
      var divCommentProfileImg = document.createElement('div')
      divCommentProfileImg.setAttribute('class', 'comment-profile-img')
      
      var profileImg = document.createElement('img')
      profileImg.setAttribute('class', 'profileImg')
      if(arr.profile_img != null) {
         profileImg.setAttribute('src',`/res/img/profile_img/user/\${arr.i_user}/\${arr.profile_img}`)
      } else {
         profileImg.setAttribute('src','/res/img/lion.jpg')
      }
      divCommentProfileImg.append(profileImg)
      divCommentWrap.append(divCommentProfileImg)
      
      
      var divCommentProfileDesc = document.createElement('div')
      divCommentProfileDesc.setAttribute('class','comment-profile-desc')
      
      var divNick = document.createElement('div')
      divNick.setAttribute('class','nick')
      divNick.append(arr.nick)
      var spanDate = document.createElement('span')
      spanDate.setAttribute('class', 'date')
      spanDate.append(arr.r_dt)
      divNick.append(spanDate)
      
      divCommentProfileDesc.append(divNick)
      
      var divComment = document.createElement('div')
      divComment.setAttribute('class', 'comment')
      divComment.append(arr.ctnt)
      
      divCommentProfileDesc.append(divComment)
      
      var divEtc = document.createElement('div')
      divEtc.setAttribute('class', 'etc')
      
      var updBtn = document.createElement('a')
      updBtn.onclick = function(){
         updCmt(arr.ctnt, arr.i_cmt);
      }
      
      var updBtnSpan = document.createElement('span')
      updBtnSpan.setAttribute('class', 'updBtnSpan')
      
      var updBtnSpanIconfy = document.createElement('span')
      updBtnSpanIconfy.setAttribute('class', 'iconify')
      updBtnSpanIconfy.setAttribute('data-inline', 'false')
      updBtnSpanIconfy.setAttribute('data-icon', 'si-glyph:arrow-change')
      updBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 12px')
            
      updBtnSpan.innerHTML = '수정하기'
      updBtnSpan.append(updBtnSpanIconfy)
      updBtn.append(updBtnSpan)
      
      divEtc.append(updBtn)
      
      var delBtn = document.createElement('a')
      delBtn.onclick = function(){
         delCmt(arr.i_cmt);
      }
      var delBtnSpan = document.createElement('span')
      delBtnSpan.setAttribute('class', 'delBtnSpan')
      
      var delBtnSpanIconfy = document.createElement('span')
      delBtnSpanIconfy.setAttribute('class', 'iconify icon-del')
      delBtnSpanIconfy.setAttribute('data-inline', 'false')
      delBtnSpanIconfy.setAttribute('data-icon', 'ant-design:delete-outlined')
      delBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 16px')
      
      delBtnSpan.innerHTML = '삭제하기'
      delBtnSpan.append(delBtnSpanIconfy)
      delBtn.append(delBtnSpan)
      divEtc.append(delBtn)
      
      divCommentProfileDesc.append(divEtc)
      divCommentWrap.append(divCommentProfileDesc)
      
      var cmtListBox = document.querySelector('#cmtListBox')
      cmtListBox.append(divCommentWrap)
   }
   
   
   ajaxSelCmt()
   // 업데이트 메소드 만들기 (아작스로)
   function updCmt(ctnt, i_cmt) {
      frm.ctnt.value = ctnt
      frm.i_cmt.value = i_cmt
      cmtSubmit.value = '수정'
      //console.log(i_cmt)
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
            frm.ctnt.value = ''
            cmtListBox.innerHTML = ''
            ajaxSelCmt()
                  
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
      
      //console.log('i_cmt : ' + i_cmt)
      //console.log('ctnt : ' + ctnt)
      //console.log('i_user : ' + i_user)
      //console.log('i_board : ' + i_board)
      
      ajaxPost(i_user, i_board, ctnt, i_cmt)
      
   }   
   
   // 댓글 삭제
   function delCmt(i_cmt) {
      console.log('삭제값 : ' + i_cmt)            
      axios.post('/cmt/delete', {
         i_cmt : i_cmt,
         
      }).then(function(res) {
                  
         if(res.data == '1') { // 댓글 삭제 완료
         } else if(res.data == '2') {
            alert("잘못된 접근방식 입니다");
            location.href="/user/login";
            return false;
            
         } 
      })
   }
   //	-	-	- 누나	-	-	-	-	-	-	-	-	-	-	-	
	
	
	
	
	
	
		
	function moveToDetail(i_user) {
		location.href="/user/myPage?i_user="+i_user
	}
	
		
	function chkValue() {
		transFrm.chk.value = 1
		location.reload()
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
		
	
	
    function transBtn() {
       var modal = document.querySelector(".myModal");
       modal.style.display = "block";
    }
    
    function closeBtn() {
        var modal = document.querySelector(".myModal");
        modal.style.display = "none";
     }    
    
    function chatBtn(){
        ChatBox.style.display = 'flex'   
    }
    function CloChat(){
        chatView.style.display = 'none'
    }
    function moveChat(){
        chatView.style.display = 'flex'
    }
    function CloBox(){
        ChatBox.style.display = 'none'
    }
    
    if(${transErr != null}) {
		alert('${transErr}')		
	}
	
	// 구매자 판매자 1:1문의 창 띄우기
	$('.buyChatList').hide();
	
	/*
	$('.buyChatBtn').click(function() {
		$('.buyChatList').show();
	})
	*/
</script>
</body>
</html>