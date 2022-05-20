package com.zhbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.zhbit.pojo.Bed;
import com.zhbit.pojo.Building;
import com.zhbit.pojo.Dormitory;
import com.zhbit.pojo.StudentAccount;

@Repository
public interface DormitoryDao {
	@Select("select *from Building where mid=#{mid}")
	@ResultType(Building.class)
	public List<Building> findBuilding(int mid);
	
	@Select("select d.did from dormitory d,building b,building_dormitory bd where b.bid=bd.bid and bd.did=d.did and b.bid=#{bid}")
	@ResultType(Dormitory.class)
	public List<Dormitory> findDormitory(int bid);
	
	@Select("select b.bedNo from dormitory d,bed b,dormitory_bed db where b.bedNo=db.bedNo and d.did=db.did and d.did=#{did}")
	@ResultType(Bed.class)
	public List<Bed> findBed(int did);
	
	@Select("select sl.sid,s.sname,s.sclass from building b,building_dormitory bd,dormitory d,bed e,dormitory_bed db,student_live sl,"
			+ "student s where sl.sid=s.sid and sl.bid=b.bid and sl.did=d.did and sl.bedNo=e.bedNo and b.bid=bd.bid and d.did=bd.did"
			+ " and d.did=db.did and e.bedNo=db.bedNo and b.bid=#{arg0} and d.did=#{arg1} and e.bedNo=#{arg2};")
	@ResultType(StudentAccount.class)
	public List<StudentAccount> findBedToStudent(int bid,int did,int bedNo);//查找床位对应的学生
	
	@Select("select ifnull(healthScore,0)  from building_dormitory where bid=#{bid} and did=#{did}")
	@ResultType(Integer.class)
	public int HealthScoreOfDormitory(@Param("bid")int bid,@Param("did")int did);
	
	@Update("update building_dormitory set healthScore=#{score} where bid=#{bid} and did=#{did};")
	public int DoinghealthScore(@Param("score")int score,@Param("bid")int bid,@Param("did")int did);
	
	@Select("select sid from student_live where bid=#{bid} and did=#{did}")
	@ResultType(Integer.class)
	public List<Integer> findDormitoryToStu(@Param("bid")int bid,@Param("did")int did);//查找宿舍中的学生
	
	@Select("select b.bid,b.bcall,b.mid from Building b,student_live sl where sl.sid=#{sid} and b.bid=sl.bid")
	@ResultType(Building.class)
	public List<Building> findStuToBuilding(@Param("sid")int sid);//查找学号对应的宿舍楼
	
	@Select("select d.did from dormitory d,student_live sl where sl.sid=#{sid} and d.did=sl.did")
	@ResultType(Dormitory.class)
	public List<Dormitory> findStuToDormitory(@Param("sid")int sid);//查找学号对应的宿舍
}
