package com.zhbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhbit.dao.RepairDao;
import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.RepairInfo;
import com.zhbit.service.RepairService;
@Service("RepairService")
public class RepairServiceImpl implements RepairService {
	@Autowired
	private RepairDao rd;
	
	@Override
	public List<RepairInfo> queryAllRepairInfo() {
		return rd.queryAllRepairInfo();
	}

	@Override
	public List<RepairInfo> queryRepairInfo(int rid) {
		return rd.queryRepairInfo(rid);
	}

	@Override
	public List<RepairAccount> queryRepair() {
		return rd.queryRepair();
	}

	@Override
	public int assignBed(int repairid, int rid) {
		return rd.assignBed(repairid, rid);
	}

	@Override
	public List<RepairInfo> querySidRepairInfo(int sid) {
		return rd.querySidRepairInfo(sid);
	}

	@Override
	public int addRepairInfo(String repairNote,int bid,int did) {
		return rd.addRepairInfo(repairNote,bid,did);
	}

	@Override
	public List<RepairInfo> queryRidRepairInfo(int rid) {
		return rd.queryRidRepairInfo(rid);
	}

	@Override
	public int deleteRepairInfo(int repairid) {
		return rd.deleteRepairInfo(repairid);
	}

}
