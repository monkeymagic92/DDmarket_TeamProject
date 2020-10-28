-- DDmarket.sql
-- ������ �Ʒ��� ���������� �����ϸ�� 



-- �������̺�
-- 10.20 buy �߰�
CREATE TABLE t_user(
	i_user INT UNSIGNED AUTO_INCREMENT, -- ȸ�� ���� pk��
	user_id VARCHAR(20) NOT NULL UNIQUE, -- ȸ�� ���̵� (�ߺ�����)
	user_pw VARCHAR(70) NOT NULL, -- ȸ�� ��й�ȣ (��ȣȭ ���� ���� �ְ� ũ�� 70����)
	salt VARCHAR(80) NOT NULL,
	nick VARCHAR(15) NOT NULL, -- ���� �г���
	nm VARCHAR(10) NOT NULL, -- ȸ�� �̸� (���� Ư���� �̸��� ������ ũ�� 12�� ����)	
	email VARCHAR(30) NOT NULL,	-- ȸ�� ����	
	post VARCHAR(30) NOT NULL, -- �����ȣ
	addr VARCHAR(30) NOT NULL, -- ����
	road VARCHAR(30) NOT NULL, -- ���θ�		
	joinPass INT(2) NOT NULL,
	uNum INT(9) NOT NULL,
	favI_cg_1 INT DEFAULT 1, -- ��ȣī�װ� 1 	
	favI_cg_2 INT DEFAULT 1, -- ��ȣī�װ� 2
	favI_cg_3 INT DEFAULT 1, -- ��ȣī�װ� 3 	 																					
	grade DOUBLE, -- ȸ�� �ſ���( ȸ���� �ŷ� û������ // ���̺� ���� ���� �����ص��� )	
	buy INT, -- ���ſϷ� ( �ϴ� �켱 �־���� )
	profile_img VARCHAR(50), -- ȸ�� ���� (��� ���� ����, ���������� �� ���� ��ǥ default�̹��� ���ϱ�)	
	r_dt DATETIME DEFAULT NOW(), -- ȸ�� ���Խ� ��ϵǴ� ��¥
	m_dt DATETIME DEFAULT NOW(), -- ""  ������      ""
	PRIMARY KEY (i_user)
);

SELECT * FROM t_user;



-- ī�װ� ���̺� --
CREATE TABLE t_category(
	i_cg INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, -- ī�װ� ���� pk��
	cg_nm VARCHAR(15) NOT NULL -- ī�װ� �̸� �߰�
);

INSERT INTO t_category (i_cg, cg_nm) VALUES (1, '�����Ƿ�');
INSERT INTO t_category (i_cg, cg_nm) VALUES (2, '�����Ƿ�');
INSERT INTO t_category (i_cg, cg_nm) VALUES (3, '�м���ȭ');
INSERT INTO t_category (i_cg, cg_nm) VALUES (4, '������|����');
INSERT INTO t_category (i_cg, cg_nm) VALUES (5, '��Ƽ|�̿�');
INSERT INTO t_category (i_cg, cg_nm) VALUES (6, '��Ȱ|����');
INSERT INTO t_category (i_cg, cg_nm) VALUES (7, '����|Ƽ��');
INSERT INTO t_category (i_cg, cg_nm) VALUES (8, '���Ƶ�|���');
INSERT INTO t_category (i_cg, cg_nm) VALUES (9, '��Ÿ');
INSERT INTO t_category (i_cg, cg_nm) VALUES (10,'���ᳪ��');

SELECT * FROM t_category;

SELECT * FROM t_user;






-- �Խñ� ���̺� --
CREATE TABLE t_board(
	i_board INT UNSIGNED AUTO_INCREMENT,	 -- �Խñ� ���� pk��
	i_cg INT UNSIGNED, 	-- ī�װ� ���̺�� ����
	i_user INT UNSIGNED,
	title VARCHAR(70) NOT NULL,	-- ���� 
	ctnt VARCHAR(2000) NOT NULL,		-- ����
	thumImage VARCHAR(50),
	image_1 VARCHAR(50),		-- ��ǰ ���� ( images_1 �� ��ǥ���� ���, ��ǥ������ ���� ���� ���Ͽ� ��Ÿ�� ��ǥ���� )
	image_2 VARCHAR(50),		
	image_3 VARCHAR(50),		
	image_4 VARCHAR(50),		
	image_5 VARCHAR(50),
	post VARCHAR(30) NOT NULL, -- �����ȣ
	addr VARCHAR(30) NOT NULL, -- ����
	road VARCHAR(30) NOT NULL, -- ���θ�
	hits INT DEFAULT 0, 	-- ��ȸ��
	price INT,	-- ���� ����			
	sold INT DEFAULT 0,  --  0�̸� �ŷ� �̿Ϸ�, 1�̸� �ŷ��Ϸ�
	r_dt DATETIME DEFAULT NOW(),	-- �Խñ� ��Ͻ� ��¥
	m_dt DATETIME DEFAULT NOW(),	-- ""  ������      ""
   PRIMARY KEY (i_board, i_cg, i_user),
	FOREIGN KEY (i_cg) REFERENCES t_category(i_cg),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user)
);

