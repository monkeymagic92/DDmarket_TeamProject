package com.dandi.ddmarket.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(Model model) {
		model.addAttribute("hello","테스트");
		return "/user/test";
	}
}
