package com.dandi.ddmarket.trans;

import java.util.ArrayList;
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
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.trans.model.TransCmtDMI;
import com.dandi.ddmarket.trans.model.TransCmtVO;
import com.dandi.ddmarket.trans.model.TransVO;

@Controller
@RequestMapping("/trans")
public class TransController {
	
	@Autowired
	private TransService service;
	
	
	// 거래 요청 처리 
	@RequestMapping(value="/transRequest", method = RequestMethod.POST)
	public String transRequest(TransVO vo, BoardPARAM param,
			RedirectAttributes ra) {
		int result = 0;
		int chk = service.chkTrans(param);
		
	    
	    if(chk == 0) { // 구매요청 	
	    	result = service.insTrans(vo);
	    	
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
	

	
	// 추후 판매자가 구매요청 목록 눌렀을시 채팅창 띄우기 ?? (아직 미정) 
	@RequestMapping(value="/moveChat", method=RequestMethod.POST) 
    private @ResponseBody String moveChat(@RequestBody TransVO vo, HttpSession hs, HttpServletRequest request) {
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 판매자나 구매자 파싱후 댓글등록
	@RequestMapping(value="/selTransCmt", method=RequestMethod.GET) 
    private @ResponseBody List<TransCmtVO> selTransCmt(TransCmtDMI param, HttpServletRequest request) {
		
		System.out.println("채팅창 뿌리기");
		System.out.println("판매자 pk값 saleI_user : " + param.getSaleI_user());
		System.out.println("구매자 pk값 i_user : " + param.getI_user());
		System.out.println("게시글 i_board : " + param.getI_board());
		
		return service.selTransCmt(param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 판매자나 구매자 파싱후 댓글등록
	@RequestMapping(value="/insTransCmt", method=RequestMethod.POST) 
    private @ResponseBody String insTransCmt(@RequestBody TransCmtVO vo, HttpServletRequest request, HttpSession hs) {
		
//		int i_user = (int)hs.getAttribute("loginUser");
//		vo.setTransCmtChk(i_user);
		
		
		System.out.println("inTransCmt 아작스 - 구매 댓글 등록 -");
		System.out.println("판매자 : " + vo.getI_user());
		System.out.println("게시글 : " + vo.getI_board());
		System.out.println("판매유저 : " + vo.getSaleI_user());
		System.out.println("댓내용 : " + vo.getTransCmt());
		System.out.println("누가쓴글인지 chk : " + vo.getTransCmtChk());
		
		
		int result = service.insTransCmt(vo);
		
		return String.valueOf(result);
	}
		
	
	

}
