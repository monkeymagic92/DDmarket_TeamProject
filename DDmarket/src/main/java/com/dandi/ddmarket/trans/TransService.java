package com.dandi.ddmarket.trans;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtDMI;
import com.dandi.ddmarket.trans.model.TransCmtVO;
import com.dandi.ddmarket.trans.model.TransDMI;
import com.dandi.ddmarket.trans.model.TransVO;

@Service
public class TransService {

	@Autowired
	private TransMapper mapper;
	
	// 가격요청 눌렀을시 n번유저 저장
	public int insTrans(TransVO vo) {
		int result = mapper.insTrans(vo);
		return result;
	}
	
	
	// 해당 유저의 해당 판매글에 박힌 chk값 반환
	public int chkTrans(BoardPARAM param) {
		int chk = 0;
		try {
			mapper.chkTrans(param); // 이부분 select 인데 insert로 해서 returning chk 해보기
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
	
	public int updSold(BoardPARAM param) {
		return mapper.updSold(param);
	}
	
	// 거래취소 
	public int delTransUser(TransVO vo) {
		return mapper.delTransUser(vo);
	}
	
	
	// 구매목록 댓글 등록
	public int insTransCmt(TransCmtDMI vo) {
		return mapper.insTransCmt(vo);
	}
	
	
	public List<TransCmtDMI> selTransCmt(TransCmtDMI param) {
		return mapper.selTransCmt(param);
	}
	
}
