package board.a04_vo;

public class BoardSch {
	// 기본 페이지 처리
	private int count; // 총건수(DB)
	private int pageSize; // 한번에 보여줄 데이터 건수(화면select-요청)
	private int pageCount; // 총 페이지 수(총건수/한번에 보여줄 데이터 건수)
	private int curPage; // 클릭한 현재 페이지 번호
	private int start; // DB에 넘길 페이지의 시작 번호
	private int end;  // DB에 넘길 페이지의 마지막 번호
	// block처리
	private int blockSize; // 한번에 보여줄 하단의 페이지 블럭
	private int startBlock; // 블럭의 시작 번호
	private int endBlock; // 블럭의 마지막 번호
	// 검색할 내용
	private String title;
	private String writer;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		this.endBlock = endBlock;
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
	
}
