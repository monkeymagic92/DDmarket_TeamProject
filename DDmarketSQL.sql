-- DDmarket.sql
-- 위에서 아래로 순차적으로 실행하면됨 


SELECT B.i_user ,B.profile_img, B.nick, A.ctnt, A.r_dt FROM t_cmt A
				
LEFT JOIN t_user B
ON A.i_user = B.i_user

WHERE A.i_board = 2
ORDER BY A.r_dt DESC;


-- 유저테이블
-- 10.20 buy 추가
CREATE TABLE t_user(
	i_user INT UNSIGNED AUTO_INCREMENT, -- 회원 고유 pk값
	user_id VARCHAR(20) NOT NULL UNIQUE, -- 회원 아이디 (중복방지)
	user_pw VARCHAR(70) NOT NULL, -- 회원 비밀번호 (암호화 값이 들어갈수 있게 크기 70잡음)
	salt VARCHAR(80) NOT NULL,
	nick VARCHAR(15) NOT NULL, -- 유저 닉네임
	nm VARCHAR(10) NOT NULL, -- 회원 이름 (가끔 특이한 이름도 있으니 크기 12로 줬음)	
	email VARCHAR(30) NOT NULL,	-- 회원 메일	
	post VARCHAR(30) NOT NULL, -- 우편번호
	addr VARCHAR(30), -- 지번
	road VARCHAR(30) NOT NULL, -- 도로명		
	joinPass INT(2) NOT NULL,
	uNum INT(9) NOT NULL,
	favI_cg_1 INT DEFAULT 1, -- 선호카테고리 1 	
	favI_cg_2 INT DEFAULT 1, -- 선호카테고리 2
	favI_cg_3 INT DEFAULT 1, -- 선호카테고리 3 	 																					
	grade DOUBLE, -- 회원 신용등급( 회원의 거래 청결유무 // 테이블 따로 뺴서 관리해도됨 )	
	buy INT, -- 구매완료 ( 일단 우선 넣어본거임 )
	profile_img VARCHAR(50), -- 회원 사진 (등록 여부 자유, 사진없을시 무 마켓 대표 default이미지 정하기)	
	r_dt DATETIME DEFAULT NOW(), -- 회원 가입시 등록되는 날짜
	m_dt DATETIME DEFAULT NOW(), -- ""  수정시      ""
	PRIMARY KEY (i_user)
);


SELECT A.i_user, A.i_board, B.nick, A.title, A.post, A.addr, A.road, A.r_dt,
	    A.ctnt, A.hits, C.cg_nm, A.price, ifnull(D.cnt, 0) as tolike, B.grade,
	    CASE WHEN E.i_board IS NULL THEN 0 ELSE 1 END AS is_tolike,
		A.thumImage, A.image_1, A.image_2, A.image_3, A.image_4, A.image_5
		FROM t_board A
  
		LEFT JOIN t_user B
		ON A.i_user = B.i_user
  
		LEFT JOIN(
			SELECT i_board, COUNT(i_board) as cnt
			FROM t_board_like
			WHERE i_board = 2
			GROUP BY i_board
		)D
		ON A.i_board = D.i_board
		
		LEFT JOIN t_category C
		ON A.i_cg = C.i_cg
		
		LEFT JOIN t_board_like E
		ON A.i_board = E.i_board
		AND E.i_user = 1
		WHERE A.i_board = 2;

-- 카테고리 테이블 --
CREATE TABLE t_category(
	i_cg INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- 카테고리 고유 pk값
	cg_nm VARCHAR(15) NOT NULL -- 카테고리 이름 추가
);



INSERT INTO t_category (i_cg, cg_nm) VALUES (1, '여성의류');
INSERT INTO t_category (i_cg, cg_nm) VALUES (2, '남성의류');
INSERT INTO t_category (i_cg, cg_nm) VALUES (3, '패션잡화');
INSERT INTO t_category (i_cg, cg_nm) VALUES (4, '디지털|가전');
INSERT INTO t_category (i_cg, cg_nm) VALUES (5, '뷰티|미용');
INSERT INTO t_category (i_cg, cg_nm) VALUES (6, '생활|가구');
INSERT INTO t_category (i_cg, cg_nm) VALUES (7, '도서|티켓');
INSERT INTO t_category (i_cg, cg_nm) VALUES (8, '유아동|출산');
INSERT INTO t_category (i_cg, cg_nm) VALUES (9, '기타');
INSERT INTO t_category (i_cg, cg_nm) VALUES (10,'무료나눔');




-- 게시글 테이블 --
CREATE TABLE t_board(
	i_board INT UNSIGNED AUTO_INCREMENT,	 -- 게시글 고유 pk값
	i_cg INT UNSIGNED, 	-- 카테고리 테이블과 조인
	i_user INT UNSIGNED,
	title VARCHAR(70) NOT NULL,	-- 제목 
	ctnt VARCHAR(2000) NOT NULL,		-- 내용
	thumImage VARCHAR(50),
	image_1 VARCHAR(50),		-- 상품 사진 ( images_1 은 대표사진 등록, 대표사진은 추후 나의 찜목록에 나타낼 대표사진 )
	image_2 VARCHAR(50),		
	image_3 VARCHAR(50),		
	image_4 VARCHAR(50),		
	image_5 VARCHAR(50),
	post VARCHAR(30) NOT NULL, -- 우편번호
	addr VARCHAR(30) NOT NULL, -- 지번
	road VARCHAR(30) NOT NULL, -- 도로명
	hits INT DEFAULT 0, 	-- 조회수
	price INT(13),	-- 가격 설정			
	sold INT DEFAULT 0,  --  0이면 거래 미완료, 1이면 거래완료
	r_dt DATETIME DEFAULT NOW(),	-- 게시글 등록시 날짜
	m_dt DATETIME DEFAULT NOW(),	-- ""  수정시      ""
   PRIMARY KEY (i_board, i_cg, i_user),
	FOREIGN KEY (i_cg) REFERENCES t_category(i_cg) ON DELETE CASCADE,
	FOREIGN KEY (i_user) REFERENCES t_user(i_user) ON DELETE CASCADE
);




-- 찜  테이블
CREATE TABLE t_board_like(
	i_user INT UNSIGNED,
	i_board INT UNSIGNED,
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY (i_user, i_board),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user),
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)
);


