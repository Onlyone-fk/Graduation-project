package com.zhbit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhbit.dao.StuBedDao;
import com.zhbit.pojo.StudentAccount;
import com.zhbit.service.StuBedService;
@Service
public class StuBedServiceImpl implements StuBedService {
	@Autowired
	private StuBedDao sbd;
	@Override
	public List<StudentAccount> queryStuWithoutBed() {
		return sbd.queryStuWithoutBed();
	}
	@Override
	public int addStuToBed(int sid, int bid, int did, int bedNo) {
		return sbd.addStuToBed(sid, bid, did, bedNo);
	}
	@Override
	public int StuLeave(int sid) {
		return sbd.StuLeave(sid);
	}
	@Override
	public List<StudentAccount> queryAllStu(int sid) {
		return sbd.queryAllStu(sid);
	}
	@Override
	public List<StudentAccount> findStuWithID(int sid) {
		return sbd.findStuWithID(sid);
	}
	

}
