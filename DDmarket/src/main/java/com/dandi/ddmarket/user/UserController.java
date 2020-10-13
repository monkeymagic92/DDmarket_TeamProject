package com.dandi.ddmarket.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dandi.ddmarket.ViewRef;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
	//테스트
	@RequestMapping(value="/login")
	public String login(Model model) {
		model.addAttribute("view","/user/login");
		return ViewRef.MENUTEMP;
	}
	
	@RequestMapping(value="/join")
	public String joinin(Model model) {
		model.addAttribute("view","/user/join");
		return ViewRef.MENUTEMP;
	}
	
}
