package com.dandi.ddmarket;

// 주소관련
public class ViewRef {	
	// template
	public static final String DEFAULT_TEMP = "template/defaultTemp";	// Header, Footer 둘다있는 템플릿 ( 인덱스 메인화면 용 )
	public static final String MENU_TEMP = "template/menuTemp";  // Footer만 있는 템플릿 (로그인창, 아이디, 비번찾기 등 사용하는 템플릿)
	public static final String ORIGIN_TEMP = "template/originBackGround"; // 기타 alert창띄우는용도 기본 뒷배경 템플릿
	
	
	// user
	public static final String USER_LOGIN = "user/login";	    // 로그인
	public static final String USER_JOIN = "user/join";  	    // 회원가입 
	public static final String USER_FINDPW = "user/findPw";     // 비밀번호 찾기	
	public static final String USER_CERCODE = "user/cerCode";   // 인증번호
	public static final String USER_CHANGEPW = "user/changePw";	// 비밀번호 변경
	public static final String USER_FINDID = "user/findId";		// 아이디 찾기
	public static final String USER_MYPAGE = "user/myPage";		// 마이페이지
	public static final String USER_INFO = "user/info"; 		// 개인정보 변경
	public static final String USER_LIKELIST = "user/likeList";	// 찜목록 리스트
	
	
	// index 
	public static final String INDEX_MAIN = "index/main"; // 단디마켓 메인화면
}

