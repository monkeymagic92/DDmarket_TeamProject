<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                    <div id="profile_img"><img src="/res/img/profile_img/user/${data.i_user }/${data.profile_img}" class="img"></div>
                    <span class="profile_nick">${data.nick}</span>

                    <div class="star-ratings-css">
                        <div class="star-ratings-css-top" style="width:120%"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                        <div class="star-ratings-css-bottom"><span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>
                    </div>
                    <span id="profile_star_num">${data.grade}</span>         
                    <button id="profile_btn_change" onclick="moveToInfo()">회원정보변경</button>
                </div>
                <div id="div-top-right">
                    <span class="profile_nick">${data.nick}</span>
                    <div id="profile_info">
                        <div class="profile_info_detail">
                            <span class="iconify" data-inline="false" data-icon="mdi-light:home" style="color: #3b73c8; font-size: 20px;"></span>
                            <span class="profile_info_text">상점 오픈</span>
                            <span class="profile_info_num">${data.r_dt}</span>
                        </div>
                        <div class="profile_info_detail">
                            <span class="iconify" data-inline="false" data-icon="ant-design:shopping-cart-outlined" style="color: #3b73c8; font-size: 18px;"></span>
                            <span class="profile_info_text">상품 판매</span>
                            <span class="profile_info_num">${sellCnt}회</span>
                        </div>
                    </div>
                </div>
            </section>
            
            <section id="section-bottom">
                <div id="tap_menu">
        			<c:forEach var="item" items="${tapList}" end="${loginUser.i_user == data.i_user ? '4' : '1'}">
                  <c:choose>
                    <c:when test="${i_tap == item.i_tap}">
                      <a style="color: red;" href="/user/myPage?i_tap=${item.i_tap}&i_user=${data.i_user}">${item.tap_nm}</a>
                    </c:when>
                    <c:otherwise>
                      <a href="/user/myPage?i_tap=${item.i_tap}&i_user=${data.i_user}">${item.tap_nm}</a>
                    </c:otherwise>
                </c:choose>
           		 </c:forEach>
                </div>
                
                <c:if test="${i_tap == 1}">
               	<div id="tap_sellList">
	                <c:forEach var="item" items="${sellList}">
	                    <article class="card-wrap">
	                        <a href="/board/detail?i_board=${item.i_board}">  
	                            <div class="card-pic">
	                               <c:choose>
	                                  <c:when test="${item.thumImage == null}">
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
                
	            <div id="tap_sellList_page">
	                <c:if test="${pageMaker.prev}">
	                	<a href='<c:url value="/user/myPage?page=${pageMaker.startPage-1}&i_tap=${i_tap}&i_user=${data.i_user}"/>'><span class="iconify icon-page-left" data-inline="false" data-icon="mdi-light:chevron-double-left" style="color: #3b73c8; font-size: 47px;"></span></a>
	                </c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
				        <c:choose>
				        <c:when test="${page == pageNum}">
				        	<a style="color: red;" href='<c:url value="/user/myPage?page=${pageNum}&i_tap=${i_tap}&i_user=${data.i_user}"/>'>${pageNum}</a>
				        </c:when>
				        <c:otherwise>		        
				        	<a href='<c:url value="/user/myPage?page=${pageNum}&i_tap=${i_tap}&i_user=${data.i_user}"/>'>${pageNum}</a>
				        </c:otherwise>
				        </c:choose>
				    </c:forEach>
				    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
	               		 <a href='<c:url value="/user/myPage?page=${pageMaker.endPage+1}&i_tap=${i_tap}&i_user=${data.i_user}"/>'><span class="iconify icon-page-right" data-inline="false" data-icon="mdi-light:chevron-double-right" style="color: #3b73c8; font-size: 47px;"></span></a>
	           		</c:if>
	            </div>
                </c:if>
                
                <c:if test="${i_tap == 2}">
                <div id="tap_review">
                	거래후기
                </div>
                </c:if>
                
                <c:if test="${i_tap == 3}">
                <div id="tap_myBuyList">
                	MY구매
                </div>
	            </c:if>
	            
	            <c:if test="${i_tap == 4}">
                <div id="tap_myCmt">
                	MY댓글
                </div>
                </c:if>
	            
	            <c:if test="${i_tap == 5}">
                <div id="tap_myReview">
                	MY후기
                </div>
                </c:if>
       
            </section>
            
            
            
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
		       		<input type="hidden" name="i_board" value="3">
		       		<input type="hidden" name="rating" value="0">
					<div class="modal-body">
						<textarea name="ctnt" id="" class="reviewTxt" cols="50" rows="10" placeholder="후기댓글을 남겨주세요" ></textarea>
					</div>
					<div class="modal-footer">
						<button type="submit" class="close" onclick="closebtn()">등록</button>
					</div>
			   </form>
        </div>

        </main>
    </div>
<script src="/res/js/myPage.js"></script>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
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
              frm.rating.value = num
              if(input.value == 'checked'){
                  num++
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
	
	
	
	////사용자 별점 값 조정
	var grade = ${data.grade}/5*125;
	document.querySelector('.star-ratings-css-top').style.width = grade + "%"

	</script>
</body>
</html>