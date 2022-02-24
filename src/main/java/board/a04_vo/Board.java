package board.a04_vo;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int cnt;
	private int level;
	private int no;
	private int refno;
	private String title;
	private String writer;
	private String content;
	private Date regdte;
	private Date uptdte;
	private int readcnt;
	private MultipartFile[] report;
	// 파일 정보로 화면에 한 번에 로딩 하기 위해서 처리..
	private ArrayList<String> fnames;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public MultipartFile[] getReport() {
		return report;
	}
	public void setReport(MultipartFile[] report) {
		this.report = report;
	}
	public ArrayList<String> getFnames() {
		return fnames;
	}
	public void setFnames(ArrayList<String> fnames) {
		this.fnames = fnames;
	}

	
}
