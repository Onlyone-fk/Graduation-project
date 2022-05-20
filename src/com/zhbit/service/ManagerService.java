package com.zhbit.service;

import com.zhbit.pojo.*;

public interface ManagerService {
	public ManagerAccount managerlogin(ManagerAccount ma);//宿管登录
	public StudentAccount studentlogin(StudentAccount sa);//学生登录
	public RepairAccount repairlogin(RepairAccount ra);
//	public int managerRegister(ManagerAccount ma);//宿管注册
	public int studentRegister(StudentAccount sa);//学生注册
	public int repairRegister(RepairAccount ra);
}
