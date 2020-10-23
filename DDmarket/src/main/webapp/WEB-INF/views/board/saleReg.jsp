<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/res/css/saleReg.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<div id="container">
        <main>
            <form action="" method="">
            <h2 class="title">상품 사진</h2>
            <span class="line"></span>
            <section class="sale-pic">
                    <div class="pics">
                        <label for="mfile">
                            <img src="/res/img/등록.jpg" alt="">
                        </label>
                        <input type="file" id="mfile" onchange="setPics(event)" style="display: none;" multiple accept="image/png, image/jpeg, image/jpg">
                        <label for="mfile">
                            <img src="/res/img/등록.jpg" alt="">
                        </label>
                        <input type="file" id="mfile" onchange="setPics(event)" style="display: none;" multiple accept="image/png, image/jpeg, image/jpg">
                        <label for="mfile">
                            <img src="/res/img/등록.jpg" alt="">
                        </label>
                        <input type="file" id="mfile" onchange="setPics(event)" style="display: none;" multiple accept="image/png, image/jpeg, image/jpg">
                        <label for="mfile">
                            <img src="/res/img/등록.jpg" alt="">
                        </label>
                        <input type="file" id="mfile" onchange="setPics(event)" style="display: none;" multiple accept="image/png, image/jpeg, image/jpg">
                        <label for="mfile">
                            <img src="/res/img/등록.jpg" alt="">
                        </label>
                        <input type="file" id="mfile" onchange="setPics(event)" style="display: none;" multiple accept="image/png, image/jpeg, image/jpg">
                    </div>
            </section>
            <h2 class="title">제목</h2>
            <span class="line"></span>
            <section class="goods-title">
                    <div class="div-title">
                        <input type="text" name="" placeholder="상품 제목을 입력해 주세요">
                    </div>
            </section>
            <h2 class="title">카테고리</h2>
            <span class="line"></span>
            <section class="category">
                <div class="category-box">
                    <input type="checkbox" name="" id="f-wear">
                    <label for="f-wear">여성의류</label>
                    <input type="checkbox" name="" id="m-wear">
                    <label for="m-wear">남성의류</label>
                    <input type="checkbox" name="" id="fashion">
                    <label for="fashion">패션잡화</label>
                    <input type="checkbox" name="" id="digital">
                    <label for="digital">디지털 | 가전</label>
                    <input type="checkbox" name="" id="buti">
                    <label for="buti">뷰티 | 미용</label>
                    <input type="checkbox" name="" id="life">
                    <label for="life">생활 | 가구</label>
                    <input type="checkbox" name="" id="book">
                    <label for="book">도서 | 티켓</label>
                    <input type="checkbox" name="" id="child">
                    <label for="child">유아용 | 출산</label>
                    <input type="checkbox" name="" id="etc">
                    <label for="etc">기타</label>
                    <input type="checkbox" name="" id="comp">
                    <label for="comp">무료나눔</label>
                </div>
            </section>
            <h2 class="title">거래지역</h2>
            <span class="line"></span>
            <section class="deal-area">
                    <div class="div-area">
                        <input type="text" name="" placeholder="지역을 입력 해 주세요">
                    </div>
            </section>
            <h2 class="title">가격</h2>
            <span class="line"></span>
            <section class="goods-price">
                    <div class="div-price">
                        <input type="number" name="" class="" placeholder="가격을 입력 해 주세요">
                    </div>
            </section>
            <h2 class="title">상품 설명</h2>
            <span class="line"></span>
            <section class="goods-info">
                    <div class="info-txt">
                        <textarea name="" rows="6" id="" placeholder="상품을 설명 해 주세요"></textarea>
                    </div>
            </section>
            <div class="div-btn">
                <button class="goods-btn" type="submit">상품등록</button>
            </div>
            </form>
        </main>
    </div>
</body>
</html>