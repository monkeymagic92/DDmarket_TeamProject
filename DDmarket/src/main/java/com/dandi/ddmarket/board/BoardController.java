package com.dandi.ddmarket.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dandi.ddmarket.ViewRef;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/detail")
	public String detail(Model model) {
		
		model.addAttribute("view", "/board/detail");		
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	@RequestMapping(value="/saleReg")
	public String likeList(Model model) {
		
		model.addAttribute("view", "/board/saleReg");		
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
