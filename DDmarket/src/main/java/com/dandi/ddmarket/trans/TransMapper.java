package com.dandi.ddmarket.trans;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtVO;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;

@Mapper
public interface TransMapper {

	// select
	List<TransDMI> selTrans(BoardPARAM param);	
	
	int chkTrans(BoardPARAM param);
	
	// insert
	int insTrans(TransVO vo);  // 구매요청 눌렀을시 해당 유저값 저장
	
	int insTransCmt(TransCmtVO vo); 	// 거래댓글 등록
	
	// delete
	int delTransUser(TransVO vo);	// 구매취소 눌렀을시 해당 유저값 삭제
}
