package com.dandi.ddmarket.user;


import java.io.File; // 여기부분 에러뜨면 빌드패스 자바jre 확인   ( 체크했을시 다시 임포트 파일 해주면 됨 )

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.Const;
import com.dandi.ddmarket.Criteria;
import com.dandi.ddmarket.PageMaker;
import com.dandi.ddmarket.Paging;
import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.BoardService;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.mail.MailSendService;
import com.dandi.ddmarket.mail.model.EmailVO;
import com.dandi.ddmarket.review.model.ReviewPARAM;
import com.dandi.ddmarket.tap.TapVO;
import com.dandi.ddmarket.user.model.UserDMI;
import com.dandi.ddmarket.user.model.UserPARAM;
import com.dandi.ddmarket.user.model.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	static int cerCodeCount = 0; // 인증코드 틀렸을시 카운트 
	
	@Autowired
	private UserService service;  // 유저 서비스
	
	@Autowired
	private MailSendService mss;  // 이메일
	
	@Autowired
	private BoardService boardService;
	
			
	/*
	 *  	아작스에 hs 세션 값 확인해보고 불필요하면 지우기
	 */	
	
	// 아이디 중복체크 (aJax) 
	@RequestMapping(value="/ajaxIdChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxIdChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.login(param);
		return String.valueOf(result);
	}
	
	// 이메일 중복체크(aJax)
	@RequestMapping(value="/ajaxEmailChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxEmailChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.emailChk(param, hs);	
		return String.valueOf(result);
	}
	
	// 닉네임 중복체크(aJax)
	@RequestMapping(value="/ajaxNickChk", method=RequestMethod.POST)
	@ResponseBody	
	public String ajaxNickChk(@RequestBody UserPARAM param, HttpSession hs) {
		
		int result = service.nickChk(param);
		
		// 지웁시다!
		if(result == 0) {
			System.out.println("result : " + result);
		}
		return String.valueOf(result);
	}
	
	// 로그아웃 (logout)
	@RequestMapping(value="/logout")
	public String logout(Model model, HttpSession hs, RedirectAttributes ra, HttpServletRequest request) {
		
		hs.invalidate();
		model.addAttribute("logoutMsg", "로그아웃 되었습니다");		
		return ViewRef.ORIGIN_TEMP;
	}
	
	
	//	로그인 (login)
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Model model, HttpServletRequest request) {
		
		/*
		 * 	인터셉터로 걸러주니까 로그인 alert창 안띄워짐 login.get 메소드에 직접 url 걸러줌
		 */
		
		UserVO param = SecurityUtils.getLoginUser(request);
		
		if(param != null) {	
			model.addAttribute("isLogin","로그인이 되어있는상태에서는 로그인페이지로 갈수없습니다");
			return ViewRef.ORIGIN_TEMP;
		}
		
		model.addAttribute("view",ViewRef.USER_LOGIN);
		return ViewRef.MENU_TEMP;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(Model model, UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		
		int result = service.login(param);
		
		if(result == Const.SUCCESS) { // 로그인성공 
			hs.setAttribute(Const.LOGIN_USER, param);
			return "redirect:/" + ViewRef.INDEX_MAIN;
		}
		
		String msg = null;
		if (result == Const.NO_ID) {
			msg = "아이디를 확인해 주세요";
		} else if (result == Const.NO_PW) {
			msg = "비밀번호를 확인해 주세요";
		}
		
		ra.addFlashAttribute("data", msg);
		ra.addFlashAttribute("user_id", param.getUser_id());
		return "redirect:/" + ViewRef.USER_LOGIN;
	}
	
		
	//	회원가입 (join)
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join(Model model, RedirectAttributes ra) {
		int uNumCode = (int)(Math.random() * 88888888 + 10000000); // 고유번호 8자리 랜덤으로 지정
		model.addAttribute("uNumCode",uNumCode);
		model.addAttribute("joinErrMsg"); // 서버에러시 띄우는 alert창 (지워도됨 POST에서 addFlash로 값을 보냈기에 바로 jsp까지 직통으로감)
		model.addAttribute("view",ViewRef.USER_JOIN);
		
		return ViewRef.MENU_TEMP;
	}	

	@RequestMapping(value="/join", method = RequestMethod.POST) 
	public String join(Model model, UserVO param, HttpSession hs, RedirectAttributes ra) {
		int result = 0;
		
		try {
			result = service.joinUser(param);	// 빈값 넘어오면 DB에러뜨니까
		} catch (Exception e) {
			e.printStackTrace(); // 에러시 조치하기 위해 찍어놓음
			ra.addFlashAttribute("joinErrMsg","서버에러! 회원가입을 다시 시도해 주세요");
			return "redirect:/" + ViewRef.USER_JOIN;
		}
		
		if(result == Const.SUCCESS) {
			return "redirect:/" + ViewRef.USER_LOGIN;

		} else { 
			ra.addFlashAttribute("joinErrMsg","서버에러! 회원가입을 다시 시도해 주세요");
			return "redirect:/" + ViewRef.USER_JOIN;
		}
	}
	
	
	//	비밀번호 찾기1-1 (아이디, 이메일 검사) (findPw)
	@RequestMapping(value="/findPw", method = RequestMethod.GET)
	public String findPw(Model model, HttpServletRequest request) {
		model.addAttribute("view",ViewRef.USER_FINDPW);		
		model.addAttribute("user_id");
		model.addAttribute("Email");		
		model.addAttribute("findPwMsg");
		
		return ViewRef.MENU_TEMP;
	}
	
	@RequestMapping(value="/findPw", method = RequestMethod.POST)
	public String findPw(Model model, UserPARAM param, HttpSession hs, UserDMI dmi, RedirectAttributes ra) {
		int result = service.findPw(param, hs);
		int i_user = 0;  // 노란줄그여도 무시 ( 매개변수로 i_user 넣으니 제대로 파싱안됨 ) 
		
		try { // 만약 service에서 i_user에 세션값을 못박을경우
			i_user = (int)hs.getAttribute("i_user");
			
		} catch(Exception e) {
			result = Const.FAIL;
		}
		
		if(result == Const.SUCCESS) { // 정보가 '일치한다면'
			String authKey = mss.sendAutoMailFindPw(param.getEmail());	// 실제 이메일 보내는 메소드
			hs.setAttribute("authKey", authKey);
			return "redirect:/" + ViewRef.USER_CERCODE; 
			
		} else { // 정보가 '틀렸다면'			
			ra.addFlashAttribute("user_id", param.getUser_id());
			ra.addFlashAttribute("email", param.getEmail());
			model.addAttribute("view",ViewRef.USER_FINDPW);
			ra.addFlashAttribute("findPwMsg","입력하신 정보를 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_FINDPW;
		}
	}
	
	
	// 비번찾기 1-2 (이메일 인증코드 입력) (cerCode)
	@RequestMapping(value="/cerCode", method=RequestMethod.GET)
	public String modal(Model model, UserPARAM param, EmailVO vo) {
		cerCodeCount += 1; 
		
		model.addAttribute("view",ViewRef.USER_CERCODE);
		model.addAttribute("cerCodeCount");
		return ViewRef.ORIGIN_TEMP;
	}	

	@RequestMapping(value="/cerCode", method=RequestMethod.POST) // post 확인
	public String modal(Model model, EmailVO param, 
			HttpSession hs, RedirectAttributes ra) {
		
		String authKey = (String)hs.getAttribute("authKey");
		
		if(authKey.equals(param.getCerCode())) { 
			cerCodeCount = 0;
			return "redirect:/" + ViewRef.USER_CHANGEPW; 
			
		} else {
			ra.addFlashAttribute("cerCodeCount", cerCodeCount); 
			ra.addFlashAttribute("cerCodeMsg", "인증번호를 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_CERCODE;
		}
	}
	
	
	// 비밀번호 변경 (changePw)
	@RequestMapping(value="/changePw", method = RequestMethod.GET)
	public String changePw(Model model, UserPARAM param) {
		model.addAttribute("view", ViewRef.USER_CHANGEPW);
		model.addAttribute("changePwMsg");
		return ViewRef.MENU_TEMP; 
	}
	
	@RequestMapping(value="/changePw", method = RequestMethod.POST)
	public String changePw(Model model, UserPARAM param, 
			HttpSession hs, RedirectAttributes ra) {
		
		int i_user = (int)hs.getAttribute("i_user");
		param.setI_user(i_user);
		
		int result = service.changePw(param);
		
		if(result == Const.SUCCESS) {
			hs.removeAttribute("i_user"); 
			hs.removeAttribute("authKey");
			ra.addFlashAttribute("changePwMsg", "비밀번호가 변경되었습니다");
			return "redirect:/" + ViewRef.USER_CHANGEPW;
			
		} else {
			ra.addFlashAttribute("changePwMsg", "서버 문제가 발생되었습니다 잠시후 다시 시도해주세요 ");
			return "redirect:/" + ViewRef.USER_CHANGEPW; // DB에러시 (다시 비번찾기 창으로 돌려서 비번만 입력하게끔 만들기)
		}
	}
	
	
	// 아이디 찾기 (findId)
	@RequestMapping(value="/findId", method = RequestMethod.GET)
	public String findId(Model model) {
		model.addAttribute("view",ViewRef.USER_FINDID);
		return ViewRef.MENU_TEMP;
	}
	
	@RequestMapping(value="/findId", method = RequestMethod.POST)
	public String findId(UserPARAM param, HttpSession hs, RedirectAttributes ra) {
		UserDMI dbUser = new UserDMI();
		
		int result = service.findId(param, hs);
		
		if(result == Const.SUCCESS) {			
			dbUser.setUser_id((String)hs.getAttribute("user_id")); 
			mss.sendAutoMailFindId(param.getEmail(), dbUser.getUser_id());
			hs.removeAttribute("user_id"); // service에서 날아온 세션을 다사용했으니 세션삭제
			ra.addFlashAttribute("findIdSuccessMsg", "가입하신 이메일로 아이디가 전송되었습니다");
			return "redirect:/" + ViewRef.USER_FINDID;
			
		} else {
			ra.addFlashAttribute("findIdMsg", "가입하신 이메일을 다시 확인해 주세요");
			return "redirect:/" + ViewRef.USER_FINDID;
		}
	}
	
	
	// 마이페이지 (myPage)
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String myPage(UserPARAM param, Model model, HttpServletRequest request,
			HttpSession hs, BoardPARAM bparam, TapVO tparam) {
		
		hs.setAttribute("i_tap", CommonUtils.getIntParameter("i_tap", request));
		
		int i_user = CommonUtils.getIntParameter("i_user", request);
	
		if(i_user == 0) {
			bparam.setI_user(SecurityUtils.getLoginUserPk(hs));
		} else {
			bparam.setI_user(i_user);
		}
		
		int page = CommonUtils.getIntParameter("page", request);
		int cperPageNum = 0;
		int i_tap = CommonUtils.getIntParameter("i_tap", request);
		
		model.addAttribute("sellCnt", service.selSellCnt(param));
		
		if(i_tap == 1) {
			cperPageNum = 12;
			Paging.getPage(service.selSellCnt(param), bparam, page, cperPageNum, model, request, hs);			
			model.addAttribute("sellList", service.selSellList(bparam));
		} else if(i_tap == 2) {
			cperPageNum = 6;
			Paging.getPage(service.selReviewCnt(bparam), bparam, page, cperPageNum, model, request, hs);			
			model.addAttribute("reviewList", service.selReviewList(bparam));
		} else if(i_tap == 3) {
			
		} else if(i_tap == 4) {
			cperPageNum = 6;
			Paging.getPage(service.selMyCmtCnt(bparam), bparam, page, cperPageNum, model, request, hs);			
			model.addAttribute("myCmtList", service.selMyCmtList(bparam));
		} else if(i_tap == 5) {
			cperPageNum = 6;
			Paging.getPage(service.selMyReviewCnt(bparam), bparam, page, cperPageNum, model, request, hs);			
			model.addAttribute("myReviewList", service.selMyReviewList(bparam));
		}
		
		model.addAttribute("data", service.selUser(param));
		model.addAttribute("tapList", service.selTapList(tparam));
		model.addAttribute("view",ViewRef.USER_MYPAGE);
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/myPage", method = RequestMethod.POST)
	public String myPage(Model model, UserPARAM param) {
		
		
		model.addAttribute("view",ViewRef.USER_MYPAGE);
		return "redirect:/" + ViewRef.MENU_TEMP;
	}
	
	// MY리뷰 삭제
	@RequestMapping(value="/delMyReview", method = RequestMethod.GET)
	public String myPage(Model model, ReviewPARAM param, HttpSession hs, HttpServletRequest request) {
		
		// 세션에 있는 i_user 받아오기
		param.setI_user(SecurityUtils.getLoginUserPk(hs));
		param.setI_review(CommonUtils.getIntParameter("i_review", request));
	
		service.delMyReview(param);
		
		return "redirect:/user/myPage?i_user=" + SecurityUtils.getLoginUserPk(hs) + "&i_tap=5";
	}
		
	// 개인정보변경 (info)
	@RequestMapping(value="/info", method = RequestMethod.GET)
	public String info(Model model, UserPARAM param, HttpSession hs) {
		
		try {			
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			
		} catch (Exception e) {
			model.addAttribute("loginMsg", "로그인을 해주세요");
			return ViewRef.ORIGIN_TEMP;
		}
		
		// ★에러뜰경우 카테고리 테이블 만들었는지 확인 
		
		model.addAttribute("imgErr");
		model.addAttribute("categoryList", service.selCategory());
		model.addAttribute("view", ViewRef.USER_INFO);
		
		return ViewRef.MENU_TEMP;
					
	}


	@RequestMapping(value="/imgDel", method = RequestMethod.POST)
	public String imgDel(UserPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		int result = 0;
		
		String dbUserImg = ((UserVO)hs.getAttribute(Const.LOGIN_USER)).getProfile_img();
		String path = hs.getServletContext().getRealPath("") +  "resources/img/profile_img/user/" + i_user + "/" + dbUserImg;
		
		System.out.println("사진명 : " + dbUserImg);
		System.out.println("경로 : " + path);
		
		File file = new File(path);
		if(file.exists()) {
			result = service.delUserProfileImg(i_user);
			file.delete();
			UserPARAM param2 = ((UserPARAM)hs.getAttribute(Const.LOGIN_USER));
			param2.setProfile_img(null);
			hs.removeAttribute(Const.LOGIN_USER);
			hs.setAttribute(Const.LOGIN_USER, param2);
			return "redirect:/user/info";
		}
		return "redirect:/" +  ViewRef.USER_INFO;		
	}	
	
	
	// 프로필 사진 등록 / 수정  (mReq를 info.post에 넣으니 에러뜸) (코드 수정해야됨)
	@RequestMapping(value="/imgUpload", method = RequestMethod.POST)
	public String imgUpload(Model model, UserVO vo, UserPARAM param, HttpServletRequest request,
			HttpSession hs, RedirectAttributes ra, MultipartHttpServletRequest mReq) {
		
		try {
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			System.out.println("5");
			System.out.println("멀티파트쳌 : " + mReq);
			String dbUser = ((UserVO)hs.getAttribute(Const.LOGIN_USER)).getProfile_img();
			
			System.out.println("dbUser : " + dbUser);
			vo.setProfile_img(dbUser);
			
			String fileNm = service.insUserProfileImg(mReq, vo);
			UserPARAM param2 = ((UserPARAM)hs.getAttribute(Const.LOGIN_USER));
			param2.setProfile_img(fileNm);
			hs.removeAttribute(Const.LOGIN_USER);
			hs.setAttribute(Const.LOGIN_USER, param2);
			
		} catch(Exception e) {
			ra.addFlashAttribute("imgErr","프로필사진을 새로 등록해 주세요");
			return "redirect:/" +  ViewRef.USER_INFO;
		}
		
		return "redirect:/" + ViewRef.USER_INFO;
	}
	
	// 사진 외 개인정보 수정
	@RequestMapping(value="/info", method = RequestMethod.POST)
	public String info(Model model, UserVO vo, UserPARAM param,
			HttpServletRequest request,	HttpSession hs, RedirectAttributes ra) {
		
		int i_user = SecurityUtils.getLoginUserPk(hs); // 유저pk값을 받아와 mapper에서  where절에 pk값을 넣음
		param.setI_user(i_user);
		
				
		int result = Integer.parseInt(request.getParameter("result"));
		System.out.println("result 값 : " + result);
		
		/*
		 *	 3 비번변경  4 닉넴변경  5 주소변경  6 이메일 변경  7 관심사 변경  
		 */
		
		int chk = 0;
		switch(result) {
			case 3: case 4:	case 5: case 6:
				chk = service.changeInfo(param, result); break;
			
			case 7: 
				try { // 만약 3개값 다 못받아올경우 에러방지
					/*String categoryList[] = request.getParameterValues("categoryLike");
					param.setFavI_cg_1(categoryList[0]);
					param.setFavI_cg_2(categoryList[1]);
					param.setFavI_cg_3(categoryList[2]);*/
					
					String categoryList = request.getParameter("categoryLike");
					param.setFavI_cg_1(categoryList);
					chk = service.changeCategory(param);
					ra.addFlashAttribute("categoryMsg", "관심사가 수정되었습니다");
					return "redirect:/" + ViewRef.USER_INFO;
					
				} catch(Exception e) {
					chk = 7; // 관심사 에러띄울 값
				} 
		}
		
		if(chk == 0) { // 메소드 실행안됬을 경우
			ra.addFlashAttribute("serverErr", "서버에러! 다시 시도해 주세요");
			return "redirect:/" + ViewRef.USER_INFO;
			
		} else if(chk == 7) { // 관심사 선택에서 3개 미만 선택됬을 경우
			ra.addFlashAttribute("serverErr", "관심사는 총 3개를 선택해주세요");
			return "redirect:/" + ViewRef.USER_INFO;
		}
		
		return "redirect:/" + ViewRef.USER_INFO;
	}

	
	@RequestMapping(value="/ajaxToLike", method = RequestMethod.GET)
	@ResponseBody
	public int ajaxToLike(UserPARAM param, HttpSession hs) {
		
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setI_user(i_user);
		
		return service.ajaxToLike(param);
	}
	
	// 찜목록 리스트
	@RequestMapping(value="/likeList", method = RequestMethod.GET)
	public String likeList(BoardPARAM param, HttpSession hs, Model model) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setI_user(i_user);

		model.addAttribute("data", boardService.selLikeList(param));
		
		model.addAttribute("view",ViewRef.USER_LIKELIST);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// 찜목록 삭제
	@RequestMapping(value="/likeListDel", method = RequestMethod.GET)
	public String likeListDel(BoardPARAM param, HttpServletRequest request) {
		//System.out.println("param.getI_board():" + param.getI_board());
		//System.out.println("param.getI_user():" + param.getI_user());
		boardService.likeListDel(param);
		
		return "redirect:/user/likeList";
	}
	

}
