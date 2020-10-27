package com.dandi.ddmarket.index;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Mapper
public interface IndexMapper {
	List<BoardVO> selHotBoardList(BoardPARAM param);
	List<BoardVO> selRecBoardList(BoardPARAM param);
	List<BoardVO> selNewBoardList(BoardPARAM param);
}
