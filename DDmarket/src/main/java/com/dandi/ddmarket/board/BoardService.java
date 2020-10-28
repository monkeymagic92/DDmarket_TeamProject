package com.dandi.ddmarket.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dandi.ddmarket.FileUtils;
import com.dandi.ddmarket.SecurityUtils;
import com.dandi.ddmarket.board.model.BoardDMI;
import com.dandi.ddmarket.board.model.BoardPARAM;
import com.dandi.ddmarket.board.model.BoardVO;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;

	public int insBoard(BoardVO param, MultipartHttpServletRequest mReq) {
		
		int i_board = 0;
		int result = 0;
		try { // 만약 게시글이 없는상태에서는 xml 에러가 뜨니 i_board 값을 0으로 주겠다
			i_board = mapper.maxI_board();
			
		} catch(Exception e) {
			i_board = 0;
		}
		
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getI_cg() == 0
				|| param.getPost().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}
		
		
		// 단일파일
		MultipartFile file = mReq.getFile("image");
		String thumPath = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/thumImage/";
		String saveFile = FileUtils.saveFile(thumPath, file);
		
				
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";	

		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);

				String saveFileNm = FileUtils.saveFile(path, mf);
				
				System.out.println("saveFileNm: " + saveFileNm);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(list.size()<6) { // 총 사진 갯수 
				for(int i=list.size(); i<5; i++) {
					BoardVO vo = new BoardVO();
					vo.setImageFile("");
					list.add(vo);
				}
			}
			
			param.setThumImage(saveFile);
			param.setImageFileList(list);
			result = mapper.insBoard(param);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 3;
		}	
		
		return result;
	}
	
	
	// 판매글 상세페이지 정보 나타내기(detail)
	public BoardDMI selBoard(BoardPARAM param) {
		return mapper.selBoard(param);
	}
	
	
	// 조회수 증가
	public void addHit(BoardPARAM param, HttpServletRequest req) {
		String myIp = req.getRemoteAddr();
		ServletContext ctx = req.getServletContext();
		
		int i_user = SecurityUtils.getLoginUserPk(req);
		
		
		String currentReadIp = (String)ctx.getAttribute("current_board_read_ip" + param.getI_board());
		if(currentReadIp == null || !currentReadIp.equals(myIp)) {
			param.setI_user(i_user);
			mapper.updAddHit(param);
			ctx.setAttribute("current_board_read_ip" + param.getI_board(), myIp);
			System.out.println(myIp);
		}
	}
	
	
	
		
}
