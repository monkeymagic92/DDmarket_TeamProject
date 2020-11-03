package com.dandi.ddmarket.cmt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.cmt.model.CmtDMI;
import com.dandi.ddmarket.cmt.model.CmtVO;

@Service
public class CmtService {
	
	@Autowired
	private CmtMapper mapper;
	
		
	// 댓글 등록
	public int insCmt(CmtVO vo) {
        return mapper.insCmt(vo);
    }
	
	
	// 댓글 뿌리기
	public List<CmtDMI> selCmt(BoardPARAM param) {
		return mapper.selCmt(param);
	}
	
	
	// 댓글 삭제
	public int delCmt(CmtVO vo) {
		return mapper.delCmt(vo);
	}
	
	
	// 댓글 갯수
	public int countCmt(BoardPARAM param) {
		int countCmt = mapper.cmtCount(param);
		return countCmt;
	}
	
	
	// 댓글 수정
	public int updCmt(CmtVO vo) {
		return mapper.updCmt(vo);
	}
}
