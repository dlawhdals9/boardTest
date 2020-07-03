package com.web.vo;

public class DynamicParam {
	
	private String sex;
	private String tech_lev;
	private String jop_type;
	private String desire_dept;
	private int startNo;
	private int endNo;
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTech_lev() {
		return tech_lev;
	}
	public void setTech_lev(String tech_lev) {
		this.tech_lev = tech_lev;
	}
	public String getJop_type() {
		return jop_type;
	}
	public void setJop_type(String jop_type) {
		this.jop_type = jop_type;
	}
	public String getDesire_dept() {
		return desire_dept;
	}
	public void setDesire_dept(String desire_dept) {
		this.desire_dept = desire_dept;
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
		return "DynamicParam [sex=" + sex + ", tech_lev=" + tech_lev + ", jop_type=" + jop_type + ", desire_dept="
				+ desire_dept + ", startNo=" + startNo + ", endNo=" + endNo + "]";
	}

	
	
}
