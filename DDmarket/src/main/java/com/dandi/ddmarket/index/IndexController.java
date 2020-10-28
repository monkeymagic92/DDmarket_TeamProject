package com.dandi.ddmarket.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.ViewRef;

@Controller
@RequestMapping("/index")
public class IndexController {

	// 메인페이지
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String index(Model model, RedirectAttributes ra) {
		
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
