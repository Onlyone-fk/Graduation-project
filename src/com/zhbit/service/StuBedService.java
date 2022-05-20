package com.zhbit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhbit.pojo.StudentAccount;

public interface StuBedService {
	public List<StudentAccount> findStuWithID(int sid);
	
	public List<StudentAccount> queryStuWithoutBed();
	
	public int addStuToBed(int sid,int bid,int did,int bedNo);//床位添加学生
	
	public int StuLeave(int sid);//学生搬离宿舍
	
	public List<StudentAccount> queryAllStu(int sid);
	
}
