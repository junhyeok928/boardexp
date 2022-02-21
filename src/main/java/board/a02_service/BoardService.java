package board.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.a03_dao.BoardDao;
import board.a04_vo.Board;
import board.a04_vo.FileInfo;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;

	public List<Board> getBoardList(Board sch) {
		return dao.getBoardList(sch);
	}

	@Value("${upload}")
	private String uploadPath;

	public String insertBoard(Board ins) {
		dao.insertBoard(ins);
		String msg = "등록성공";
		// 특정한 위치에 첨부파일 업로드..
		if (ins.getReport() != null && ins.getReport().length > 0) {
			try {
				for (MultipartFile mf : ins.getReport()) {
					String fname = mf.getOriginalFilename();
					if (fname != null && !fname.equals("")) {
						System.out.println("경로명:" + uploadPath);
						System.out.println("첨부파일명:" + fname);
						File file = new File(uploadPath + fname);
						mf.transferTo(file);
						// 첨부파일 정보 DB에 등록..
						dao.insertFileInfo(new FileInfo(uploadPath, fname, "게시물 제목:" + ins.getTitle()));
					}
				}
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				msg = e.getMessage();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				msg = "파일전송오류:" + e.getMessage();
			} catch (Exception e) {
				msg = "기타예외:" + e.getMessage();
			}
		}
		return msg;
	}
	public Board getBoard(int no) {
		// Board 안에 상세 정보와 다운로드할 파일 정보를 설정되게 했다.
		Board b = dao.getBoard(no);
		b.setFnames(dao.getFileInfo(no));
		return b;
	}
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}
}
