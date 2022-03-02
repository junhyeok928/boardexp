package board.a03_dao;

import java.util.ArrayList;
import java.util.List;

import board.a04_vo.Board;
import board.a04_vo.BoardSch;
import board.a04_vo.FileInfo;
import board.a04_vo.Member;

// board.a03_dao.Dao
public interface BoardDao {
	public int totCnt(BoardSch sch);
	public List<Board> getBoardList(BoardSch sch);
	public void insertBoard(Board ins);
	public void insertFileInfo(FileInfo ins);
	public Board getBoard(int no);
	public ArrayList<String> getFileInfo(int fno);
	public void deleteBoard(int no);
	public Member login(Member login);
	public void updateBoard(Board upt);
	public void updateReadCnt(int no);
	
	
}
