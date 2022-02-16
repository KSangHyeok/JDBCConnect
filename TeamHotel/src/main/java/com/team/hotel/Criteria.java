package com.team.hotel;

public class Criteria {
	private int pageNum; // 현재페이지
	private int amount;  // 페이지 당 보여질 게시물 수
	public Criteria() {
		this(1, 10); //pageNum, aomunt 기본 세팅
	}
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + "]";
	}
	
}
