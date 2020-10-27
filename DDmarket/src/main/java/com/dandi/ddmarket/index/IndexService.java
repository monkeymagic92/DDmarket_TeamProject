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
	
	// 등록일자를 현재 시간 기준으로 바꿔주는 메소드 ex) 몇 시간전, 몇 일전..
	public List<BoardVO> transferR_dt(List<BoardVO> param) {
		
		for(BoardVO vo : param) {
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
		return param;
	}
	
	
	public List<BoardVO> selHotBoardList(BoardPARAM param) {
		return transferR_dt(mapper.selHotBoardList(param));
	}
	
	
	public List<BoardVO> selRecBoardList(BoardPARAM param) {
		return transferR_dt(mapper.selRecBoardList(param));
	}
	
	
	public List<BoardVO> selNewBoardList(BoardPARAM param) {
		return transferR_dt(mapper.selNewBoardList(param));
	}
	
	
	}
	

