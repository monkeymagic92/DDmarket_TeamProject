package com.dandi.ddmarket.trans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dandi.ddmarket.CommonUtils;
import com.dandi.ddmarket.board.model.BoardPARAM;
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
	
}
