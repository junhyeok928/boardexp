package board.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import board.a02_service.BoardService;
import board.a04_vo.Board;
import board.a04_vo.Member;

@Controller
@SessionAttributes("member")
@RequestMapping("/board.do")
public class BoardController {
	
	@ModelAttribute("member")
	public Member getMember() {
		return new Member();
	}
	@Autowired
	private BoardService service;

	@RequestMapping(params="method=login")
	public String login(@ModelAttribute("member") Member sch, Model d) {
		Member member = service.login(sch);
		if(member!=null) {
			d.addAttribute("loginMsg", "로그인 성공");
			d.addAttribute("member", member);
			
		}else {
			d.addAttribute("loginMsg", "로그인 실패");
		}
		
		return "forward:/board.do?method=list";
	}
	
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
