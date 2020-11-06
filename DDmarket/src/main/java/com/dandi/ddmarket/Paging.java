package com.dandi.ddmarket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.dandi.ddmarket.board.model.BoardPARAM;

public class Paging {
	
	public static void getPage(Model model, HttpServletRequest request, HttpSession hs, BoardPARAM bparam, int tc) {
		Criteria cri = new Criteria();
		cri.setPage(CommonUtils.getIntParameter("page", request));
		hs.setAttribute("page", cri.getPage());
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    int totalCount = tc;
	    hs.setAttribute("totalCount", totalCount);
	    pageMaker.setTotalCount(totalCount);
	    int pageStart = cri.getPageStart();
	    int perPageNum = cri.getPerPageNum();
	    bparam.setPageStart(pageStart);
	    bparam.setPerPageNum(perPageNum);
	    model.addAttribute("pageMaker", pageMaker);
	    model.addAttribute("pageNum", pageMaker);
	}
}
