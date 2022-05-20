package com.zhbit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.StudentAccount;
import com.zhbit.service.StuBedService;

@Controller
@RequestMapping("StuBedController")
public class StuBedController {
	
	@Autowired
	public StuBedService sbs;
	
	@RequestMapping(value="/StuWithoutBed",method=RequestMethod.GET)
	public String queryStuWithoutBed(HttpServletRequest request,@RequestParam("bedNo")int bedNo) {
		List<StudentAccount> stuList = sbs.queryStuWithoutBed();
		HttpSession session = request.getSession();
		session.setAttribute("bedNo", bedNo);
		request.setAttribute("stuList", stuList);
		return "ManagerView/AddStuToBed";
	}
	
	@RequestMapping(value="/AssignStuToBed",method=RequestMethod.POST)
	public String AssignStuToBed(HttpServletRequest request,@RequestParam("stuID")int studentID,
			@RequestParam("buildingID")int buildingID,@RequestParam("dormitoryID")int dormitoryID,
			@RequestParam("bedNo")int bedNo) {
		int result = sbs.addStuToBed(studentID,buildingID,dormitoryID,bedNo);
		HttpSession session = request.getSession();
		int bid = (int) session.getAttribute("bid");
		int did = (int) session.getAttribute("did");
		if(result>0) {
			session.setAttribute("addStuSuccess","成功把ID为"+studentID+"的学生分配到"+buildingID+"栋"+dormitoryID+"室"+bedNo+"号床");
		}else {
			session.setAttribute("addStuError","ID为"+studentID+"的学生分配到"+buildingID+"栋"+dormitoryID+"室"+bedNo+"号床失败！");
		}
		return "redirect:/dormitoryController/findBed?bid="+bid+"&did="+did;
	}
	
	@RequestMapping(value="/StuLeave",method=RequestMethod.GET)
	public String StuLeave(HttpServletRequest request,@RequestParam("sid")int sid) {
		int result = sbs.StuLeave(sid);
		HttpSession session = request.getSession();
		int bid = (int) session.getAttribute("bid");
		int did = (int) session.getAttribute("did");
		if(result>0) {
			session.setAttribute("deleteStuSuccess","ID为"+sid+"的学生搬离！");
		}else {
			session.setAttribute("deleteStuError","ID为"+sid+"的学生数据搬离失败");
		}
//		return "ManagerView/Bed";
		return "redirect:/dormitoryController/findBed?bid="+bid+"&did="+did;
	}
	
	@RequestMapping(value="/ExchangeBed",method=RequestMethod.GET)
	public String ExchangeBed(HttpServletRequest request,@RequestParam("bedNo")int bedNo,@RequestParam("sid")int sid) {
		List<StudentAccount> stuList = sbs.queryAllStu(sid);
		HttpSession session = request.getSession();
		session.setAttribute("bedNo", bedNo);
		session.setAttribute("sid", sid);
		request.setAttribute("AllstuList", stuList);
		return "ManagerView/ExchangeBeds";
	}
	
	@RequestMapping(value="/StuExchangeBed",method=RequestMethod.POST)
	public String StuExchangeBed(HttpServletRequest request,HttpSession session,@RequestParam("stuID")int stu1) {
		int stu2 = (int)session.getAttribute("sid");
		int bid = (int) session.getAttribute("bid");
		int did = (int) session.getAttribute("did");
		int bid1 = 0,bid2 = 0,did1 = 0,did2 = 0,bedNo1 = 0,bedNo2 = 0;
		List<StudentAccount> list1 = sbs.findStuWithID(stu1);
		List<StudentAccount> list2 = sbs.findStuWithID(stu2);
		for(StudentAccount sa:list1) {
			bid1 = sa.getBid();
			did1 = sa.getDid();
			bedNo1 = sa.getBedNo();
		}
		for(StudentAccount sa:list2) {
			bid2 = sa.getBid();
			did2 = sa.getDid();
			bedNo2 = sa.getBedNo();
		}
		int result1 = sbs.StuLeave(stu1);
		int result2 = sbs.StuLeave(stu2);
		int result3 = sbs.addStuToBed(stu1,bid2,did2,bedNo2);
		int result4 = sbs.addStuToBed(stu2,bid1,did1,bedNo1);
		if(result1>0&&result2>0&&result3>0&&result4>0) {
			session.setAttribute("exchangeResult","ID为"+stu1+"与ID为"+stu2+"的学生交换床位成功！");
		}else {
			session.setAttribute("exchangeResult","ID为"+stu1+"与ID为"+stu2+"的学生交换床位失败！");
		}
		return "redirect:/dormitoryController/findBed?bid="+bid+"&did="+did;
	}
}
