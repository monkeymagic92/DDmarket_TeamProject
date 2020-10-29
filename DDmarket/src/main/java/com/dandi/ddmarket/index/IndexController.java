package com.dandi.ddmarket.index;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
	public String index(Model model, RedirectAttributes ra, BoardPARAM param,CategoryVO cparam,HttpServletRequest request) {

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

		model.addAttribute("cgList", service.selCgList(cparam));
		model.addAttribute("newBoardList", service.selNewBoardList(param));
		model.addAttribute("freeBoardList", service.selFreeBoardList(param));
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	// 서치
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(Model model, RedirectAttributes ra, BoardPARAM param, CategoryVO cparam, HttpServletRequest request) {
		
		// header에 카테고리 불러옴 
		model.addAttribute("cgList", service.selCgList(cparam));
		
		// header에서 카테고리 선택 시 i_cg 값을 받는다.
		if(request.getParameter("i_cg") != null) {
			int i_cg = CommonUtils.getIntParameter("i_cg", request);
			param.setI_cg(i_cg);
			model.addAttribute("cdSearchNm", service.selCdSearchNm(param));
			System.out.println("i_cg : " + param.getI_cg());
		}
				
		model.addAttribute("searchList", service.selSearchList(param));
		model.addAttribute("view","/index/search");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String search(Model model, RedirectAttributes ra, BoardPARAM param, HttpServletRequest request) {
		String searchNm = request.getParameter("searchNm");
		
				
		model.addAttribute("searchList", service.selSearchList(param));
		model.addAttribute("view","/index/search");
		return ViewRef.DEFAULT_TEMP;
	}
	
		
	// 각종 메시지 받아서 처리할 alert창 페이지
	@RequestMapping(value="/origin", method = RequestMethod.GET)
	public String origin(Model model, RedirectAttributes ra) {
		
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}	
}