package com.zhbit.pojo;

import org.springframework.stereotype.Component;

@Component
public class ManagerAccount {
	private int mid;
	private String mname;
	private String pwd;
	public ManagerAccount() {
		super();
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "ManagerAccount [mid=" + mid + ", mname=" + mname + ", pwd=" + pwd + "]";
	}
	
}
