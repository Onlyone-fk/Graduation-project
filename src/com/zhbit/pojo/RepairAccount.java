package com.zhbit.pojo;

import org.springframework.stereotype.Component;

@Component
public class RepairAccount {
	private int rid;
	private String rname;
	private String pwd;
	public RepairAccount() {
		super();
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
