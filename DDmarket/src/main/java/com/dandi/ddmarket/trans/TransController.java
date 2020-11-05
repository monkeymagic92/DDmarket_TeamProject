package com.dandi.ddmarket.trans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
	    System.out.println("컨트롤 chk 값 : " + chk);
	    
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
	
}
