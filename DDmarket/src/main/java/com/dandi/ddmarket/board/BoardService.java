package com.dandi.ddmarket.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	public int insBoard(BoardVO param, MultipartHttpServletRequest mReq,
			HttpSession hs) {
				
		int result = 0;
		// 단일파일
		MultipartFile file = mReq.getFile("image");
		
		int i_board = mapper.insBoard(param);
		
		hs.setAttribute("i_board", i_board); // SaleReg.POST DETAIL로 값 보낼떄 등록글을 바로 띄워줄수있게 세션박기
		
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getI_cg() == 0
				|| param.getPost().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		
		String saveFile = FileUtils.saveFile(path, file);
		param.setThumImage(saveFile);
		
				
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);

				String saveFileNm = FileUtils.saveFile(path, mf);
				
				System.out.println("saveFileNm: " + saveFileNm);
				String imge = "Image_" + (i+1);
				vo.setImage_1(imge);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(list.size()<6) { // 총 사진 갯수 
				for(int i=list.size(); i<5; i++) {
					BoardVO vo = new BoardVO();
					String imge = "Image_" + (i+1);
					vo.setImage_1(imge);
					
					System.out.println("fsdfsd : " + vo.getImage_1());
					vo.setImageFile("");
					list.add(vo);
				}
			}
			
			for(BoardVO vo : list) {
				vo.setThumImage(saveFile);
				vo.setI_board(i_board);
				System.out.println("1 : " + vo.getImage_1());
				System.out.println("2 : " + vo.getImageFile());
				result = mapper.insImages(vo);
			}
			
			
			param.setI_board(i_board);
			param.setThumImage(saveFile);
			param.setImageFileList(list);
			result = mapper.insImages(param);
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 3;
		}	
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 판매글 수정
	public int updBoard(BoardVO param, MultipartHttpServletRequest mReq){
		
		int result = 0;
		int i_board = mapper.insBoard(param);
		
		
		// 혹시나 NOT NULL 부분에서 빈값이 넘어올경우 서버에서 조치
		// 학원가서 Db t_board  price 컬럼값 타입을 varchar로 해서 테스트해보기
		if(param.getTitle().equals("") || param.getI_cg() == 0
				|| param.getPost().equals("") || param.getCtnt().equals("")) {
			
			return result = 2;
		}		
		
		String path = mReq.getServletContext().getRealPath("") + "/resources/img/board/" + i_board + "/";
		
		// 단일파일
		MultipartFile file = mReq.getFile("image");
		String saveFile = FileUtils.saveFile(path, file);
				
		// 다중파일
		List<MultipartFile> fileList = mReq.getFiles("images");
		List<BoardVO> list = new ArrayList();
					
		try { // 실제 사진 DB에 값 넣기
			for (int i = 0; i < fileList.size(); i++) {
				String img = "image_" + i;
				BoardVO vo = new BoardVO();
				MultipartFile mf = fileList.get(i);

				String saveFileNm = FileUtils.saveFile(path, mf);
				
				System.out.println("saveFileNm: " + saveFileNm);
				vo.setImage_1(img);
				vo.setImageFile(saveFileNm);
				list.add(vo);
			}
			
			if(list.size()<6) { // 총 사진 갯수 
				for(int i=list.size(); i<5; i++) {
					BoardVO vo = new BoardVO();
					
					String img = "image_" + i;
					vo.setImage_1(img);
					vo.setImageFile(null);
					list.add(vo);
				}
			}
			
			param.setI_board(i_board);
			param.setThumImage(saveFile);
			param.setImageFileList(list);
			
			for(BoardVO vo : list) {
				System.out.println("1 : " + vo.getImage_1());
				System.out.println("2 : " + vo.getImageFile());
				result = mapper.insImages(vo);
			}
			
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
		}
	}

	public int saleDel(BoardPARAM param) {
		return mapper.saleDel(param);
	}
	
	
}
