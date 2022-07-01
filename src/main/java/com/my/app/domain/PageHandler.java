package com.my.app.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class PageHandler {

	private SearchCondition sc;
	
	private int totalCnt;		// 총 게시글 수
	private int totalPage;		// 총 페이지 수
	private final int naviSize = 10;		// 네비바에 들어가는 페이지 수
	private int beginPage;		// 시작 페이지
	private int endPage;		// 끝 페이지
	private boolean showPrev;	// 이전 버튼
	private boolean showNext;	// 다음 버튼
	
	public PageHandler(int totalCnt, SearchCondition sc) {
		
		this.totalCnt = totalCnt;
		this.sc = sc;
		
		doPaging(totalCnt, sc);
	}
	
	public void doPaging(int totalCnt, SearchCondition sc){
		
		this.totalCnt = totalCnt;
	
		totalPage = (int)Math.ceil(totalCnt/(double)sc.getPageSize());
		beginPage = ((sc.getPage()-1)/naviSize) * naviSize + 1; 
		endPage = Math.min(beginPage+naviSize-1, totalPage);
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}
	
	public SearchCondition getSc() {
		return sc;
	}

	public void setSc(SearchCondition sc) {
		this.sc = sc;
	}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isShowPrev() {
		return showPrev;
	}
	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}
	public boolean isShowNext() {
		return showNext;
	}
	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}
	public int getNaviSize() {
		return naviSize;
	}
	
	
	@Override
	public String toString() {
		return "PageHandler [sc=" + sc + ", totalCnt=" + totalCnt + ", totalPage=" + totalPage + ", naviSize="
				+ naviSize + ", beginPage=" + beginPage + ", endPage=" + endPage + ", showPrev=" + showPrev
				+ ", showNext=" + showNext + "]";
	}

	public void print() {
		System.out.println("page = " + sc.getPage());
		System.out.print(showPrev ? "[PREV]" : "");
		for(int i=beginPage ; i<=endPage ; i++) {
			System.out.print(i + " ");
		}
		System.out.println(showNext ? "[NEXT]" : ""); 
	}
}
