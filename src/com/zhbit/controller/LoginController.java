package com.zhbit.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.*;
import com.zhbit.service.ManagerService;

@Controller
@RequestMapping(value="LoginController")
public class LoginController {
	@Autowired
	private ManagerService ms;
	@Autowired
	private ManagerAccount ma;
	@Autowired
	private StudentAccount sa;
	@Autowired
	private RepairAccount ra;
	
	//登录页面
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request,@RequestParam("identity")String identity,
			@RequestParam("userName")String userName,@RequestParam("userPwd")String userPwd) {
		HttpSession session = (HttpSession)request.getSession();
		//System.out.println(identity+" "+userName+" "+userPwd);
		if("manager".equals(identity)) {
			ma.setMname(userName);
			ma.setPwd(userPwd);
			ManagerAccount ma1 = ms.managerlogin(ma);
//			System.out.println(ma1);
			if(ma1==null) {
				session.setAttribute("loginError","用户名或密码错误！");
				return "login/ManagerLogin";
			}
			else {
				session.setAttribute("loginStatus", "loginSussesful");
				session.setAttribute("managerInfo", ma1);
				session.setAttribute("managerID", ma1.getMid());
				return "ManagerView/ManagerIndex";
			}
		}else if("student".equals(identity)) {
			sa.setSname(userName);
			sa.setPwd(userPwd);
			StudentAccount sa1 = ms.studentlogin(sa);
			if(sa1==null) {
				session.setAttribute("loginError","用户名或密码错误！");
				return "login/ManagerLogin";
			}else {
				session.setAttribute("loginError", "loginSussesful");
				session.setAttribute("studentInfo", sa1);
				session.setAttribute("studentID", sa1.getSid());
				return "/StudentView/StudentIndex";
			}
		}else {
			ra.setRname(userName);
			ra.setPwd(userPwd);
			RepairAccount ra1 = ms.repairlogin(ra);
			if(ra1==null) {
				session.setAttribute("loginError","用户名或密码错误！");
				return "login/ManagerLogin";
			}else {
				session.setAttribute("loginError", "loginSussesful");
				session.setAttribute("repairPeople", ra1);
				session.setAttribute("RepairID", ra1.getRid());
				return "/RepairView/RepairIndex";
			}
		}
		
	}
	
	
}
