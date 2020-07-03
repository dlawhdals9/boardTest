package com.web.vo;

public class Param {

	private String search;
	private String searchText;
	private int startNo;
	private int endNo;
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	@Override
	public String toString() {
		return "Param [search=" + search + ", searchText=" + searchText + ", startNo=" + startNo + ", endNo=" + endNo
				+ "]";
	}
	
	
	
	
}
