package com.dandi.ddmarket.index;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.TimeMaximum;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private IndexService service;	

	// 메인페이지
	@RequestMapping(value="/main")
	public String index(Model model, RedirectAttributes ra, BoardPARAM param, HttpServletRequest request) {
		
		if(SecurityUtils.isLogout(request)) {
			model.addAttribute("hotBoardList", service.selHotBoardList(param));			
		} else {
			param.setI_user(SecurityUtils.getLoginUserPk(request));
			model.addAttribute("recBoardList", service.selRecBoardList(param));			
		}
		
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	// 서치
	@RequestMapping(value="/search")
	public String search(Model model, RedirectAttributes ra) {
		
		model.addAttribute("view","/index/search");
		return ViewRef.DEFAULT_TEMP;
	}
	
	
	
	// 각종 메시지 받아서 처리할 alert창 페이지
	@RequestMapping(value="/oringin")
	public String origin(Model model, RedirectAttributes ra) {
		
		model.addAttribute("view",ViewRef.INDEX_MAIN);
		return ViewRef.DEFAULT_TEMP;
	}
}
