-- 유저정보 (주소 컬럼넣기)
CREATE TABLE t_user(
	i_user INT AUTO_INCREMENT,
	user_id VARCHAR(20) unique,
	user_pw VARCHAR(70),
	salt VARCHAR(80),
	nm VARCHAR(8),
	nick VARCHAR(14),
	email VARCHAR(34),	
	sm VARCHAR(80),
	profile_img VARCHAR(70),
	addr(
	r_dt DATETIME DEFAULT NOW(),
	m_dt DATETIME DEFAULT NOW(),
	PRIMARY KEY(i_user)
);
