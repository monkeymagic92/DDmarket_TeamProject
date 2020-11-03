package com.dandi.ddmarket.board;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dandi.ddmarket.FileUtils;
import com.dandi.ddmarket.TimeMaximum;
import com.dandi.ddmarket.board.model.BoardDMI;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	// 글등록 
	public int insBoard(BoardVO param, MultipartHttpServletRequest mReq,
			HttpSession hs) {
		
		int i_board = 1;
		int result = 0;
		try { // 만약 게시글이 없는상태에서는 xml 에러가 뜨니 i_board 값을 1으로 주겠다
			i_board = mapper.maxI_board();
			
		} catch(Exception e) {
			i_board = 1;
		}
		hs.setAttribute("i_board", i_board); // SaleReg.POST DETAIL로 값 보낼떄 등록글을 바로 띄워줄수있게 세션박기
		
		System.out.println("아이보드값 : " + i_board);
		
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getI_cg() == 0
				|| param.getPost().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		
		System.out.println("경로 : " + path);
		
		// 단일파일
		MultipartFile file = mReq.getFile("image");
		FileUtils.makeFolder(path);
		String saveFile = FileUtils.thumFile(path, file);
				
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);

				String saveFileNm = FileUtils.thumFile(path, mf);
				
				System.out.println("saveFileNm: " + saveFileNm);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(list.size()<6) { // 총 사진 갯수 
				for(int i=list.size(); i<5; i++) {
					System.out.println("리스트 사이즈 : " + list.size());
					BoardVO vo = new BoardVO();
					vo.setImageFile("");
					list.add(vo);
				}
			}
			
			param.setThumImage(saveFile);
			
			System.out.println("thumImage 이름 : " + param.getThumImage());
			
			param.setImageFileList(list);
			result = mapper.insBoard(param);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 3;
		}	
		
		return result;
	}
	
	
	
		
	// 게시글 수정
	public int updBoard(BoardVO param, MultipartHttpServletRequest mReq,
			HttpSession hs) {
		MultipartFile file = mReq.getFile("image");
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		System.out.println("1" + file.getOriginalFilename());
		System.out.println("2" + fileList.size());
		
		String fileChk = null;
		if(file.getOriginalFilename() == "" && fileList.size() == 0) {
			int result = mapper.updBoard(param);
			
			System.out.println("file :" + file.getOriginalFilename());
			System.out.println("file사이즈 : " + fileList.size());
			return result;
		}
					
		System.out.println("이거뜨면 밑에실행된거@@@@@@@@@@@@@@");

		int result = mapper.updBoard(param);
		int i_board = (int)hs.getAttribute("updI_board");
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getI_cg() == 0
				|| param.getPost().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		String saveFile = FileUtils.saveFile(path, file);
		// 단일파일
		
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);
				System.out.println("mf값 :" + mf);
				String saveFileNm = FileUtils.saveFile(path, mf);
				fileChk = saveFileNm;
				System.out.println("saveFileNm: " + saveFileNm);
				
				vo.setSeq(i+1);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(fileChk != null) {
				if(list.size()<6) { // 총 사진 갯수 
					for(int i=list.size(); i<5; i++) {
						BoardVO vo = new BoardVO();
						vo.setImageFile("");
						vo.setSeq(i+1);
						list.add(vo);
					}
				}
			}
			
			for(BoardVO vo : list) {
				vo.setI_board(i_board);
				vo.setThumImage(saveFile);
				result = mapper.updImage(vo);
			}
			
		} catch(Exception e) {
			result = 1;
		}	
		
		hs.removeAttribute("updI_board");
		return result;
	}

	
		
	// 판매글 상세페이지 정보 나타내기(detail)
	public BoardDMI selBoard(BoardPARAM param) {
		
		return transVoR_dt(mapper.selBoard(param));
	}
	
	
	// 조회수 증가
	public void addHit(BoardPARAM param, HttpServletRequest req) {
		String myIp = req.getRemoteAddr();
		ServletContext ctx = req.getServletContext();
		
		//int i_user = SecurityUtils.getLoginUserPk(req);
		String currentReadIp = (String)ctx.getAttribute("current_board_read_ip" + param.getI_board());
		if(currentReadIp == null || !currentReadIp.equals(myIp)) {
			//param.setI_user(i_user);
			mapper.updAddHit(param);
			ctx.setAttribute("current_board_read_ip" + param.getI_board(), myIp);
		}
		
	}
	
	// 글 삭제
	public int saleDel(BoardPARAM param) {

		return mapper.saleDel(param);
	}
	
	
	// 등록일자를 현재 시간 기준으로 바꿔주는 메소드 ex) 몇 시간전, 몇 일전..
	public static BoardDMI transVoR_dt(BoardDMI param) {
		String paramR_dt = param.getR_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		try {
			date = sdf.parse(paramR_dt);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String strR_dt = TimeMaximum.calculateTime(date);
		param.setR_dt(strR_dt);
		
		return param;
	}

}
