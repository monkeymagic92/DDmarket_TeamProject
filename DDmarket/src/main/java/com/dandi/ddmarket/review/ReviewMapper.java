package com.dandi.ddmarket.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.review.model.ReviewPARAM;
import com.dandi.ddmarket.review.model.ReviewVO;

@Mapper
public interface ReviewMapper {
	int insReview(ReviewVO param);
	List<ReviewPARAM> selReview(ReviewPARAM param);
}
