package com.zhbit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhbit.pojo.Items;

public interface ItemsService {
	
	public List<Items> lostItems();									//查找所有丢失物品信息
	
	public int updateNotes(String notes,int itemsid);				//修改备注
	
	public int addItems(String itemsName,String notes,int sid);		//添加丢失物品信息
	
	public int Returned(int itemsid);								//已归还的物品就清除有关信息
	
	public int renewStatus(int itemsid);							//更新物品状态
	
}
