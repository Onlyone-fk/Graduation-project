package com.zhbit.pojo;

import org.springframework.stereotype.Component;

@Component
public class Items {
	private int itemsId;
	private String itemsName;
	private String notes;
	private int sid;
	private int bid;
	private int did;
	private int bedNo;
	private String itemstatus;

	public Items() {
		super();
	}

	public int getItemsId() {
		return itemsId;
	}

	public void setItemsId(int itemsId) {
		this.itemsId = itemsId;
	}

	public String getItemsName() {
		return itemsName;
	}

	public void setItemsName(String itemsName) {
		this.itemsName = itemsName;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
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

	public String getItemstatus() {
		return itemstatus;
	}

	public void setItemstatus(String itemstatus) {
		this.itemstatus = itemstatus;
	}

	
	
}
