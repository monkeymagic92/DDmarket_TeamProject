<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="/res/css/search.css">
</head>
<body>
	<div id="container">
        <main>
        	<div>
	        	<c:forEach var="item" items="${cgList}">
	        		<c:choose>
	        			<c:when test="${i_cg == item.i_cg}">
	        				<a style="color: red;" href="/index/search?i_cg=${item.i_cg}">${item.cg_nm}</a>
	        			</c:when>
	        			<c:otherwise>
	        				<a href="/index/search?i_cg=${item.i_cg}">${item.cg_nm}</a>
	        			</c:otherwise>
	        		</c:choose>
	            </c:forEach>
        	</div>
            <div id="div-wrap-top">
                <div id="div-search-result">
                	<c:if test="${searchNm == null && cdSearchNm != null}">
                		<span>카테고리:${cdSearchNm}</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm != '' && cdSearchNm == null}">
	                	<span id="span-search-reuslt-text">${searchNm}</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm != '' && cdSearchNm != null && searchNm != null}">
	                	<span>카테고리:${cdSearchNm}</span>
	                	<span id="span-search-reuslt-text">${searchNm}</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm == '' && cdSearchNm == null}">
	                	<span id="span-search-reuslt-text">전체</span>의 검색결과
                	</c:if>
                	<span id="span-search-reuslt-number">${fn:length(searchList)}개</span>
                </div>
                <div id="div-search-standard">
	                <c:choose>
	                	<c:when test="${searchType == 'new'}">
		                	<a style="color: red;" href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'hot'}">
		                	<a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}">최신순</a>ㅣ
		                	<a style="color: red;" href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'lowPrice'}">
     			            <a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}">인기순</a>ㅣ
		                	<a style="color: red;" href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'highPrice'}">
		                	<a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}">저가순</a>ㅣ
		                	<a style="color: red;" href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == null}">
		                	<a style="color: red;" href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}">고가순</a>
	                	</c:when>
	                </c:choose>
                </div>
            </div>
            <div id="div-wrap-article">
            
                <c:forEach var="item" items="${searchList}">
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
        </main>
    </div>
</body>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</html>