package com.dandi.ddmarket.trans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtDMI;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;

@Service
public class TransService {

	@Autowired
	private TransMapper mapper;
	
	// 가격요청 눌렀을시 n번유저 저장
	public int insTrans(TransDMI vo) {
		int i_room = mapper.insTrans(vo);
		return i_room;
	}
	
	
	// 해당 유저의 해당 판매글에 박힌 chk값 반환
	public int chkTrans(BoardPARAM param) {
		int chk = 0;
		try {
			mapper.chkTrans(param);
			chk = 1;
			
		} catch(Exception e) {
			chk = 0;
		}
		
		return chk;
	}
	
	
	// 판매글의 n번 유저 값 출력
	public List<TransDMI> selTrans(BoardPARAM param) {
		return mapper.selTrans(param);
	}
	
	
	// 거래취소 
	public int delTransUser(TransVO vo) {
		return mapper.delTransUser(vo);
	}
	
	
	// i_trans 값 반환 (채팅방 pk값 이용하려고)
	public int intI_trans(TransDMI vo) {
		
		int i_trans = mapper.intI_trans(vo);
		return i_trans;
	}
	
	
	// 채팅글 등록
	public int insTransCmt(TransCmtDMI vo) {
		return mapper.insTransCmt(vo);
	}
	
	// 채팅글 뿌리기
	public List<TransCmtDMI> selTransCmt(TransCmtDMI vo) {
		return mapper.selTransCmt(vo);
	}
	
	
	// 판매자가 거래완료 눌렀을시 원하는값 넣음
	public int insBuyList(BoardPARAM param) {
		return mapper.insBuyList(param);
	}
	
	// 판매자가 거래완료 눌렀을시 t_board 에 sold 값 1로 올려줌
	public int updSold(BoardPARAM param) {
		return mapper.updSold(param);
	}
	
	
}
