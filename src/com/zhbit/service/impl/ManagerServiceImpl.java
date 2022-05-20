package com.zhbit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhbit.dao.ManagerDao;
import com.zhbit.pojo.ManagerAccount;
import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.StudentAccount;
import com.zhbit.service.ManagerService;
@Service("managerService")
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDao md;
	@Override
	public ManagerAccount managerlogin(ManagerAccount ma) {//宿管登录
		return md.managerlogin(ma);
	}
	@Override
	public StudentAccount studentlogin(StudentAccount sa) {//学生登录
		return md.studentlogin(sa);
	}
	
	@Override
	public int studentRegister(StudentAccount sa) {
		return md.studentRegister(sa);
	}
	@Override
	public int repairRegister(RepairAccount ra) {
		return md.repairRegister(ra);
	}
	@Override
	public RepairAccount repairlogin(RepairAccount ra) {
		// TODO Auto-generated method stub
		return md.repairlogin(ra);
	}
}
