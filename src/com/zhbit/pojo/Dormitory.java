package com.zhbit.pojo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;
@SuppressWarnings("serial")
@Component
public class Dormitory implements Serializable{
	private int did;
	private List<Bed> bed;
	private int healthScore;
	private List<Integer> stu;
	public int getHealthScore() {
		return healthScore;
	}
	public void setHealthScore(int healthScore) {
		this.healthScore = healthScore;
	}
	public Dormitory() {
		super();
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public List<Bed> getBed() {
		return bed;
	}
	public void setBed(List<Bed> bed) {
		this.bed = bed;
	}
	public List<Integer> getStu() {
		return stu;
	}
	public void setStu(List<Integer> stu) {
		this.stu = stu;
	}
	
	
}
