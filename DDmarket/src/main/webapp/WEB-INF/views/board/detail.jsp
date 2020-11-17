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
                            	<c:if test="${data.profile_img == null}">
                        		<a href="/user/myPage?i_user=${data.i_user}&i_tap=1"><img src="/res/img/yerin.jpg" onchange="setThumbnail(e)" alt="" class="img"></a>
	                        	</c:if>
	                        	<c:if test="${data.profile_img != null}">
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
                       	<c:if test="${data.sold == 1}">
                       		<img src="/res/img/soldOut.jpg" class="soldImg">
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
                           		

								
                           		<%-- 구매요청 버튼 --%>
                           		<c:if test="${data.sold == 0}">                           		
	                          		<form id="transFrm" action="/trans/transRequest" method="post">
	                           			<input type="hidden" name="i_user" value="${loginUser.i_user }">
	                           			<input type="hidden" name="i_board" value="${data.i_board }">
	                           			<input type="hidden" name="saleI_user" value="${data.i_user}">
	                           			<input type="hidden" name="chk" value="0">
	                           			<c:if test="${loginUser != null}">
		                      				<button type="submit" name="chkSubmit" id="chkSubmit" onclick="chkValue()">${transBtn}</button>
	                      				</c:if>
	                           		</form>
                           		</c:if>
                           		<c:if test="${data.sold == 1}">
                           			<div></div>
                           		</c:if>                           		
                        	</c:if>				
                           
                        </div>
                    </div>
            </section>
             
             	
                      
             <%-- 버튼(구매요청 리스트) 눌렀을떄 나오는 부분 --%>      
             <%--   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡㅡ   ㅡ   ㅡ   ㅡ    --%>         
            <button id="chatting" onclick="chatBtn()">버튼</button>            
            <div id="ChatBox">
            
              <div id="SaleList">
                  <div id="close" onclick="CloBox()">
                                        닫기
                  </div>                                    
                  <div id="Buyers">
                     <c:forEach items="${selTrans}" var="item">
                        <div class="buyer" onclick="transChat(${item.i_trans}, ${item.saleI_user}, ${item.i_user})">  <%-- 구매유저 리스트에서 1:1 채팅 --%>
                            <input class="transValue" type="hidden" value="${item.i_trans}">
                            <div>${item.i_trans}</div>                            
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
                         <div>
                         	<c:if test="${data.i_user == loginUser.i_user}">
                         		<button type="button" onclick="transSuccess(${item.i_user}, ${data.i_board})">거래완료</button>
                         	</c:if> 
                         </div>
                     </c:forEach>                  
                  </div>
              </div>
              <div class="ChatList" id="chatView" >
                   <div id="chatClose" class="p1" onclick="CloChat()">
                            닫기
                   </div>
                    <div id="chat-Msg">
                         <div id="TransChatView" class="message">  
                            <%--   
                           <div class="message Mychat">
                               <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" alt="">
                               <div class="bubble">우측(내용적기)
                                  <div class="corner"></div>                                  
                                  <span>10초</span>
                              </div>
                         </div>
                         
                         
                          <div id="TransChatView" class="message">
                              <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/2_copy.jpg" alt="">
                              <div class="bubble">좌측(내용적기)
                                 <div class="corner"></div>
                                  <span>10초</span>
                            </div>
                         </div>
                             --%>                   
                      </div>
                  </div>
                       <%-- 채팅입력 --%>
                      <div id="sendMessage">
                         <input id="transCmtId" type="text" name="transCmt">
                         <button id="send" onclick="insTransChat()"></button>
                      </div>
            </div>    
          </div>    
          
          <%--   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡ   ㅡㅡ   ㅡ   ㅡ   ㅡ    --%>
          
              
                 
            <h2 class="h2-section-title">상품정보</h2>
            <section id="section-desc">
                <p>${data.ctnt }</p>
            </section>
            <h2 class="h2-section-title" id="h2-section-title"></h2>
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

	            <div id="cmtListBox"></div>
	            <div id="divSelMoreCtn"></div>
            
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
	                <c:forEach items="${reviewList}" var="item" begin="0" >
                    <div id="reviewWrap">
                        <div class="review-right-profile-img"><img src="/res/img/yerin.jpg"></div>
                        <div class="review-right-profile-desc">
                            <div class="nick">
                            	<span>${item.nick}</span>
                            	<span class="rating">${item.rating}</span></div>
                                <div class="star-ratings-css">
                                    <div class="star-ratings-top_1" style="width:${item.rating}"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                    <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                                </div>
                            </div>
                            <div class="comment">${item.ctnt}</div>
                         </div>
                       </c:forEach>
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

  if(${transSuccess != null}) {
		alert('${transSuccess}')
  }
  function transSuccess(i_user, i_board) {
	  location.href="/trans/transSuccess?i_user="+i_user+"&i_board="+i_board
  }
  
  if(${transErr != null}) {
     alert('${transErr}')      
  }
   
   // 구매리스트 창 열기
   function chatBtn() {
      ChatBox.style.display = 'flex'
   }
   // 구매리스트 창 닫기
   function CloBox() {
      ChatBox.style.display = 'none'
   }
   
   function chatRoomOut() {
      alert('본인의 방이 아니면 못들어 갑니다')
      return;
   }
   
   
   var param_i_trans = 0; // 클릭했을시 나타나는 i_trans 값 받아오기 위한용
   var param_saleI_user = 0; // 클릭했을시 나타나는 i_trans 값 받아오기 위한용
   var param_i_user = 0; // 클릭했을시 나타나는 i_trans 값 받아오기 위한용
   
   
   // 채팅창 닫기
   function CloChat() {
      TransChatView.innerHTML = ''
      chatView.style.display = 'none'
      SaleList.style.display = 'flex'
   }
   
   // 채팅창 열기 및 뿌리기
   function transChat(i_trans, saleI_user, i_user) {
      if(i_user != `${loginUser.i_user}` && saleI_user != `${loginUser.i_user}`) {
    	  alert('닳라달라')
    	  return false;
      }
	      
      var loginI_user = `${loginUser.i_user}`
      var dataI_user = `${data.i_user}`
      
      param_i_trans = i_trans   // 글쓰기할때도 사용됨 그래서 param으로 공용으로 사용
      param_saleI_user = saleI_user
      param_i_user = i_user
      
      chatView.style.display = 'flex'
      SaleList.style.display = 'none'
      
      console.log('transchat : ' + i_trans)
      
      
       axios.get('/trans/selTransCmt', {
             params: {
               i_trans : param_i_trans
             }
          
          }).then(function(res) {
             refreshSelChat(res.data)
          })   
   }
   
   function refreshSelChat(arr) {	   
      for (let i = 0; i<arr.length; i++) {
            makeChatList(arr[i])
         }
   }
   
   function makeChatList(arr) {
		  
      divMychat = document.createElement('div')
      
      if(`${loginUser.i_user == arr.buyI_user}`) { // 구매자
         
         divMychat.setAttribute('class', 'message')
         
         TransChatView.append(divMychat)
         
         var img = document.createElement('img')
         if(arr.buyProfile_img != null) {
               img.setAttribute('src',`/res/img/profile_img/user/\${arr.buyI_user}/\${arr.buyProfile_img}`)
          } else {
              img.setAttribute('src','/res/img/lion.jpg')           
          }      
         
         divMychat.append(img)
         
         var divBubble = document.createElement('div')
         divBubble.setAttribute('class', 'bubble')
         divBubble.append(arr.transCmt)
         divMychat.append(divBubble)
         
         var divCorner = document.createElement('div')
         divCorner.setAttribute('class', 'corner')
         divBubble.append(divCorner)
         
         var divNick = document.createElement('div')         
         divNick.append(arr.buyNick)
         divMychat.append(divNick)
         
         var span = document.createElement('span')
         span.append(arr.r_dt)
         divBubble.append(span)
         
         
      } else { // 판매자
         divMychat.setAttribute('class', 'mychat')
         
         TransChatView.append(divMychat)
         
         var img = document.createElement('img')
         if(arr.buyProfile_img != null) {
               img.setAttribute('src',`/res/img/profile_img/user/\${arr.saleI_user}/\${arr.profile_img}`)
          } else {
              img.setAttribute('src','/res/img/lion.jpg')           
          }      
         
         divMychat.append(img)
         
         var divBubble = document.createElement('div')
         divBubble.setAttribute('class', 'bubble')
         divBubble.append(arr.transCmt)
         divMychat.append(divBubble)
         
         var divCorner = document.createElement('div')
         divCorner.setAttribute('class', 'corner')
         divBubble.append(divCorner)
         
         var divNick = document.createElement('div')         
         divNick.append(arr.nick)
         divMychat.append(divNick)
         
         var span = document.createElement('span')
         span.append(arr.r_dt)
         divBubble.append(span)
         
      }
      
   }
               
   function insTransChat() {
       var transCmt = transCmtId.value
       
        axios.post('/trans/insTransCmt',{
         
         i_user : `${loginUser.i_user}`, 
         i_board : `${data.i_board}`,
         saleI_user : `${data.i_user}`,
         i_trans : param_i_trans,
         transCmt
           
        }).then(function(res) {
           transCmtId.value = ''
           TransChatView.innerHTML = ''
           transChat(param_i_trans, param_saleI_user, param_i_user) //★★★ 안되면 매개변수로 param_trans 넣어보기 ★★★
         
        })           
   }
   
  
  
   // 댓글 시작
   var cmtList = []
      
   var cmtCnt = 0;
   
   ajaxSelCount();
   
   

   // ajax로 댓글 수 뽑아오기
   	function ajaxSelCount() {
      axios.get('/cmt/selCount', {
          params: {
            i_board: `${data.i_board}`,
          }
       
       }).then(function(res) {   
			cmtCnt = res.data;
			var h2_section_title_cnt = document.querySelector('#h2-section-title');
			h2_section_title_cnt.innerText = '상품문의' +'(' + cmtCnt + ')';
       })
	}
		
	// 별점   
	var grade = ${data.grade}/5*125;
	document.querySelector('.star-ratings-css-top').style.width = grade + "%";
		
	// 댓글 뿌리기 (첨에 한번 실행 됨)
	function ajaxSelCmt() {
      console.log(`i_board : ${data.i_board}`)
      axios.get('/cmt/selCmt', {
         params: {
            i_board: `${data.i_board}`,
           	cmt_pageStart: 0,
           	cmt_perPageNum: 5
         }
      
      }).then(function(res) {   
         console.log(res)
         refreshMenu(res.data)
      })
   }
	
	
	var cmt_pageStart = 0;
	var limitCnt = 0;
	var limit = 0;
	
	function ajaxSelMore() {
      axios.get('/cmt/selCmt', {
          params: {
            i_board: `${data.i_board}`,
           	cmt_pageStart: cmt_pageStart + 5,
           	cmt_perPageNum: 5
          }
       
       }).then(function(res) {   
   		  cmt_pageStart += 5
   		  
   		  ajaxSelCount()
   		  
        refreshMenu(res.data)
        
 		  limit = Math.ceil(cmtCnt/5);
			
   		  if(limitCnt > limit-3) {
   		     var divSelMoreCtn = document.querySelector("#divSelMoreCtn")
  			 divSelMoreCtn.innerHTML = '';
   		  }
   		  
   		limitCnt++
        
       })
	}
	
   function refreshMenu(arr) {
      for (let i = 0; i<arr.length; i++) {
         makeCmtList(arr[i])
      }
      
      console.log('cmtCnt : ' + cmtCnt);
      
      /////////더보기 버튼
      if(cmtCnt > 5) { 
	      var divSelMoreCtn = document.querySelector("#divSelMoreCtn")
	      
	      divSelMoreCtn.innerHTML = '';
	      
	      var divSelMore =  document.createElement('div')
	      divSelMore.setAttribute('id', 'ajaxSelMore')
	      divSelMore.innerText = '더보기'
	   	  divSelMore.onclick = function() {
	    	  ajaxSelMore();
	      }
	      
	      divSelMoreCtn.append(divSelMore)
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
    	  //////// 수정창으로 올라가게 하기
    	 window.scrollTo({top:780, left:0, behavior:'smooth'});
         updCmt(arr.ctnt, arr.i_cmt);
      }
      
      if(arr.i_user == `${loginUser.i_user}`) {
    	  console.log('내가 댓글 쓴 갯수');
      var updBtnSpan = document.createElement('span')
      updBtnSpan.setAttribute('class', 'updBtnSpan')
      
      var updBtnSpanText = document.createElement('span')
      updBtnSpanText.innerText = '수정하기'
      
      var updBtnSpanIconfy = document.createElement('span')
      updBtnSpanIconfy.setAttribute('class', 'iconify')
      updBtnSpanIconfy.setAttribute('data-inline', 'false')
      updBtnSpanIconfy.setAttribute('data-icon', 'si-glyph:arrow-change')
      updBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 12px')
            
      updBtnSpan.append(updBtnSpanIconfy)
      updBtnSpan.append(updBtnSpanText)
      updBtn.append(updBtnSpan)
      
      divEtc.append(updBtn)
      
      var delBtn = document.createElement('a')
      
      delBtn.onclick = function(){
    	 var chkDelCmt = confirm('삭제하시겠습니까?');
    	 if(chkDelCmt) {
         delCmt(arr.i_cmt);    		 
    	 } else {
 			return false;   		 
    	 }
      }
      
      var delBtnSpan = document.createElement('span')
      delBtnSpan.setAttribute('class', 'delBtnSpan')
      
      var delBtnSpanText = document.createElement('span')
      delBtnSpanText.innerText = '삭제하기'
      
      var delBtnSpanIconfy = document.createElement('span')
      delBtnSpanIconfy.setAttribute('class', 'iconify icon-del')
      delBtnSpanIconfy.setAttribute('data-inline', 'false')
      delBtnSpanIconfy.setAttribute('data-icon', 'ant-design:delete-outlined')
      delBtnSpanIconfy.setAttribute('style', 'color: #a5a2a2, font-size: 16px')
      
      delBtnSpan.append(delBtnSpanIconfy)
  	  delBtnSpan.append(delBtnSpanText)
      delBtn.append(delBtnSpan)
      divEtc.append(delBtn)
      
      divCommentProfileDesc.append(divEtc)
      }
      
      divCommentWrap.append(divCommentProfileDesc)
      
      var cmtListBox = document.querySelector('#cmtListBox')
      cmtListBox.append(divCommentWrap)
     
      
   }
   
   // 댓글 뿌리기
	ajaxSelCmt();
   
   // 업데이트 메소드 만들기 (아작스로)
   function updCmt(ctnt, i_cmt) {
      frm.ctnt.value = ctnt
      frm.i_cmt.value = i_cmt
      cmtSubmit.value = '수정'
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
            cmtSubmit.value = '등록'
            frm.ctnt.value = ''
            cmtListBox.innerHTML = ''
            ajaxSelCount()
            ajaxSelCmt()
            cmt_pageStart = 0;
            limitCnt = 0;
                  
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
        	 cmtListBox.innerHTML = '';
        	 ajaxSelCount();
        	 console.log('delcnt : ' + cmtCnt);
             if(cmtCnt < 7) {
           	  divSelMoreCtn.innerHTML = '';
             }
             cmt_pageStart = 0;
             limitCnt = 0;
        	 ajaxSelCmt();
         } else if(res.data == '2') {
            alert("잘못된 접근방식 입니다");
            location.href="/user/login";
            return false;
         } 
      })
   }

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
		
</script>
</body>
</html>