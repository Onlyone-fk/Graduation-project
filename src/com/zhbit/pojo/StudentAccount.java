package com.zhbit.pojo;

import org.springframework.stereotype.Component;

@Component
public class StudentAccount {
	private int sid;
	private String sname;
	private String sclass;
	private int bid;
	private int did;
	private int bedNo;
	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	private String pwd;
	
	public StudentAccount() {
		super();
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getBedNo() {
		return bedNo;
	}

	public void setBedNo(int bedNo) {
		this.bedNo = bedNo;
	}

	@Override
	public String toString() {
		return "StudentAccount [sid=" + sid + ", sname=" + sname + ", sclass=" + sclass + ", bid=" + bid + ", did="
				+ did + ", bedNo=" + bedNo + ", pwd=" + pwd + "]";
	}

	
}