-- 찜목록 테스트
INSERT INTO t_board_like (i_user, i_board) VALUES (1, 2);

-- @@ 찜목록 쿼리문 @@ 
SELECT C.i_user, C.nm, A.title, A.ctnt, A.r_dt FROM t_board A
	LEFT JOIN t_board_like B
	ON A.i_board = B.i_board
	
	LEFT JOIN t_user C
	ON B.i_user = C.i_user
	
	WHERE B.i_user = 1;	





SELECT A.i_board, A.image_1, A.title, A.price, A.r_dt, SUBSTRING_INDEX(A.addr," ",3) AS addr
FROM t_board A
LEFT JOIN t_user B
ON A.i_user = B.i_user
WHERE SUBSTRING_INDEX(A.addr," ",2) in (SELECT SUBSTRING_INDEX(B.addr," ",2) FROM t_user WHERE B.i_user = 1)
ORDER BY A.r_dt DESC;



-- 리뷰 테이블 ( 댓글이랑 다름!, 물건 구매했을시 작성)
CREATE TABLE t_review(
	i_review INT UNSIGNED AUTO_INCREMENT,	-- myReview 고유 pk값 (t_userinfo, t_board 테이블과 join 할시 사용)
	i_board INT UNSIGNED,
	i_user INT UNSIGNED,
	ctnt VARCHAR(200) NOT NULL,	-- 리뷰내용
	rating DOUBLE NOT NULL, -- 점수관련 팀원과 상의하기 (테이블 따로 뺄건지? 1,2,3,4,5 점 식으로줄건지 점수를 어떻게줄건지)
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
   PRIMARY KEY (i_review, i_board, i_user),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user), -- userinfo == review 테이블 (나의 리뷰리스트 볼때 활용)
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)	-- board == review 테이블 ( 해당 게시글에 리뷰 나타낼떄 )
);



-- 댓글 테이블
CREATE TABLE t_cmt(
	i_cmt INT UNSIGNED AUTO_INCREMENT,
	i_user INT UNSIGNED,
	i_board INT UNSIGNED,
	ctnt VARCHAR(300) NOT null,
	scr INT DEFAULT 0,
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
  	PRIMARY KEY (i_cmt, i_user, i_board),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user),	-- 회원과 연결
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)	-- 게시판과 연결
);










