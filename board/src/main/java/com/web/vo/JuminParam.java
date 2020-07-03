package com.web.vo;

public class JuminParam {

	private int no;
	private String jumin_nof;
	private String jumin_nob;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getJumin_nof() {
		return jumin_nof;
	}
	public void setJumin_nof(String jumin_nof) {
		this.jumin_nof = jumin_nof;
	}
	public String getJumin_nob() {
		return jumin_nob;
	}
	public void setJumin_nob(String jumin_nob) {
		this.jumin_nob = jumin_nob;
	}
	@Override
	public String toString() {
		return "JuminParam [no=" + no + ", jumin_nof=" + jumin_nof + ", jumin_nob=" + jumin_nob + "]";
	}
	
	
}
