package com.dandi.ddmarket.board;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardDMI;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Mapper
public interface BoardMapper {

	// select
	int maxI_board(); 					  // 판매글 등록시 최대 i_board값 추가하기 (실제 로컬에서 주소지정할때 사용) 
	
	BoardDMI selBoard(BoardPARAM param);  // 디테일 목록 뿌리기
	
	
	// insert
	int insBoard(BoardVO param);	 // 판매글 등록
	
	int updAddHit(BoardPARAM param); // 조회수 증가
	
	
	// update
	int updImage(BoardVO param); // 사진 등록
	
	int updBoard(BoardVO param); // 판매글 수정
	
	// delete
	int saleDel(BoardPARAM param);
	
}
