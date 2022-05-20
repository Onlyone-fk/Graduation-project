package com.zhbit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhbit.pojo.Bed;
import com.zhbit.pojo.Building;
import com.zhbit.pojo.Dormitory;
import com.zhbit.pojo.StudentAccount;

public interface DormitoryService {
	
	public List<Building> findBuilding(int mid);//查找宿舍楼
	
	public List<Dormitory> findDormitory(int bid);//查找每个宿舍楼对应的宿舍
	
	public List<Bed> findBed(int did);
	
	public List<StudentAccount> findBedToStudent(int bid,int did,int bedNo);
	
	public int HealthScoreOfDormitory(int bid,int did);//查找每个宿舍的卫生评分
	
	public int DoinghealthScore(int score,int bid,int did);//进行卫生评分
	
	public List<Integer> findDormitoryToStu(int bid,int did);//查找宿舍中的学生
	
	public List<Building> findStuToBuilding(int sid);//查找学号对应的宿舍楼
	
	public List<Dormitory> findStuToDormitory(int sid);//查找学号对应的宿舍
}
