package com.zhbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhbit.dao.DormitoryDao;
import com.zhbit.pojo.Bed;
import com.zhbit.pojo.Building;
import com.zhbit.pojo.Dormitory;
import com.zhbit.pojo.StudentAccount;
import com.zhbit.service.DormitoryService;
@Service("dormitoryService")
public class DormitoryServiceImpl implements DormitoryService {
	@Autowired
	private DormitoryDao dd;
	@Override
	public List<Building> findBuilding(int mid) {
		return dd.findBuilding(mid);
	}

	@Override
	public List<Dormitory> findDormitory(int bid) {
		return dd.findDormitory(bid);
	}

	@Override
	public List<Bed> findBed(int did) {
		return dd.findBed(did);
	}

	@Override
	public List<StudentAccount> findBedToStudent(int bid,int did,int bedNo) {
		return dd.findBedToStudent(bid,did,bedNo);
	}

	@Override
	public int HealthScoreOfDormitory(int bid,int did) {
		return dd.HealthScoreOfDormitory(bid,did);
	}

	@Override
	public int DoinghealthScore(int score, int bid, int did) {
		return dd.DoinghealthScore(score, bid, did);
	}

	@Override
	public List<Integer> findDormitoryToStu(int bid, int did) {
		return dd.findDormitoryToStu(bid, did);
	}

	@Override
	public List<Building> findStuToBuilding(int sid) {
		return dd.findStuToBuilding(sid);
	}

	@Override
	public List<Dormitory> findStuToDormitory(int sid) {
		return dd.findStuToDormitory(sid);
	}

}
