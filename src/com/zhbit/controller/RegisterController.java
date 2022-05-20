package com.zhbit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.*;
import com.zhbit.service.ManagerService;

@Controller
@RequestMapping(value="RegisterController")
public class RegisterController {
	@Autowired
	private ManagerService ms;
	@Autowired
	private RepairAccount ra;
	@Autowired
	private StudentAccount sa;
	//注册
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String register(HttpServletRequest request,@RequestParam("Registeridentity")String identity,
			@RequestParam("userName")String userName,@RequestParam("userClass")String userClass,@RequestParam("userPwd")String userPwd) {
		HttpSession session = (HttpSession)request.getSession();
		if("repair".equals(identity)) {
			ra.setRname(userName);
			ra.setPwd(userPwd);
			int result = ms.repairRegister(ra);
			if(result>0) {
				session.setAttribute("Register", "successful");
				return "/login/ManagerLogin";
			}else {
				session.setAttribute("Register", "fail");
				return "/login/ManagerLogin";
			}
		}else {
			sa.setSname(userName);
			sa.setSclass(userClass);
			sa.setPwd(userPwd);
			int result = ms.studentRegister(sa);
			if(result>0) {
				session.setAttribute("Register", "successful");
				return "/login/ManagerLogin";
			}else {
				session.setAttribute("Register", "fail");
				return "/login/ManagerLogin";
			}
		}
		
	}

}
