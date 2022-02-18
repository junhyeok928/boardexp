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
		service.insertBoard(insert);
		d.addAttribute("msg", "등록성공");
		return "a02_boardInsert";
	}
}
