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
        	<div class="cg-menu-bar-wrap">
	        	<c:forEach var="item" items="${cgList}">
	        		<c:choose>
	        			<c:when test="${i_cg == item.i_cg}">
	        				<div class="cg-menu-bar-div"><a href="/index/search?i_cg=${item.i_cg}&searchNm=${searchNm}" class="cg-menu-bar-a">${item.cg_nm}</a></div>
	        			</c:when>
	        			<c:otherwise>
	        				<div class="cg-menu-bar-div"><a href="/index/search?i_cg=${item.i_cg}&searchNm=${searchNm}" class="cg-menu-bar-b">${item.cg_nm}</a></div>
	        			</c:otherwise>
	        		</c:choose>
	            </c:forEach>
        	</div>
        	<!-- 검색어가 있을 때 '전체'가 노출 되지 않게 하기, 카테고리로만 선택 했을 때 '전체'가 보여야 함 -->
            <div id="div-wrap-top">
                <div id="div-search-result">
                	<c:if test="${searchNm == null && cdSearchNm != null}">
                		<span class="span-search-reuslt-text-cg">${cdSearchNm}</span>
                		<span id="span-search-reuslt-text-all">전체</span>의  검색결과
                	</c:if>
                	<c:if test="${searchNm == '' && cdSearchNm != null}">
                		<span class="span-search-reuslt-text-cg">${cdSearchNm}</span>
                		<span id="span-search-reuslt-text-all">전체</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm != '' && cdSearchNm == null}">
	                	<span id="span-search-reuslt-text">${searchNm}</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm != '' && cdSearchNm != null && searchNm != null}">
	                	<span class="span-search-reuslt-text-cg">${cdSearchNm}</span>
	                	<span id="span-search-reuslt-text">${searchNm}</span>의 검색결과
                	</c:if>
                	<c:if test="${searchNm == '' && cdSearchNm == null}">
	                	<span id="span-search-reuslt-text-all">전체</span>의 검색결과
                	</c:if>
                	<span id="span-search-reuslt-number">${totalCount}개</span>
                </div>
                <div id="div-search-standard">
	                <c:choose>
	                	<c:when test="${searchType == 'new'}">
		                	<a style="color: #F84C4C;" href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-a">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-b">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-c">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-d">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'hot'}">
		                	<a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-a">최신순</a>ㅣ
		                	<a style="color: #F84C4C;" href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-b">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-c">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-d">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'lowPrice'}">
     			            <a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-a">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-b">인기순</a>ㅣ
		                	<a style="color: #F84C4C;" href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-c">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-d">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == 'highPrice'}">
		                	<a href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-a">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-b">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-c">저가순</a>ㅣ
		                	<a style="color: #F84C4C;" href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-d">고가순</a>
	                	</c:when>
	                	<c:when test="${searchType == null}">
		                	<a style="color: #F84C4C;" href="/index/search?searchType=new&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-a">최신순</a>ㅣ
		                	<a href="/index/search?searchType=hot&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-b">인기순</a>ㅣ
		                	<a href="/index/search?searchType=lowPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-c">저가순</a>ㅣ
		                	<a href="/index/search?searchType=highPrice&i_cg=${i_cg > 0 ? i_cg : 0}&searchNm=${searchNm}" class="search-standard-d">고가순</a>
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
			<div id="div-wrap-page">
                <c:if test="${pageMaker.prev}">
                	<a href='<c:url value="/index/search?page=${pageMaker.startPage-1}&searchNm=${searchNm}&i_cg=${i_cg == null ? 0 : i_cg}&searchType=${searchType == null ? 'new' : searchType}"/>'><span class="iconify icon-page-left" data-inline="false" data-icon="mdi-light:chevron-double-left" style="color: #3b73c8; font-size: 47px;"></span></a>
                </c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			        <c:choose>
			        <c:when test="${page == pageNum}">
			        	<a style="color: red;" href='<c:url value="/index/search?page=${pageNum}&searchNm=${searchNm}&i_cg=${i_cg == null ? 0 : i_cg}&searchType=${searchType == null ? 'new' : searchType}"/>'>${pageNum}</a>
			        </c:when>
			        <c:otherwise>		        
			        	<a href='<c:url value="/index/search?page=${pageNum}&searchNm=${searchNm}&i_cg=${i_cg == null ? 0 : i_cg}&searchType=${searchType == null ? 'new' : searchType}"/>'>${pageNum}</a>
			        </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
               		 <a href='<c:url value="/index/search?page=${pageMaker.endPage+1}&searchNm=${searchNm}&i_cg=${i_cg == null ? 0 : i_cg}&searchType=${searchType == null ? 'new' : searchType}"/>'><span class="iconify icon-page-right" data-inline="false" data-icon="mdi-light:chevron-double-right" style="color: #3b73c8; font-size: 47px;"></span></a>
           		</c:if>
            </div>
        </main>
    </div>
</body>
<script src="/res/js/search.js"></script>
<script src="https://code.iconify.design/1/1.0.6/iconify.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</html>