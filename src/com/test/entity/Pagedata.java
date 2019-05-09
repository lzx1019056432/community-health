package com.test.entity;

public class Pagedata {
	private int pageindex;//页码
	private int ResultCount;//总记录数
	private int PageCount;//总页数
	public int getPageindex() {
		return pageindex;
	}
	public void setPageindex(int pageindex) {
		this.pageindex = pageindex;
	}
	public int getResultCount() {
		return ResultCount;
	}
	public void setResultCount(int resultCount) {
		ResultCount = resultCount;
	}
	public int getPageCount() {
		return PageCount;
	}
	public void setPageCount(int pageCount) {
		PageCount = pageCount;
	}
	
}
