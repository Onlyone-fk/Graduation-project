package com.zhbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.RepairInfo;

@Repository
public interface RepairDao {
	@Select("select *from repairInfo")
	@ResultType(RepairInfo.class)
	public List<RepairInfo> queryAllRepairInfo();//查找所有维修信息
	
	@Select("select *from repairInfo where rid=#{rid}")
	@ResultType(RepairInfo.class)
	public List<RepairInfo> queryRepairInfo(@Param("rid")int rid);//查找对应id的维修信息
	
	@Select("select *from repair")
	@ResultType(RepairAccount.class)
	public List<RepairAccount> queryRepair();//查找所有维修人员
	
	@Update("update repairInfo set rid=#{rid} where repairid=#{repairid}")
	public int assignBed(@Param("repairid")int repairid,@Param("rid")int rid);//分配维修工
	
	@Select("select r.repairid,r.repairNote,r.bid,r.did,r.rid from repairInfo r,"
			+ "student_live sl where sl.sid=#{sid} and sl.bid=r.bid and sl.did=r.did")
	@ResultType(RepairInfo.class)
	public List<RepairInfo> querySidRepairInfo(@Param("sid")int sid);//根据学号查找对应的宿舍维修信息
	
	@Insert("insert into repairInfo(repairNote,bid,did) values(#{repairNote},#{bid},#{did})")
	public int addRepairInfo(@Param("repairNote")String repairNote,@Param("bid")int bid,@Param("did")int did);//添加维修消息
	
	@Select("select repairid,repairNote,bid,did,rid from repairInfo where rid=#{rid}")
	@ResultType(RepairInfo.class)
	public List<RepairInfo> queryRidRepairInfo(@Param("rid")int rid);//根据维修人员编号查找对应的宿舍维修信息
	
	@Delete("delete from repairInfo where repairid=#{repairid}")
	public int deleteRepairInfo(@Param("repairid")int repairid);//清除维修信息
	
}
