package com.dandi.ddmarket.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.review.model.ReviewPARAM;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewMapper mapper;
	
	// 리뷰 작성	
	public int insReview(ReviewPARAM param) {
		return mapper.insReview(param);
	}
	
	//작정한 리뷰 보여주기
	public List<ReviewPARAM> selReview(ReviewPARAM param){
		return mapper.selReview(param);
	}
	
	// 리뷰 글 별점 width 구하는 메소드
	public static List<ReviewPARAM> transRating(List<ReviewPARAM> param) {
		for(ReviewPARAM vo : param) {
			double star = vo.getRating() / 5 * 75;
			vo.setStar(star);
		}
		return param;
	}
}
