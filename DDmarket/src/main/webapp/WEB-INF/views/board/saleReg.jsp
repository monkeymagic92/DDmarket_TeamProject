<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기 어떤값 넣어도 DEFAULT_TEMP 로 넘어가서 단디마켓으로 뜸</title>
<link rel="stylesheet" href="/res/css/saleReg.css">
<link rel="stylesheet" href="/res/css/animate.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
   <div id="container">
        <main>
            <form id="frm" action="/board/saleReg" method="post" enctype="multipart/form-data" onsubmit="return chk()">
            <h2 class="title">상품 사진</h2>
            <span class="line"></span>
            <section class="sale-pic">
                <div class="pics">
					<label for="file">
						<c:if test="${data.thumImage == null }">						
					    	<img src="/res/img/대표이미지.jpg"  alt="" class="img">
					    </c:if>
					    <c:if test="${data.thumImage != null }">
					    	<img src="/res/img/board/${data.i_board }/${data.thumImage}" class="img">
					    </c:if>
					</label>
                    <input type="file" name="image" id="file" accept="image/png, image/jpeg, image/jpg">                  
            	</div>                   
                <div class="pics2">
	                <label for="mfile">
						<img src="/res/img/이미지등록.jpg"  alt="" class="img2"  id="imgId">
	                </label>
					<input type="file" name="images"  id="mfile" multiple accept="image/png, image/jpeg, image/jpg">
					<c:if test="${data.i_board != null}">
						<c:if test="${data.image_1 != '' }">
							<img src="/res/img/board/${data.i_board }/${data.image_1}" class="selProductFile">
						</c:if>
						<c:if test="${data.image_2 != '' }">
							<img src="/res/img/board/${data.i_board }/${data.image_2}" class="selProductFile">
						</c:if>					
						<c:if test="${data.image_3 != '' }">
							<img src="/res/img/board/${data.i_board }/${data.image_3}" class="selProductFile">
						</c:if>
						<c:if test="${data.image_4 != '' }">
							<img src="/res/img/board/${data.i_board }/${data.image_4}" class="selProductFile">
						</c:if>
						<c:if test="${data.image_5 != '' }">
							<img src="/res/img/board/${data.i_board }/${data.image_5}" class="selProductFile">
						</c:if>
					</c:if>
               </div>
            </section>
            <h2 class="title">제목</h2>
            <span class="line"></span>
            <section class="goods-title">
                    <div class="div-title">
                        <input type="text" name="title" placeholder="상품 제목을 입력해 주세요" value="${data.title }">
                    </div>
            </section>
            <h2 class="title">카테고리</h2>
            <span class="line"></span>
            <section class="category">
                <div class="category-box">
                    <c:forEach items="${categoryList}" var="item">
                       <input type="checkbox" name="i_cg" id="f-wear${item.i_cg }" value="${item.i_cg }" onclick="count_ck(this);">
                       <label for="f-wear${item.i_cg }">${item.cg_nm }</label>
                    </c:forEach>
                </div>
            </section>
            <h2 class="title">거래지역</h2>
            <span class="line"></span>
            <section class="deal-area">
                <div class="div-area">
               		<input type="text" id="sample4_postcode" name="post" class="addr_input" value="${data.post }" placeholder="클릭할시 주소검색창이 나타납니다" onclick="sample4_execDaumPostcode()"><br>
					<input id="addrUnChk" name="addrUnChk" type="hidden" value="unChk">
					<input type="text" id="sample4_jibunAddress" name="addr" class="addr_input" value="${data.addr }" placeholder="지번주소" onclick="sample4_execDaumPostcode()"><br>
					<input type="text" id="sample4_roadAddress" name="road" class="addr_input" value="${data.road }" placeholder="도로명주소" onclick="sample4_execDaumPostcode()">
					<input id="postChk" name="postChk" type="hidden" value="unChk">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
					<input type="hidden" name="result" value="5">	
                </div>
            </section>
            <h2 class="title">가격</h2>
            <span class="line"></span>
            <section class="goods-price">
                <div class="div-price">
                    <input type="text" name="price" id="priceInput" class="img" class="priceInput" required placeholder="가격을 입력 해 주세요" value="${data.price }">
                </div>
                &nbsp;&nbsp;
                <div>
                	무료나눔 <input type="checkbox" name="priceChk" id="priceChk" class="priceChk">
                </div>
            </section>
            <h2 class="title">상품 설명</h2>
            <span class="line"></span>
            <section class="goods-info">
                <div class="info-txt">
                    <textarea name="ctnt" rows="6" id="ctnt" placeholder="상품을 설명 해 주세요">${data.ctnt }</textarea>
                </div>
            </section>
            <div class="div-btn">
            	<!-- 로그인한, 즉 글쓴이의 i_user값을 같이 post로 넘김 -->
                <input type="hidden" name="i_user" value="${loginUser.i_user }">                  
                <c:if test="${data.i_board == null }">
                	<input type="hidden" name="saleResult" value="1">
                </c:if>
                <c:if test="${data.i_board != null }">
                	<input type="hidden" name="saleResult" value="2">
                	<input type="hidden" name="i_board" value="${data.i_board }"> 
                </c:if>
                <button class="goods-btn" type="submit">${data.i_board == null ? '상품등록' : '상품수정'}</button>
            </div>
            </form>
        </main>
    </div>
