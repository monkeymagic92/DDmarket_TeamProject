<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>찜목록</title>
<link rel="stylesheet" href="/res/css/likeList.css">
</head>
<body>
		
        <main>
        
            <div id="div-title">찜 목록</div>
            <div class="tab_content" id="div-wrap-buyList">
            	<c:forEach items="${data}" var="item">
                <article class="div-wrap-buyList-article">
                    <div class="card-image"><a href="/board/detail?i_board=${item.i_board}"><img src="/res/img/board/${item.i_board}/${item.thumImage}"></a></div>
                    <div class="card-right">
                        <div class="card-title">
                        <a href="/board/detail?i_board=${item.i_board}">${item.title}</a>
                        </div>
                        <div class="card-price">${item.price}원</div>
                        <div class="card-addr">
                        <span class="iconify" data-inline="false" data-icon="el:map-marker" style="color: #6f6a6a; font-size: 16px;"></span>
                        <span>${item.addr}</span>
                        </div>
                        <div class="card-date">
                        <span class="card-date-text">찜한 날짜</span>
                        <span class="card-date-num">${item.r_dt}</span>
                        </div>
                        <button onclick="likeListDel(${item.i_board})">삭제</button>
                    </div>
                </article>
                </c:forEach>
            </div>
        
        </main>
      
    <script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
</body>
<script>
	function likeListDel(i_board) {
		if(confirm('삭제 하시겠습니까?')){		
			location.href='/user/likeListDel?i_board=' + i_board + '&i_user=' + ${loginUser.i_user};
			}
	} 
	
</script>
</html>