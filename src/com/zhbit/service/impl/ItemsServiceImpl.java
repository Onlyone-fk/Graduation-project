package com.zhbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhbit.dao.ItemsDao;
import com.zhbit.pojo.Items;
import com.zhbit.service.ItemsService;
@Service("itemsService")
public class ItemsServiceImpl implements ItemsService {
	@Autowired
	private ItemsDao itemsdao;
	@Override
	public List<Items> lostItems() {
		return itemsdao.lostItems();
	}
	@Override
	public int updateNotes(String notes,int itemsid) {
		return itemsdao.updateNotes(notes,itemsid);
	}
	@Override
	public int addItems(String itemsName, String notes, int sid) {
		return itemsdao.addItems(itemsName, notes, sid);
	}
	@Override
	public int Returned(int itemsid) {
		return itemsdao.Returned(itemsid);
	}
	@Override
	public int renewStatus(int itemsid) {
		return itemsdao.renewStatus(itemsid);
	}

}
