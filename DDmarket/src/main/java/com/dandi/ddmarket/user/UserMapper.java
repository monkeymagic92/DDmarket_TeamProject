package com.dandi.ddmarket.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.category.model.CategoryVO;
import com.dandi.ddmarket.user.model.UserDMI;
import com.dandi.ddmarket.user.model.UserPARAM;
import com.dandi.ddmarket.user.model.UserVO;

@Mapper
public interface UserMapper {
	// select
	UserDMI selUser(UserPARAM param); 	// 해당유저 전체 컬럼값
	
	UserDMI findPwChk(UserPARAM param); // 비밀번호 변경전 입력정보 체크
	
	UserDMI findId(UserPARAM param);	// 아이디 찾기
	
	UserDMI emailChk(UserPARAM param);	// 이메일 중복체크
	
	UserDMI nickChk(UserPARAM param);	// 닉네임 중복체크
	
	List<CategoryVO> selCategory();		// 카테고리 리스트
	
	
	
	// insert
	int joinUser(UserVO param);		// 회원가입
	
	
	
	// update 
	int changePw(UserPARAM param);    // 비밀번호 변경
	
	int changeNick(UserPARAM param);  // 닉네임 변경 
	
	int changeAddr(UserPARAM param);  // 주소 변경
	
	int changeEmail(UserPARAM param); // 이메일 변경
		
	int insProfile_img(UserVO vo); 	  // 프로필사진 등록
	
	int changeCategory(UserPARAM param);	// 관심사 등록
	
	int delImg(int i_user);
	
		
	
	// delete 
	int delProfile_img(UserPARAM param);
	
	
	
}
