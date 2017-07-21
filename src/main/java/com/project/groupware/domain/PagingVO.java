package com.project.groupware.domain;

public class PagingVO {

	private int totalPage;		// 총 페이지 수: 문서 총 수 / 페이지별 문서 수.
	private int currentPage;	// 현재 페이지
	private int nextPage;		// 다음 페이지 (다음 버튼 눌렀을때)
	private int prevPage;		// 이전 페이지
	private int countPage; 		// 페이지 그릇	
	
	private int totalCount; 	// 보여줄 문서 총 개수
	private int countPerPage; 	// 페이지당 문서 갯수
	
	private int startPage;		// 하단부 시작 페이지 번호
	private int endPage;		// 하단부 끝페이지 번호
	
	private int startArticleNum;	// 시작 문서 번호 (documentId가 아님.)	
	private int endArticleNum;		// 끝 문서번호
	
	
	public PagingVO() {
		super();
	}

	public PagingVO(int currentPage, int totalCount) {
		this.countPage = 10;
		this.countPerPage = 10;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.totalPage = totalCount / countPerPage + (totalCount % countPerPage != 0 ? 1 : 0) ;
		this.nextPage = (currentPage + countPage >= totalPage ? totalPage : currentPage + countPage);
		this.prevPage = (currentPage - countPage <= 0 ? 1 : currentPage - countPage);				
		this.startPage = ((currentPage - 1) / countPage) * countPage + 1;
		this.endPage = (startPage - 1 + countPage >= totalPage ? totalPage : startPage - 1 + countPage);
		this.startArticleNum = (currentPage-1) * countPerPage;
		this.endArticleNum = (startArticleNum - 1 + countPerPage >= totalCount ? totalCount : startArticleNum - 1 + countPerPage) ;
	}
	
	


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalCount) {
		// 총 페이지수 = 총 문서개수 / 페이지당 문서 수 (+1 : 나머지가 있으면)
		this.totalPage = totalCount / countPerPage + (totalCount % countPerPage != 0 ? 1 : 0) ;	
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getNextPage() {
		return nextPage;
	}


	public void setNextPage(int currentPage) {
		this.prevPage = (currentPage + countPage >= totalPage ? totalPage : currentPage + countPage);
	}


	public int getPrevPage() {
		return prevPage;
	}


	public void setPrevPage(int currentPage) {
		this.prevPage = (currentPage - countPage <= 0 ? 1 : currentPage - countPage);
	}


	public int getCountPage() {
		return countPage;
	}


	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}


	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getCountPerPage() {
		return countPerPage;
	}


	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int currentPage) {
		this.startPage = ((currentPage - 1) / countPage) * countPage + 1;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int startPage) {
		this.endPage = (startPage - 1 + countPage >= totalPage ? totalPage : startPage - 1 + countPage);
	}

	public int getStartArticleNum() {
		return startArticleNum;
	}

	public void setStartArticleNum(int currentPage) {
		this.startArticleNum = (currentPage-1) * countPerPage;
	}

	public int getEndArticleNum() {
		return endArticleNum;
	}

	public void setEndArticleNum(int startArticleNum) {
		this.endArticleNum = (startArticleNum - 1 + countPerPage >= totalCount ? totalCount : startArticleNum - 1 + countPerPage) ;
	}

	@Override
	public String toString() {
		return "PagingVO [totalPage=" + totalPage + ", currentPage=" + currentPage + ", nextPage=" + nextPage
				+ ", prevPage=" + prevPage + ", countPage=" + countPage + ", totalCount=" + totalCount
				+ ", countPerPage=" + countPerPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startArticleNum=" + startArticleNum + ", endArticleNum=" + endArticleNum + "]";
	}

	



	
}
