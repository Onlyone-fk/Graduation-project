package com.zhbit.pojo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Building implements Serializable{
	private int bid;
	private String bcall;
	private int mid;
	private List<Dormitory> dormitory;
	public Building() {
		super();
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public List<Dormitory> getDormitory() {
		return dormitory;
	}
	public void setDormitory(List<Dormitory> dormitory) {
		this.dormitory = dormitory;
	}
	
	public String getBcall() {
		return bcall;
	}
	public void setBcall(String bcall) {
		this.bcall = bcall;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	
}
