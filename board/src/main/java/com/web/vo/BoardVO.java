package com.web.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	
	private int no;					//	사원번호
	private String kor_name;		//	한글이름
	private String eng_name;		//	영문이름
	private String chn_name;		//	한문이름
	private String jumin_nof;		//	주민번호앞자리
	private String jumin_nob;		//	주민번호뒷자리
	private String image;			//	사진파일명
	private String birth1;			//	출생연도
	private String birth2;			//	출생월
	private String birth3;			//	출생일
	private String sol_flag;		//	양력/음력
	private String sex;				//	성별
	private String marry_flag;		//	결혼유무
	private String work_year;		//	년차	
	private String payment_type;	//	급여지급유형
	private String desire_dept;		//	희망직무
	private String jop_type;		//	입사유형
	private String address;			//	주소
	private String phone1;			//	연락처앞번호
	private String phone2;			//	연락처중간번호
	private String phone3;			//	연락처뒷번호
	private String email;			//	이메일
	private String tech_lev;		//	기술등급
	private String liquor;			//	주량
	private String exel;			//	엑셀파일
	private String word;			//	워드파일
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getChn_name() {
		return chn_name;
	}
	public void setChn_name(String chn_name) {
		this.chn_name = chn_name;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birth3) {
		this.birth3 = birth3;
	}
	public String getSol_flag() {
		return sol_flag;
	}
	public void setSol_flag(String sol_flag) {
		this.sol_flag = sol_flag;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMarry_flag() {
		return marry_flag;
	}
	public void setMarry_flag(String marry_flag) {
		this.marry_flag = marry_flag;
	}
	public String getWork_year() {
		return work_year;
	}
	public void setWork_year(String work_year) {
		this.work_year = work_year;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getDesire_dept() {
		return desire_dept;
	}
	public void setDesire_dept(String desire_dept) {
		this.desire_dept = desire_dept;
	}
	public String getJop_type() {
		return jop_type;
	}
	public void setJop_type(String jop_type) {
		this.jop_type = jop_type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTech_lev() {
		return tech_lev;
	}
	public void setTech_lev(String tech_lev) {
		this.tech_lev = tech_lev;
	}
	public String getLiquor() {
		return liquor;
	}
	public void setLiquor(String liquor) {
		this.liquor = liquor;
	}
	public String getExel() {
		return exel;
	}
	public void setExel(String exel) {
		this.exel = exel;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", kor_name=" + kor_name + ", eng_name=" + eng_name + ", chn_name=" + chn_name
				+ ", jumin_nof=" + jumin_nof + ", jumin_nob=" + jumin_nob + ", image=" + image + ", birth1=" + birth1
				+ ", birth2=" + birth2 + ", birth3=" + birth3 + ", sol_flag=" + sol_flag + ", sex=" + sex
				+ ", marry_flag=" + marry_flag + ", work_year=" + work_year + ", payment_type=" + payment_type
				+ ", desire_dept=" + desire_dept + ", jop_type=" + jop_type + ", address=" + address + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", email=" + email + ", tech_lev=" + tech_lev
				+ ", liquor=" + liquor + ", exel=" + exel + ", word=" + word + "]";
	}
	
	
	

}
