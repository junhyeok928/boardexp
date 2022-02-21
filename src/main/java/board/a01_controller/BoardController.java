package board.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.a02_service.BoardService;
import board.a04_vo.Board;

@Controller
@RequestMapping("/board.do")
public class BoardController {
	@Autowired
	private BoardService service;
	
	// http://localhost:7080/board/board.do?method=list
	@RequestMapping(params="method=list")
	public String boardList(Board sch, Model d) {
		d.addAttribute("boardList", service.getBoardList(sch));
		return "a01_boardList";
	}
	// http://localhost:7080/board/board.do?method=insertFrm
	// 초기 화면 호출
	@RequestMapping(params="method=insertFrm")
	public String boardInsertFrm() {
		
		return "a02_boardInsert";
	}
	// 등록 처리 후 화면 호출..
	@RequestMapping(params="method=insert")
	public String boardInsert(Board insert, Model d) {
		d.addAttribute("msg", service.insertBoard(insert));
		return "a02_boardInsert";
	}
	@RequestMapping(params="method=detail")
	public String boardDetail(int no, Model d) {
		System.out.println("번호:"+no);
		// 기본 detail 정보를 모델로 리스트 처리..	
		d.addAttribute("board", service.getBoard(no));
		return "a03_boardDetail";
	}
	@RequestMapping(params="method=del")
	public String boardDelete(int no, Model d) {
		System.out.println("삭제 번호:"+no);
		// 기본 detail 정보를 모델로 리스트 처리..	
		service.deleteBoard(no);
		d.addAttribute("msg", "삭제되었습니다!");
		return "a03_boardDetail";
	}	
}
