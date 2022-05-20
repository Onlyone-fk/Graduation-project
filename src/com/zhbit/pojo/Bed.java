package com.zhbit.pojo;

import java.io.Serializable;
import java.util.List;

public class Bed implements Serializable{
	private int bedNo;
	private List<StudentAccount> stu;
	public Bed() {
		super();
	}
	public int getBedNo() {
		return bedNo;
	}

	public void setBedNo(int bedNo) {
		this.bedNo = bedNo;
	}
	public List<StudentAccount> getStu() {
		return stu;
	}
	public void setStu(List<StudentAccount> stu) {
		this.stu = stu;
	}
	
	
	
}
