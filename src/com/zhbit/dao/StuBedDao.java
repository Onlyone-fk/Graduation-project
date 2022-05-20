package com.zhbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.zhbit.pojo.StudentAccount;

@Repository
public interface StuBedDao {
	
	@Select("select *from student_live where sid=#{sid}")
	@ResultType(StudentAccount.class)
	public List<StudentAccount> findStuWithID(@Param("sid")int sid);
	
	@Select("select *from student s where(select count(1) from student_live sl where s.sid=sl.sid)=0")
	@ResultType(StudentAccount.class)
	public List<StudentAccount> queryStuWithoutBed();
	
	@Insert("insert into student_live(sid,bid,did,bedNo) values(#{stuID},#{buildingID},#{dormitoryID},#{bedNo});")
	public int addStuToBed(@Param("stuID")int sid,@Param("buildingID")int bid,@Param("dormitoryID")int did,@Param("bedNo")int bedNo);//床位添加学生
	
	@Delete("delete from student_live where sid=#{sid}")
	public int StuLeave(int sid);//学生搬离宿舍
	
	@Select("select sl.sid,s.sname,s.sclass from student_live sl,student s where sl.sid=s.sid and sl.sid!=#{sid}")
	@ResultType(StudentAccount.class)
	public List<StudentAccount> queryAllStu(@Param("sid")int sid);
	
}
