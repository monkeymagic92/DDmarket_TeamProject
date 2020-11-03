package com.dandi.ddmarket.cmt;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dandi.ddmarket.cmt.model.CmtVO;
import com.dandi.ddmarket.user.model.UserPARAM;

@Controller
@RequestMapping("/cmt")
public class CmtController {
	
	@Autowired
	private CmtService service;	
	
	// 댓글 등록
	@RequestMapping(value="/insert", method=RequestMethod.POST) 
    @ResponseBody
    private String cmtInsert(@RequestBody CmtVO vo, HttpSession hs){
		
		int result = 0;
		
				
		if(vo.getCtnt() == null || vo.getCtnt().equals("")) {
			result = 2;
			
		} else if(hs.getAttribute("loginUser") == null) {
			result = 3;
			
		} else {
			result = service.insCmt(vo);
		}
		return String.valueOf(result);
    }

	/*
	// 댓글 뿌리기
	@RequestMapping(value="/select", produces="application/json; charset=UTF-8") 
    @ResponseBody
    private List<CmtVO> cmtSelect(@RequestBody CmtVO vo, Model model){
		return service.selCmt(vo);
	}
	*/
	
	
	// 댓글 삭제
	@RequestMapping(value="/delete", method=RequestMethod.POST) 
    @ResponseBody
    private String cmtDelete(@RequestBody CmtVO vo, HttpSession hs){
		
		int result = service.delCmt(vo);
		UserPARAM param = (UserPARAM)hs.getAttribute("loginUser");
		
		if(hs.getAttribute("loginUser") == null) {
			result = 2;
			
		} 
		return String.valueOf(result);
    }
	
	// 댓글 수정
	@RequestMapping(value="/update", method=RequestMethod.POST) 
    @ResponseBody
    private String cmtUpdate(@RequestBody CmtVO vo){
		
		int result = service.updCmt(vo);		
		return String.valueOf(result);
	}
	
	

}

