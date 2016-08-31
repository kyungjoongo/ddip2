package blueberry.common;

public class PageUtil {

	private int pageNum ; //현재 페이지 번호
	private int startRow; //시작행 번호
	private int endRow;//끝행번호
	private int totalPageCount;//전체 페이지 갯수
	private int startPageNum;//시작 페이지 번호
	private int endPageNum;//끝 페이지 번호
	private int rowBlockCount;//한페이지 보여줄  글의갯수
	private int pageBlockCount;//한페이지에 보여줄 페이지 갯수
	private int totalRowCount; //전체 글의 갯스
	
	
	
	private int nextPageBlock; //전체 글의 갯스
	
	public PageUtil (int pageNum, int totalRowCount, int rowBlockCount, int pageBlockCount)
	{
		this.pageNum = pageNum;
		
		this.totalRowCount = totalRowCount;
		
		this.rowBlockCount = rowBlockCount;
		
		this.pageBlockCount = pageBlockCount;
		
		
		//시작행 번호..
		startRow = (pageNum-1)* rowBlockCount + 1;
		
		//끝행번호
		endRow = startRow + rowBlockCount -1;
		
		//전체 페이지 갯수
		totalPageCount = (int)Math.ceil(totalRowCount/(double)rowBlockCount); 
		
		//시작 페이지 갯수.
		startPageNum= ( pageNum-1) /pageBlockCount* pageBlockCount + 1;
		
		//끝 페이지 번호
		endPageNum = startPageNum + pageBlockCount -1;
		if ( totalPageCount< endPageNum){
			endPageNum= totalPageCount;
		}
		
		//다음페이지 블락
		
		this.nextPageBlock = pageBlockCount * rowBlockCount; 
	}
	
	
	

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}

	public int getPageBlockCount() {
		return pageBlockCount;
	}

	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	
	
}
