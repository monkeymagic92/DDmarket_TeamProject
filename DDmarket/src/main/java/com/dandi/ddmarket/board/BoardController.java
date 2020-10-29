package com.dandi.ddmarket.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.user.UserService;
import com.dandi.ddmarket.user.model.UserPARAM;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;		// 보드 서비스
	
	@Autowired
	private UserService userService;	// 유저 서비스
	/*
	 * 
	 *	 두번째 안되서 테스트 (재용) 
	 * 
	 */
	
	///이건 테스트 ///////////////////	
	///이건 테스트 ///////////////////	
	
	/*
	 * 
	 * 
	 * 		재용       오전11:46 4명 
	 * 
	 */
	
		
	// 판매글 등록
	@RequestMapping(value="/saleReg", method = RequestMethod.GET)
	public String saleReg(Model model, HttpSession hs, UserPARAM param,
			HttpServletRequest request, BoardPARAM boardPARAM) {
		
		try { // 비로그인 상태로 접근시 로그인페이지로		
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
			
		} catch (Exception e) {
			model.addAttribute("loginMsg", "로그인을 해주세요");
			return ViewRef.ORIGIN_TEMP;
		}
		
		try { // 디테일에서 수정버튼 눌렀을때 뜨는 부분 detail.jsp 에서 쿼리스트링으로 i_board값 보냄
			int i_board = Integer.parseInt(request.getParameter("i_board"));
			boardPARAM.setI_board(i_board);
			model.addAttribute("data", service.selBoard(boardPARAM));
			model.addAttribute("categoryList", userService.selCategory());
			model.addAttribute("view", ViewRef.BOARD_SALEREG);
			return ViewRef.DEFAULT_TEMP;
			
		} catch(Exception e) { // 글쓰기 눌렀을때 뜨는 부분 (받는값 없이 그냥 글쓰기 페이지 띄움)
			model.addAttribute("categoryList", userService.selCategory());
			model.addAttribute("view", ViewRef.BOARD_SALEREG);
			return ViewRef.DEFAULT_TEMP;
		}
	}
	
	
	@RequestMapping(value="/saleReg", method = RequestMethod.POST)
	public String saleReg(Model model, BoardPARAM param, HttpSession hs, 
			MultipartHttpServletRequest mReq, RedirectAttributes ra) {
		try {
			int result = 0;
			result = service.insBoard(param, mReq, hs);
			
			if(result == 1) {
				// DETAIL.GET 에서 index/main, mypage, SalaReg 모두다 request.getParameter()로 받게하기위해
				int i_board = (int)hs.getAttribute("i_board");
				ra.addAttribute("i_board",i_board);
				return "redirect:/" + ViewRef.BOARD_DETAIL;
				
			} else if(result == 2){
				ra.addFlashAttribute("ImageFail","입력되지 않은 항목 이 있습니다");
				return "redirect:/" + ViewRef.BOARD_SALEREG;
				
			} else {
				ra.addFlashAttribute("ImageFail","사진은 총 5장까지 등록이 가능합니다");
				return "redirect:/" + ViewRef.BOARD_SALEREG;
			}
			
		} catch(Exception e) {
			ra.addFlashAttribute("serverErr","서버에러 다시 시도해주세요");
			return "redirect:/" + ViewRef.BOARD_SALEREG;
		}
	}
		
	
	// 판매글 상세페이지 (detail)
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detail(Model model, BoardPARAM param, HttpServletRequest req,
			HttpServletRequest request, HttpSession hs) {
		
		service.addHit(param, req);
		
		int i_board = Integer.parseInt(request.getParameter("i_board"));
		hs.removeAttribute("i_board"); // service.insBoard에서 날라온 세션값
		param.setI_board(i_board);
		
		model.addAttribute("data", service.selBoard(param));
		model.addAttribute("view", "/board/detail");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	public String detail(Model model, BoardPARAM param) {
		
	
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	//욕 필터
	private String swearWordFilter(final String ctnt) {
		String[] filters = {"개새끼", "미친년", "ㄱ ㅐ ㅅ ㅐ ㄲ ㅣ", "씨발년"};
		String result = ctnt;
		for(int i=0; i<filters.length; i++) {
			result = result.replace(filters[i], "***");
		}
		return result;
	}
	
	//스크립트 필터
	private String scriptFilter(final String ctnt) {
		String[] filters = {"<script>", "</script>"};
		String[] filterReplaces = {"&lt;script&gt;", "&lt;/script&gt;"};
		
		String result = ctnt;
		for(int i=0; i<filters.length; i++) {
			result = result.replace(filters[i], filterReplaces[i]);
		}
		return result;
	}
}

