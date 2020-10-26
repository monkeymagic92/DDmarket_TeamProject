package com.dandi.ddmarket.index;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dandi.ddmarket.TimeMaximum;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Service
public class IndexService {
	
	@Autowired
	private IndexMapper mapper;
	
	
	public List<BoardVO> selHotBoardList(BoardPARAM param) {
		
		List<BoardVO> hotBoardList = mapper.selHotBoardList(param);
		
		// 등록일자를 현재 시간 기준으로 바꿔줌 ex) 몇 시간전, 몇 일전..
		for(BoardVO vo : hotBoardList) {
			String paramR_dt = vo.getR_dt();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			try {
				date = sdf.parse(paramR_dt);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String strR_dt = TimeMaximum.calculateTime(date);
			vo.setR_dt(strR_dt);
		}
		
		return hotBoardList;
	}
	
}
