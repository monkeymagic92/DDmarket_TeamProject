package com.dandi.ddmarket.index;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;
import com.dandi.ddmarket.category.model.CategoryVO;

@Mapper
public interface IndexMapper {
	List<CategoryVO> selCgList(CategoryVO cparam);

	List<BoardVO> selHotBoardList(BoardPARAM param);
	List<BoardVO> selRecBoardList(BoardPARAM param);
	List<BoardVO> selNewBoardList(BoardPARAM param);
	List<BoardVO> selCgBoardList(BoardPARAM param);
	List<BoardVO> selFreeBoardList(BoardPARAM param);
	
	List<BoardVO> selSearchList(BoardPARAM param);
	String selCdSearchNm(BoardPARAM param);

}