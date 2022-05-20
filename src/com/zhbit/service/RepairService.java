package com.zhbit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.RepairInfo;

public interface RepairService {
	
	public List<RepairInfo> queryAllRepairInfo();//查找所有维修信息
	
	public List<RepairInfo> queryRepairInfo(@Param("rid")int rid);//查找对应id的维修信息
	
	public List<RepairAccount> queryRepair();//查找所有维修人员
	
	public int assignBed(int repairid,int rid);//分配维修工
	
	public List<RepairInfo> querySidRepairInfo(int sid);//根据学号查找对应的宿舍维修信息
	
	public int addRepairInfo(String repairNote,int bid,int did);//添加维修消息
	
	public List<RepairInfo> queryRidRepairInfo(int rid);//根据维修人员编号查找对应的宿舍维修信息
	
	public int deleteRepairInfo(int repairid);//清除维修信息
}
