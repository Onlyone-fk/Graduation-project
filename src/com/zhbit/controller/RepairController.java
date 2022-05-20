package com.zhbit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.RepairAccount;
import com.zhbit.pojo.RepairInfo;
import com.zhbit.service.RepairService;

@Controller
@RequestMapping(value="repairController")
public class RepairController {
	@Autowired
	private RepairAccount repair;
	@Autowired
	private RepairInfo rinfo;
	@Autowired
	private RepairService rs;
	
	@RequestMapping(value="/queryAllRepair")
	public String queryAllRepair(HttpServletRequest request) {
		List<RepairInfo> repairinfoList = rs.queryAllRepairInfo();
		List<RepairAccount> repairList = rs.queryRepair();
		request.setAttribute("repairInfo", repairinfoList);
		request.setAttribute("repairlist", repairList);
		return "ManagerView/repairInfo";
	}
	
	@RequestMapping(value="/assignRepair")
	public String assignRepair(HttpServletRequest request,@RequestParam("repairid")int repairid,@RequestParam("rid")int rid) {
		int result = rs.assignBed(repairid, rid);
		if(result>0) {
			request.setAttribute("assignSu","分配成功");
		}else {
			request.setAttribute("assignEr","分配失败");
		}
		return "redirect:/repairController/queryAllRepair";
	}
	
	@RequestMapping(value="/querySidRepair")
	public String querySidRepair(HttpServletRequest request,@RequestParam("sid")int sid) {
		List<RepairInfo> repairinfoList = rs.querySidRepairInfo(sid);
		HttpSession session = request.getSession();
		session.setAttribute("sid", sid);
		request.setAttribute("repairInfo", repairinfoList);
		return "StudentView/repairInfo";
	}
	
	@RequestMapping(value="/addRepairs",method=RequestMethod.POST)
	public String addRepairs(HttpServletRequest request,@RequestParam("repairNote")String repairNote,
			@RequestParam("bid")int bid,@RequestParam("did")int did) {
		HttpSession session = request.getSession();
		int sid = (Integer)session.getAttribute("sid");
		int result = rs.addRepairInfo(repairNote, bid, did);
		if(result>0) {
			request.setAttribute("addSuccess","添加成功");
		}else {
			request.setAttribute("addErr","添加失败");
		}
		return "redirect:/repairController/querySidRepair?sid="+sid;
	}
	
	@RequestMapping(value="/queryRidRepair")
	public String queryRidRepair(HttpServletRequest request,@RequestParam("rid")int rid) {
		List<RepairInfo> repairinfoList = rs.queryRidRepairInfo(rid);
		request.setAttribute("repairInfo", repairinfoList);
		return "RepairView/repairInfo";
	}
	
	@RequestMapping(value="/delRepairs",method=RequestMethod.GET)
	public String deleteRepairs(HttpServletRequest request,@RequestParam("repairid")int repairid) {
		HttpSession session = request.getSession();
		int rid = (Integer)session.getAttribute("RepairID");
		int result = rs.deleteRepairInfo(repairid);
		if(result>0) {
			request.setAttribute("delSuccess","删除成功");
		}else {
			request.setAttribute("delErr","删除失败");
		}
		return "redirect:/repairController/queryRidRepair?rid="+rid;
	}
	
}
