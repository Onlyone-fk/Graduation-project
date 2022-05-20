package com.zhbit.pojo;

import org.springframework.stereotype.Component;

@Component
public class RepairInfo {
	private int repairid;
	private String repairNote;
	private int bid;
	private int did;
	private int rid;
	
	public RepairInfo() {
		super();
	}

	public int getRepairid() {
		return repairid;
	}

	public void setRepairid(int repairid) {
		this.repairid = repairid;
	}

	public String getRepairNote() {
		return repairNote;
	}

	public void setRepairNote(String repairNote) {
		this.repairNote = repairNote;
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

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}
	
	
}