DROP TABLE t_board;

SELECT * FROM t_board;

SELECT B.cg_nm FROM t_board A
LEFT JOIN t_category B
ON A.i_cg = B.i_cg
WHERE i_board = 6;


SELECT * FROM t_board A
LEFT JOIN t_user B
ON A.i_user = B.i_user;

SELECT * FROM t_board;




-- ��  ���̺�
CREATE TABLE t_board_like(
	i_user INT UNSIGNED,
	i_board INT UNSIGNED,
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY (i_user, i_board),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user),
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)
);


-- ���� �׽�Ʈ
INSERT INTO t_board_like (i_user, i_board) VALUES (1, 2);

-- @@ ���� ������ @@ 
SELECT C.i_user, C.nm, A.title, A.ctnt, A.r_dt FROM t_board A
	LEFT JOIN t_board_like B
	ON A.i_board = B.i_board
	
	LEFT JOIN t_user C
	ON B.i_user = C.i_user
	
	WHERE B.i_user = 1;	



SELECT * FROM t_user;


-- ���� ���̺� ( ����̶� �ٸ�!, ���� ���������� �ۼ�)
CREATE TABLE t_review(
	i_review INT UNSIGNED AUTO_INCREMENT,	-- myReview ���� pk�� (t_userinfo, t_board ���̺�� join �ҽ� ���)
	i_board INT UNSIGNED,
	i_user INT UNSIGNED,
	ctnt VARCHAR(200) NOT NULL,	-- ���䳻��
	rating DOUBLE NOT NULL, -- �������� ������ �����ϱ� (���̺� ���� ������? 1,2,3,4,5 �� �������ٰ��� ������ ����ٰ���)
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
   PRIMARY KEY (i_review, i_board, i_user),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user), -- userinfo == review ���̺� (���� ���丮��Ʈ ���� Ȱ��)
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)	-- board == review ���̺� ( �ش� �Խñۿ� ���� ��Ÿ���� )
);


SELECT * FROM t_board;




-- ��� ���̺�
CREATE TABLE t_cmt(
	i_cmt INT UNSIGNED AUTO_INCREMENT,
	i_user INT UNSIGNED,
	i_board INT UNSIGNED,
	ctnt VARCHAR(300) NOT null,
	image_1 VARCHAR(50),
	image_2 VARCHAR(50),
	image_3 VARCHAR(50),
	r_dt DATETIME DEFAULT NOW(),	
	m_dt DATETIME DEFAULT NOW(),
  	PRIMARY KEY (i_cmt, i_user, i_board),
	FOREIGN KEY (i_user) REFERENCES t_user(i_user),	-- ȸ���� ����
	FOREIGN KEY (i_board) REFERENCES t_board(i_board)	-- �Խ��ǰ� ����
);















