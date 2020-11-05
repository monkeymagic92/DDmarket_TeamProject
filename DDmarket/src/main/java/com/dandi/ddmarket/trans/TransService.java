package com.dandi.ddmarket.trans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;
import com.dandi.ddmarket.user.model.UserPARAM;

@Service
public class TransService {

	@Autowired
	private TransMapper mapper;
	
	// 가격요청 눌렀을시 n번유저 저장
	public int insTrans(TransVO vo) {
		int result = mapper.insTrans(vo);
		return result;
	}
	
	public int chkTrans(BoardPARAM param, int i_user) {
		int chk = mapper.chkTrans(param, i_user);
		return chk;
	}
	
	
	// 그 해당글의 n번 유저 값 출력
	public List<TransDMI> selTrans(BoardPARAM param) {
		return mapper.selTrans(param);
	}
	
}
