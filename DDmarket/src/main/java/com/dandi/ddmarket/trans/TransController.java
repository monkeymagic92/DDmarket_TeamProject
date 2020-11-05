package com.dandi.ddmarket.trans;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dandi.ddmarket.ViewRef;
import com.dandi.ddmarket.trans.model.TransVO;

@Controller
@RequestMapping("/trans")
public class TransController {
	
	@Autowired
	private TransService service;
	
	
	// 거래 요청 처리 
	@RequestMapping(value="/transRequest",produces="application/json")
	public @ResponseBody String transRequest(@RequestBody TransVO vo) {
		System.out.println("-- 트랜스 --");
		System.out.println("i_user : " + vo.getI_user());
		System.out.println("i_board : " + vo.getI_board());
		System.out.println("chk : " + vo.getChk());
		int result = service.insTrans(vo);
		
		return String.valueOf(result);
	}
	
}