</body>
<script src="/res/js/saleReg.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
if(${ImageFail != null}) {
   alert('${ImageFail}')
}
if(${serverErr != null}) {
	alert('${serverErr}')
}
// 무료나눔 체크여부에 따라 가격을 0, 또는 직접 입력하게
$('#priceChk').click(function() {
	if($("input:checkbox[name=priceChk]").is(":checked") == true) {
		$('#priceInput').hide();
		$('#pricc').hide();
		frm.price.value = 0;
	 	
	 	
	} else if($("input:checkbox[name=priceChk]").is(":checked") == false) {
		$('#priceInput').show();
		$('#pricc').show();
		frm.price.value = null;
	}
})

//관심사 체크, 최대갯수 3개제한 
function count_ck(obj){
   var chkbox = document.getElementsByName("i_cg");
   var chkCnt = 0;
   for(var i=0; i<chkbox.length; i++){
      if(chkbox[i].checked){
         chkCnt++;
      }         
   }   
   if(chkCnt > 1){
      alert("관심사는 1개까지 선택가능합니다");
      obj.checked = false;
      return false;      
   } 
}
$('#sample4_jibunAddress').hide();
$('#sample4_roadAddress').hide();
$('#sample4_postcode').click(function() {
   frm.addrUnChk.value = 'chk'
})
//--------@multiple image preview-----------//
         var sel_files = [];
         
          $(document).ready(function() {
              $("#mfile").on("change", handleImgFileSelect);
          }); 
          
          function handleImgFileSelect(e) {
              
              $(".selProductFile").remove();
  
              sel_files = [];
            
              //파일 길이
              var files = e.target.files;
              
              if(files.length > 5) {
                  alert('이미지는 5장만 업로드 가능합니다.');
                  document.getElementById("mfile").value = "";
                  return false;
              }
              
              //파일 길이를 배열로 바꿔줌
              var filesArr = Array.prototype.slice.call(files);
          
              var index = 0;
              filesArr.forEach(function(f) {
                  
                  if(!f.type.match("image.*")) {
                      alert("이미지만 업로드 가능합니다.");
                      return;
                  } 
  
                  sel_files.push(f)
                 
   
                  var reader = new FileReader();
  
                  reader.onload = function(e) {
                      var html = "<img src=\"" + e.target.result + "\"class='selProductFile'>";
                      $(".pics2").append(html);
                     
                  }
  
                  reader.readAsDataURL(f);
              });
  
          }
        //--------@multiple image preview-----------//
// 주소api
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
           if(frm.addrUnChk.value == 'chk') {
              $('#sample4_jibunAddress').show();
              $('#sample4_roadAddress').show();
           }
           
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';
            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}   
</script>
</html>