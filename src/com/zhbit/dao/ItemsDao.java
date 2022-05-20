package com.zhbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.zhbit.pojo.Items;

@Repository
public interface ItemsDao {
	@Select("select i.itemsid,i.itemsName,i.sid,s.bid,s.did,s.bedNo,i.notes,i.itemstatus from items i,student_live s where i.sid=s.sid")
	@ResultType(Items.class)
	public List<Items> lostItems();
	
	@Update("update items set notes=#{notes} where itemsid=#{itemsid}")
	public int updateNotes(@Param("notes")String notes,@Param("itemsid")int itemsid);
	
	@Insert("insert into items(itemsName,notes,sid) values(#{itemsName},#{notes},#{sid})")
	public int addItems(@Param("itemsName")String itemsName,@Param("notes")String notes,@Param("sid")int sid);
	
	@Delete("delete from items where itemsid=#{itemsid}")
	public int Returned(@Param("itemsid")int itemsid);//已归还的物品就清除有关信息
	
	@Update("update items set itemstatus='已找到' where itemsid=#{itemsid}")
	public int renewStatus(@Param("itemsid")int itemsid);
}
