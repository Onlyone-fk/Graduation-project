package com.zhbit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.*;
import com.zhbit.service.DormitoryService;

@Controller
@RequestMapping(value="dormitoryController")
public class DormitoryController {
	@Autowired
	public Building builing;
	@Autowired
	public Dormitory dormitory;
	@Autowired
	public DormitoryService ds;
	@RequestMapping(value="/findBuilding",method=RequestMethod.GET)
	public String queryBuilding(HttpServletRequest request,@RequestParam("mid")int mid) {
		List<Building> buildingList = ds.findBuilding(mid);
		HttpSession session = (HttpSession)request.getSession();
		session.setAttribute("BuildingList", buildingList);
		
		return "ManagerView/Building";
	}
	
	@RequestMapping(value="/findDormitory",method=RequestMethod.GET)
	public String queryDormitory(HttpServletRequest request,@RequestParam(value="bid")int bid) {
		List<Dormitory> dormitoryList = ds.findDormitory(bid);
		for(Dormitory dr:dormitoryList) {
			dr.setStu(ds.findDormitoryToStu(bid, dr.getDid()));
//			System.out.println(ds.findDormitoryToStu(bid, dr.getDid()));
		}
		HttpSession session = (HttpSession)request.getSession();
		session.setAttribute("bid", bid);
		session.setAttribute("DormitoryList", dormitoryList);
		return "ManagerView/Dormitory";
	}
	
	@RequestMapping(value="/findBed",method=RequestMethod.GET)
	public String queryBed(HttpServletRequest request,@RequestParam(value="bid")int bid,@RequestParam(value="did")int did) {
		List<Bed> bedList = ds.findBed(did);
		for(Bed beds:bedList) {
			beds.setStu(ds.findBedToStudent(bid, did, beds.getBedNo()));
		}
		HttpSession session = (HttpSession)request.getSession();
		int healthScore = ds.HealthScoreOfDormitory(bid, did);
		session.setAttribute("did", did);
		session.setAttribute("BedList", bedList);
		request.setAttribute("addStuSuccess", request.getAttribute("addStuSuccess"));
		request.setAttribute("addStuError", request.getAttribute("addStuError"));
		request.setAttribute("deleteStuSuccess", request.getAttribute("deleteStuSuccess"));
		request.setAttribute("deleteStuError", request.getAttribute("deleteStuError"));
		if(healthScore!=0) {
			session.setAttribute("HealthScore", healthScore);
		}else {
			session.setAttribute("HealthScore", "还未进行卫生评分");
		}
		return "ManagerView/Bed";
	}
	
	@RequestMapping(value="/findStuToBed",method=RequestMethod.GET)
	public String queryBedToStu(HttpServletRequest request,@RequestParam("bid")int bid,@RequestParam("did")int did,
			@RequestParam("bedNo")int bedNo) {
		HttpSession session = (HttpSession)request.getSession();
		List<StudentAccount> stuList = ds.findBedToStudent(bid, did, bedNo);
		if(stuList.isEmpty()) {
			session.setAttribute("bedNo", bedNo);
			return "ManagerView/StuNull";
		}else {
			session.setAttribute("StuList", stuList);
			return "ManagerView/StuInfo";
		}
		
	}
	@RequestMapping(value="/getScore",method=RequestMethod.GET)
	public String doingHealthScore(HttpServletRequest request,@RequestParam("score")int score,int bid,int did) {
		ds.DoinghealthScore(score, bid, did);
		
		return "redirect:/dormitoryController/findBed?bid="+bid+"&did="+did;
	}
	
	@RequestMapping(value="/querystuBuilding",method=RequestMethod.GET)
	public String querystuBuilding(HttpServletRequest request,@RequestParam(value="sid")int sid) {
		List<Building> buildingList = ds.findStuToBuilding(sid);
		HttpSession session = (HttpSession)request.getSession();
		session.setAttribute("BuildingList", buildingList);
		
		return "StudentView/Building";
	}
	
	@RequestMapping(value="/querystuDormitory",method=RequestMethod.GET)
	public String querystuDormitory(HttpServletRequest request,@RequestParam(value="sid")int sid,@RequestParam(value="bid")int bid) {
		List<Dormitory> dormitoryList = ds.findStuToDormitory(sid);
		for(Dormitory dr:dormitoryList) {
			dr.setStu(ds.findDormitoryToStu(bid, dr.getDid()));
//			System.out.println(ds.findDormitoryToStu(bid, dr.getDid()));
		}
		HttpSession session = (HttpSession)request.getSession();
		session.setAttribute("sid", sid);
		session.setAttribute("bid", bid);
		session.setAttribute("DormitoryList", dormitoryList);
		return "StudentView/Dormitory";
	}
	
	@RequestMapping(value="/queryStuBed",method=RequestMethod.GET)
	public String queryStuBed(HttpServletRequest request,@RequestParam(value="bid")int bid,@RequestParam(value="did")int did) {
		List<Bed> bedList = ds.findBed(did);
		for(Bed beds:bedList) {
			beds.setStu(ds.findBedToStudent(bid, did, beds.getBedNo()));
		}
		HttpSession session = (HttpSession)request.getSession();
		int healthScore = ds.HealthScoreOfDormitory(bid, did);
		session.setAttribute("did", did);
		session.setAttribute("BedList", bedList);
		if(healthScore!=0) {
			session.setAttribute("HealthScore", healthScore);
		}else {
			session.setAttribute("HealthScore", "还未进行卫生评分");
		}
		return "StudentView/Bed";
	}
}
