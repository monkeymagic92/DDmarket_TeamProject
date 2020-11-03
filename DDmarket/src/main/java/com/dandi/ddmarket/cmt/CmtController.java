package com.dandi.ddmarket.cmt;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	/*				보드웹4 댓글 등록/수정 컨트롤러 부분 (아작스x)
	//댓글 (등록/수정)
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String strI_cmt = request.getParameter("i_cmt");
			String strI_board = request.getParameter("i_board");
			String cmt = request.getParameter("cmt");
			
			int i_board = MyUtils.parseStrToInt(strI_board);
			
			UserVO loginUser = MyUtils.getLoginUser(request);
			
			BoardCmtVO param = new BoardCmtVO();
			param.setCmt(cmt);
			param.setI_user(loginUser.getI_user());
			
			switch(strI_cmt) {
			case "0": //등록
				param.setI_board(i_board);
				BoardCmtDAO.insCmt(param);
				
				break;
			default: //수정 (수정 일자 변경)
				int i_cmt = MyUtils.parseStrToInt(strI_cmt);
				param.setI_cmt(i_cmt);
				
				BoardCmtDAO.updCmt(param);
				
				break;
			}
			
			response.sendRedirect("/board/detail?i_board="+strI_board);
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
    private String cmtUpdate(CmtVO vo, HttpServletRequest request){
		
		System.out.println("1 : " + vo.getI_cmt());
		System.out.println("2 : " + vo.getCtnt());
		
		int result = service.updCmt(vo);
		return String.valueOf(result);

	}
	
	

}

