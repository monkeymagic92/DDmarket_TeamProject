package com.dandi.ddmarket.index;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dandi.ddmarket.ViewRef;

@Controller
@RequestMapping("/index")
public class IndexController {

	@RequestMapping(value="/main")
	public String index(Model model) {
		model.addAttribute("view",ViewRef.INDEX_INDEX);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
