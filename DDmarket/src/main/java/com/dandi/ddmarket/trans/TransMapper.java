package com.dandi.ddmarket.trans;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;
import com.dandi.ddmarket.user.model.UserPARAM;

@Mapper
public interface TransMapper {

	// select
	List<TransDMI> selTrans(BoardPARAM param);	
	
	int chkTrans(BoardPARAM param, int i_user);
	
	// insert
	int insTrans(TransVO vo);  // 구매요청 눌렀을시 해당 유저값 저장
	
	
}
