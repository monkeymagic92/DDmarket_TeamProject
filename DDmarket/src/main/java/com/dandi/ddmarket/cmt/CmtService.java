package com.dandi.ddmarket.cmt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.cmt.model.CmtVO;

@Service
public class CmtService {
	
	@Autowired
	private CmtMapper mapper;
	
	// 댓글 등록
	public int insCmt(CmtVO comment) {
        
        return mapper.insCmt(comment);
    }
}
