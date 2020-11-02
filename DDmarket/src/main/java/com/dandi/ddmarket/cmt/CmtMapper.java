package com.dandi.ddmarket.cmt;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.cmt.model.CmtVO;

@Mapper
public interface CmtMapper {

	// select
	List<CmtVO> selCmt();	// 댓글 나타내기
	
	int cmtCount();			// 댓글 갯수
	
	// insert
	int insCmt(CmtVO vo);
	
	
	// update
	int updCmt(CmtVO vo); 	// 댓글 수정
	
	// delete
	int delCmt(CmtVO vo);	// 댓글 삭제
	
	
}
