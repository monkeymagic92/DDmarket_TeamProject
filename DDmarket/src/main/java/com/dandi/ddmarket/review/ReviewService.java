package com.dandi.ddmarket.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.review.model.ReviewPARAM;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	public int insReview(ReviewPARAM param) {
		return mapper.insReview(param);
	}

}
