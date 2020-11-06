package com.dandi.ddmarket.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.review.model.ReviewPARAM;

@Mapper
public interface ReviewMapper {
	int insReview(ReviewPARAM param);
	List<ReviewPARAM> selReview(BoardPARAM param);
}
