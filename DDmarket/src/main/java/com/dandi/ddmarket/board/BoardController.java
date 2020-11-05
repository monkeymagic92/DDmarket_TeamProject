package com.dandi.ddmarket.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.CmtCriteria;
import com.dandi.ddmarket.CmtPageMaker;
import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.Criteria;
import com.dandi.ddmarket.PageMaker;
import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.model.BoardDMI;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;
import com.dandi.ddmarket.cmt.CmtService;
import com.dandi.ddmarket.cmt.model.CmtVO;
import com.dandi.ddmarket.user.UserService;
import com.dandi.ddmarket.user.model.UserPARAM;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService service;		// 보드 서비스
	
	@Autowired
	private UserService userService;	// 유저 서비스
	
	@Autowired
	private CmtService cmtService;		// 댓글 서비스
	
	// 판매글 등록,수정
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
	
	
	// 판매글 등록/수정 
	@RequestMapping(value="/saleReg", method = RequestMethod.POST)
	public String saleReg(Model model, BoardPARAM param, HttpSession hs, 
			MultipartHttpServletRequest mReq, RedirectAttributes ra) {
		
		int saleResult = Integer.parseInt(mReq.getParameter("saleResult"));
		System.out.println("updResult = " + saleResult);
		if(saleResult == 1) { // 글등록
			try {
				int result = 0;
				// script, 욕 필터링
				String filterCtnt = swearWordFilter(mReq.getParameter("ctnt"));
				String filterCtnt2 = scriptFilter(filterCtnt);
				
				String filterTitle = swearWordFilter(mReq.getParameter("title"));
				String filterTitle2 = scriptFilter(filterTitle);
				
				param.setCtnt(filterCtnt2);
				param.setTitle(filterTitle2);
				
				result = service.insBoard(param, mReq, hs);
				System.out.println("result :" + result );
				
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
			
		} else { // 글 수정
			
			int i_board = Integer.parseInt(mReq.getParameter("i_board"));
			param.setI_board(i_board);
			hs.setAttribute("updI_board", i_board);
			String filterCtnt = swearWordFilter(mReq.getParameter("ctnt"));
			String filterCtnt2 = scriptFilter(filterCtnt);
			
			String filterTitle = swearWordFilter(mReq.getParameter("title"));
			String filterTitle2 = scriptFilter(filterTitle);
			
			param.setCtnt(filterCtnt2);
			param.setTitle(filterTitle2);
			
			
			int result = service.updBoard(param,mReq,hs);
			
			if(result == 1) {
				ra.addFlashAttribute("updMsg", "판매글이 수정되었습니다");
				return "redirect:/board/detail?i_board="+i_board;
				
			} else {
				return "redirect:/board/detail?i_board="+i_board;
			}
			
		}
	}
	
	//욕 필터
	private String swearWordFilter(final String ctnt) {
		String[] filters = CommonUtils.filter();
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
	
		
	
	// 판매글 상세페이지 (detail)
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String detail(Model model, BoardPARAM param, CmtVO vo, HttpServletRequest req,
			HttpServletRequest request, HttpSession hs) {
		
		service.addHit(param, req);
		
		int i_board = Integer.parseInt(request.getParameter("i_board"));
		hs.removeAttribute("i_board"); // service.insBoard에서 날라온 세션값
		param.setI_board(i_board);
			
		if(hs.getAttribute("loginUser") != null) {
			// 찜목록용 i_user
			int i_user = SecurityUtils.getLoginUserPk(hs);
			param.setI_user(i_user);
		}
		
		/////// 페이징 start
		CmtCriteria cri = new CmtCriteria();
		cri.setPage(CommonUtils.getIntParameter("cmtPage", request));
		hs.setAttribute("cmtPage", cri.getPage());
		CmtPageMaker cmtPageMaker = new CmtPageMaker();
		cmtPageMaker.setCmtCriteria(cri);
	    ///// 전체글 수 구하기
	    int cmtCount = cmtService.countCmt(param);
	    hs.setAttribute("cmtCount", cmtCount);
	    
	    cmtPageMaker.setTotalCount(cmtCount);
	    int pageStart = cri.getPageStart();
	    int perPageNum = cri.getPerPageNum();
	    param.setCmt_pageStart(pageStart);
	    param.setCmt_perPageNum(perPageNum);
	    model.addAttribute("cmtPageMaker", cmtPageMaker);
	    model.addAttribute("cmtPageNum", cmtPageMaker);
		////// 페이징 end
		
		
	
		model.addAttribute("cmtCount", cmtService.countCmt(param)); // 댓글 갯수
		model.addAttribute("cmtList", cmtService.selCmt(param));	// 댓글 내용
		model.addAttribute("data", service.selBoard(param));		// 판매글 내용
		model.addAttribute("view", "/board/detail");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.POST)
	public String detail(Model model, BoardPARAM param) {
			
		return ViewRef.DEFAULT_TEMP;
	}
	
	// 판매글 상세페이지 삭제
	@RequestMapping(value="/saleDel", method = RequestMethod.GET)
	public String saleDel(BoardPARAM param, HttpServletRequest request) {
	
		int i_board = Integer.parseInt(request.getParameter("i_board"));
		param.setI_board(i_board);
		System.out.println("삭제 i_board값 : " + i_board);
		
		int result = service.saleDel(param);
		System.out.println("글삭제 result:" + result);
		//result = 0;  에러테스트용
		
		if(result == 1) {
			String path = "/resources/img/board/" + i_board;
			String realPath =  request.getServletContext().getRealPath(path);
			System.out.println("파일 경로realPath:" + realPath);
			File file = new File(realPath);
			
			if(file.exists()) {
				if(file.isDirectory()) {
					File[] files = file.listFiles();
					for(int i=0;  i<files.length;  i++) {
						if(files[i].delete()) {
							System.out.println(files[i].getName()+"폴더 안의 파일 삭제 성공");
						} else {
							System.out.println(files[i].getName()+"폴더 안의 파일 삭제 실패");
						}
					}
				}
			
				if(file.delete()) {
					System.out.println("파일 삭제 성공");
				} else {
					System.out.println("파일 삭제 실패");
				}	
			}
			
		}
		
		return "redirect:/index/main";
			
	}
		
}

