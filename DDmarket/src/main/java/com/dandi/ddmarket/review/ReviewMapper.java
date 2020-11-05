package com.dandi.ddmarket.review;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.review.model.ReviewPARAM;

@Mapper
public interface ReviewMapper {
	int insReview(ReviewPARAM param);
}
