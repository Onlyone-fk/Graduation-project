package com.zhbit.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.zhbit.pojo.ManagerAccount;
import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.StudentAccount;
@Repository
public interface ManagerDao {
	@Select("select *from Manager where mname=#{mname} and pwd=#{pwd}")
	@ResultType(ManagerAccount.class)
	public ManagerAccount managerlogin(ManagerAccount ma);
	
	@Select("select *from Student where sname=#{sname} and pwd=#{pwd}")
	@ResultType(StudentAccount.class)
	public StudentAccount studentlogin(StudentAccount sa);
	
	@Select("select *from repair where rname=#{rname} and pwd=#{pwd}")
	@ResultType(StudentAccount.class)
	public RepairAccount repairlogin(RepairAccount ra);
	
//	@Insert("insert into manager(mname,pwd) values(#{mname},#{pwd})")
//	public int managerRegister(ManagerAccount ma);
	
	@Insert("insert into student(sname,sclass,pwd) values(#{sname},#{sclass},#{pwd})")
	public int studentRegister(StudentAccount ma);
	
	@Insert("insert into repair(rname,pwd) values(#{rname},#{pwd})")
	public int repairRegister(RepairAccount ra);
}
