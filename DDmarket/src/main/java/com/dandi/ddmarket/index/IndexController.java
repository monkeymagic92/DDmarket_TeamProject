package com.dandi.ddmarket.index;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.SecurityUtils;

import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;
import com.dandi.ddmarket.category.model.CategoryVO;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private IndexService service;	


	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String index(Model model, RedirectAttributes ra, BoardPARAM param,CategoryVO cparam,HttpServletRequest request,HttpSession hs) {
		
		// header 검색값 세션에서  제거
		hs.removeAttribute("searchNm");
		hs.removeAttribute("pSearch_1");
		hs.removeAttribute("pSearch_2");
		
		// 카테고리 리스트 세션에 저장 (많은 곳에서 쓰이기때문)
		hs.setAttribute("cgList", service.selCgList(cparam));
		
		// 비로그인 - 인기글 목록, 로그인 - 추천글 목록
		if(SecurityUtils.isLogout(request)) {
			model.addAttribute("hotBoardList", service.selHotBoardList(param));			
		} else {
			param.setI_user(SecurityUtils.getLoginUserPk(request));
			model.addAttribute("recBoardList", service.selRecBoardList(param));			
		}

		List<List<BoardVO>> cList = new ArrayList();

		//카테고리별 글 목록
		for(int i=1; i<=10; i++) {
			param.setI_cg(i);
			cList.add(service.selCgBoardList(param));
			model.addAttribute("cList", cList);
		}

		model.addAttribute("newBoardList", service.selNewBoardList(param));
		model.addAttribute("freeBoardList", service.selFreeBoardList(param));
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// 서치
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(Model model, RedirectAttributes ra, BoardPARAM param, CategoryVO cparam, HttpServletRequest request, HttpSession hs) {
		
		// header에 카테고리 불러옴 
		//model.addAttribute("cgList", service.selCgList(cparam));
	
		
		// header에서 카테고리 선택 시 i_cg 값을 받는다.
		int i_cg = CommonUtils.getIntParameter("i_cg", request);
		param.setI_cg(i_cg);
		model.addAttribute("i_cg", i_cg);
		model.addAttribute("cdSearchNm", service.selCdSearchNm(param));
		
		//post에서 검색값을 받아온 후 param에 넣어줌
		String pSearch_1 = (String) hs.getAttribute("pSearch_1");
		String pSearch_2 = (String) hs.getAttribute("pSearch_2");
		param.setSearchNm_1(pSearch_1);
		param.setSearchNm_2(pSearch_2);
		System.out.println("pSearch_1:" + pSearch_1);
		System.out.println("pSearch_2:" + pSearch_2);
		
		//테스트
		System.out.println("i_cg : " + param.getI_cg());
		System.out.println("searchType : " + param.getSearchType());
		System.out.println("searchNm : " + hs.getAttribute("searchNm"));
		System.out.println("cdSearchNm : " + service.selCdSearchNm(param));
		
		model.addAttribute("searchList", service.selSearchList(param));
		model.addAttribute("view","/index/search");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String search(Model model, RedirectAttributes ra, BoardPARAM param, HttpServletRequest request, HttpSession hs) {
		
		//검색값을 받아 searchNm세션에 저장 - 검색어 유지용
		hs.setAttribute("searchNm", request.getParameter("searchNm"));
		
		// 기존에 있었던 검색어 세션에서 제거
		hs.removeAttribute("pSearch_1");
		hs.removeAttribute("pSearch_2");
		
		
		if(request.getParameter("searchNm").contains(" ")) {
			String[] strArr = CommonUtils.getSearchNm(request.getParameter("searchNm"));
			String pSearch_1 = "%" + strArr[0] + "%";
			hs.setAttribute("pSearch_1", pSearch_1);
			String pSearch_2 = "%" + strArr[1] + "%";		
			hs.setAttribute("pSearch_2", pSearch_2);
			System.out.println("strArr : " + strArr[0] + "/" + strArr[1]);
			System.out.println("공백 포함");
		} else {
			System.out.println("공백 미포함");
			// 검색값을 받아 SQL문 찾기용 으로 바꿔준 후 세션에 저장
			String pSearch_1 = "%" + request.getParameter("searchNm") + "%";
			hs.setAttribute("pSearch_1", pSearch_1);
		}
		
				
		return "redirect:/" + ViewRef.INDEX_SEARCH;
	}
	
		
	// 각종 메시지 받아서 처리할 alert창 페이지
	@RequestMapping(value="/origin", method = RequestMethod.GET)
	public String origin(Model model, RedirectAttributes ra) {
		
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}	
}