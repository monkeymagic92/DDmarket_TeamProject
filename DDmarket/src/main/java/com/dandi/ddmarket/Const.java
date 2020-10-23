package com.dandi.ddmarket;

public class Const {
	
	public static String realPath = null;
	public static final String LOGIN_USER = "loginUser"; // 로그인한 유저의 세션 key값
	
	// service.login() 부분 (참고 UserService.java)
	public static final int FAIL = 0;		// 실패
	public static final int SUCCESS = 1;	// 로그인성공 
	public static final int NO_ID = 2;	    // 아이디 없을시 2번값 반환
	public static final int NO_PW = 3;      // 비번 없을시 3번값 반환
	public static final int BLANK_ID = 4;   // 아이디입력안한 공백시
}
