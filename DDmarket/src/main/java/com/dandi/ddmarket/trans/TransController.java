package com.dandi.ddmarket.trans;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtDMI;
import com.dandi.ddmarket.trans.model.TransDMI;

@Controller
@RequestMapping("/trans")
public class TransController {
	// 지금내거@!@#@#@#
	
	
	@Autowired
	private TransService service;
	
	
	// 거래 요청 처리 
	@RequestMapping(value="/transRequest", method = RequestMethod.POST)
	public String transRequest(TransDMI vo, BoardPARAM param,
			RedirectAttributes ra) {
		int result = 0;
		int i_trans = 0;
		int chk = service.chkTrans(param);
		
		
	    if(chk == 0) { // 구매요청 	
	    	result = service.insTrans(vo);
	    	i_trans = service.intI_trans(vo);
	    	System.out.println("i_trans : " + i_trans);
	    	
			
			
	    } else { // 구매취소
	    	result = service.delTransUser(vo);
	    }
	    
	    if(result != 1) {
    		ra.addFlashAttribute("transErr", "서버오류가 발생하였습니다 새로고침후 다시 시도해 주세요");
    	}
	    
		return "redirect:/board/detail?i_board="+param.getI_board();
	}
	

	@RequestMapping(value = "/sold")
	public String sold(Model model, BoardPARAM param) {
		
		int i_board = CommonUtils.parseStringToInt("i_board");
		model.addAttribute("data", service.updSold(param));
		
		return "redirect:/board/detail?i_board="+param.getI_board();
	}
	
	
	// 채팅등록
	@RequestMapping(value="/insTransCmt", method=RequestMethod.POST) 
    @ResponseBody
    public String insTransCmt(@RequestBody TransCmtDMI vo, HttpSession hs){
		System.out.println("i_transPOST : " + vo.getI_trans());
		System.out.println(vo.getI_user());
		System.out.println(vo.getI_board());
		System.out.println(vo.getSaleI_user());
		System.out.println(vo.getTransCmt());
		int result = service.insTransCmt(vo);
		return String.valueOf(result);
	}
	
	
	@RequestMapping(value="/selTransCmt", method=RequestMethod.GET)
	private @ResponseBody List<TransCmtDMI> selTransCmt(TransCmtDMI vo){
		
		return service.selTransCmt(vo);
	}
	
	
	// 판매자가 거래완료 눌렀을시 보내주는 값
	@RequestMapping(value="/transSuccess", method=RequestMethod.GET)
	public String transSuccess(Model model, HttpServletRequest request,
			RedirectAttributes ra, BoardPARAM param) {
		
		int result = service.insBuyList(param);
		int result2 = service.updSold(param);
		ra.addFlashAttribute("transSuccess", "거래완료됬다");
		return "redirect:/board/detail?i_board="+param.getI_board();
	}
	
		
	
	
}
