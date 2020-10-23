package com.dandi.ddmarket.user;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dandi.ddmarket.Const;
import com.dandi.ddmarket.FileUtils;
import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.category.model.CategoryVO;
import com.dandi.ddmarket.user.model.UserDMI;
import com.dandi.ddmarket.user.model.UserPARAM;
import com.dandi.ddmarket.user.model.UserVO;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;
	
	// 이메일 체크
	public int emailChk(UserPARAM param, HttpSession hs) {
		
		UserDMI dbUser = mapper.emailChk(param);
		
		if(dbUser == null) {
			return 1; 
		}		
		
		if(dbUser.getEmail().equals(param.getEmail())) {
			return 2;		
		}		
		
		return 0;
	}
	
	// 닉네임 체크
	public int nickChk(UserPARAM param) {
				
		UserDMI dbUser = mapper.nickChk(param);
		
		if(dbUser == null) {
			return 1;
		}
		
		if(dbUser.getNick().equals(param.getNick())) {
			return 2;
		}
		
		return 0;
	}
	
	// 회원 전체목록 ( 나중에 불필요하면 삭제하기 ) ★★ 
	// 일단 login xml 과 조금 다름 (검토하기)
	public UserDMI selUser(UserPARAM param) {
		
		UserDMI dbUser = mapper.selUser(param);
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setNick(dbUser.getNick());
		param.setEmail(dbUser.getEmail());
		param.setProfile_img(dbUser.getProfile_img());		
		param.setAddr(dbUser.getAddr());
		param.setPost(dbUser.getPost());
		param.setRoad(dbUser.getRoad());
		param.setJoinPass(dbUser.getJoinPass());
		param.setR_dt(dbUser.getR_dt());
		param.setM_dt(dbUser.getM_dt());
		
		return dbUser;
	}
	
	// SUCCESS 1:로그인 성공,  NO_ID 2:아이디 없음,  NO_PW 3:비번 틀림
	public int login(UserPARAM param) {
		if(param.getUser_id().equals("")) {
			return Const.BLANK_ID; 
		}
		UserDMI dbUser = mapper.selUser(param);
		
		if(dbUser == null) {
			return Const.NO_ID; 
		} 
						
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		if(!cryptPw.equals(dbUser.getUser_pw())) {return Const.NO_PW;} // 3
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setNick(dbUser.getNick());
		param.setEmail(dbUser.getEmail());
		param.setProfile_img(dbUser.getProfile_img());		
		param.setAddr(dbUser.getAddr());
		param.setPost(dbUser.getPost());
		param.setRoad(dbUser.getRoad());
		param.setJoinPass(dbUser.getJoinPass());
		param.setR_dt(dbUser.getR_dt());
		param.setM_dt(dbUser.getM_dt());
		
		return Const.SUCCESS;
	}

	
	// 회원가입
	public int joinUser(UserVO param) {
		int result = 0;
		
		if(param.getUser_id() == "" || param.getUser_pw() == "" 
				|| param.getEmail() == "" || param.getNick() == "" 
				|| param.getNm() == "" || param.getPost() == ""
				|| param.getAddr() == "" || param.getRoad() == "") {
			
			System.out.println(" 1 유저아디 : " + param.getUser_id());
			result = Const.FAIL;
			
		} else {
			System.out.println(" 2 유저아디 : " + param.getUser_id());
			
			String pw = param.getUser_pw();
			String salt = SecurityUtils.generateSalt();
			String cryptPw = SecurityUtils.getEncrypt(pw, salt);
			
			param.setSalt(salt);
			param.setUser_pw(cryptPw);
			
			result = Const.SUCCESS;
			mapper.joinUser(param);
		}
		return result;
	}
	
	
	// 비밀번호 찾기  1. 아디,이멜 검사
	public int findPw (UserPARAM param, HttpSession hs) {
		UserDMI dbUser = mapper.findPwChk(param);
		
		if(dbUser == null) { return Const.FAIL; }
		
		if(dbUser.getUser_id().equals(param.getUser_id())
				&& dbUser.getEmail().equals(param.getEmail())) {
			
			hs.setAttribute("i_user", dbUser.getI_user());
			return Const.SUCCESS;
		} else {
			return Const.FAIL;
		}
	}
		
	
	// 비밀번호 변경 
	public int changePw(UserPARAM param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		int result = mapper.changePw(param);
		return result; 
	}
	
	
	// 아이디 찾기
	public int findId(UserPARAM param, HttpSession hs) {
		UserDMI dbUser = new UserDMI();
		dbUser = mapper.findId(param);
		
		if(dbUser == null) {
			return Const.FAIL;
		} else {
			hs.setAttribute("user_id", dbUser.getUser_id());
			return Const.SUCCESS;
		}		 
	}
	
	
	// 프로필사진 등록
	public String insUserProfileImg(MultipartHttpServletRequest mReq, UserVO vo) {
		
		int i_user = SecurityUtils.getLoginUserPk(mReq.getSession());
		
		String path = mReq.getServletContext().getRealPath("") +  "resources/img/profile_img/user/" + i_user + "/";
		
		File file = new File(path + vo.getProfile_img());
		
		System.out.println("파일경로 : " + file);
		
		if(file.exists()) {
			file.delete();	
		} 
		
		MultipartFile fileList = mReq.getFile("user_profile_img");
		
		File dir = new File(path);		
		if(!dir.exists()) {  
			dir.mkdirs(); 
		}
		
		// String oldFile = path;		
				
		System.out.println("사진저장주소  : " + path);
		
		String originFileNm = fileList.getOriginalFilename(); 
		String ext = FileUtils.getExt(originFileNm); 
		String saveFileNm = UUID.randomUUID() + ext; 
				
		//vo.setProfile_img(saveFileNm);
		//vo.setI_user(i_user);
				
		try {
			fileList.transferTo(new File(path + saveFileNm));
			vo.setI_user(i_user);
			vo.setProfile_img(saveFileNm);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		mapper.insProfile_img(vo);
		
		return saveFileNm;
	}
	
	
	// 프로필사진 삭제
	public int delUserProfileImg(int i_user) {
		mapper.delImg(i_user);
		return 1;
	}	 
		
	// 카테고리 나타내기
	public List<CategoryVO> selCategory() {		
		List<CategoryVO> list = new ArrayList<CategoryVO>();  
		list = mapper.selCategory();
		  
		return list;
	}
	
		
	// 닉네임 변경
	public int changeInfo(UserPARAM param, int result) {
		if(result == 3) { // 비밀번호 변경
			return changePw(param);
			
		} else if(result == 4) { // 닉네임 변경
			return mapper.changeNick(param);
			
		} else if(result == 5) { // 주소변경
			return mapper.changeAddr(param);
			
		} else if(result == 6) { // 이메일 변경
			return mapper.changeEmail(param);
		} 
		
		return 0;	
	}
	
	// 관심사 변경
	public int changeCategory(UserPARAM param) {
		int result = mapper.changeCategory(param);
		return result;
	}
	
}
