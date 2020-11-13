package com.dandi.ddmarket.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.review.model.ReviewPARAM;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping(value = "/regReview", method = RequestMethod.POST)
	public String regReview(Model model, ReviewPARAM param, HttpServletRequest request) {
		System.out.println("??");
		
		
		int i_user = CommonUtils.getIntParameter("i_user", request);
		double rating = CommonUtils.getDoubleParameter("rating", request);
		param.setI_user(i_user);
		param.setRating(rating);
		System.out.println("별점 :" + param.getRating());
		System.out.println("ctnt : " + param.getCtnt());
		System.out.println("i_user:"+param.getI_user());
		service.insReview(param);
		
		model.addAttribute("view",ViewRef.USER_MYPAGE);
		return ViewRef.DEFAULT_TEMP;
	}
	
}
