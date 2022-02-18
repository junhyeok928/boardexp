package board.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.a03_dao.BoardDao;
import board.a04_vo.Board;

@Service
public class BoardService {
	@Autowired
	private BoardDao dao;
	
	public List<Board> getBoardList(Board sch){
		return dao.getBoardList(sch);
	}
	public void insertBoard(Board ins){
		// 특정한 위치에 첨부파일 업로드..
		String fname = ins.getReport().getOriginalFilename();
		if(fname!=null) {
			System.out.println("첨부파일명:"+fname);
		}
		
		// 첨부파일 정보 DB에 등록..
		
		dao.insertBoard(ins);
	}
	
}
