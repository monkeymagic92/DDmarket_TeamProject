package com.dandi.ddmarket.trans;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtDMI;
import com.dandi.ddmarket.trans.model.TransCmtVO;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;

@Mapper
public interface TransMapper {

	// select
	List<TransDMI> selTrans(BoardPARAM param);	// 구매요청 누른 유저 리스트
	
	int chkTrans(BoardPARAM param);	// 구매요청하기 판별을 위한 chk값 반환
	
	int intI_trans(TransDMI vo); // i_trans값 반환
	
	List<TransCmtDMI> selTransCmt(TransCmtDMI vo);
	
	// insert
	int insTrans(TransDMI vo);  // 구매요청 눌렀을시 해당 유저값 저장

	int updSold(BoardPARAM param);
	
	int insTransCmt(TransCmtDMI vo);

	
	// update
	
	
	// delete
	int delTransUser(TransVO vo);	// 구매취소 눌렀을시 해당 유저값 삭제
}
