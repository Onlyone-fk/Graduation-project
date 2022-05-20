package com.zhbit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zhbit.pojo.Items;
import com.zhbit.service.ItemsService;

@Controller
@RequestMapping("/itemsController")
public class ItemsController {
	@Autowired
	public ItemsService is;
	@Autowired
	public Items items;
	
	@RequestMapping(value="/lostItems",method=RequestMethod.GET)
	public String lostItems(HttpServletRequest request,HttpSession session) {
		List<Items> itemsList = is.lostItems();
		session.setAttribute("itemsList", itemsList);
		return "ManagerView/items";
	}
	
	@RequestMapping(value="/changeNotes")
	public String changeNotes(HttpServletRequest request,@RequestParam("notes")String notes,@RequestParam("itemsid")int itemsid) {
		int result = is.updateNotes(notes,itemsid);
		if(result>0) {
			request.setAttribute("updateSuccess","修改成功");
		}else {
			request.setAttribute("updateErr","修改失败");
		}
		return "redirect:/itemsController/lostItems";
	}
	
	@RequestMapping(value="/stuchangeNotes")
	public String stuchangeNotes(HttpServletRequest request,@RequestParam("notes")String notes,
			@RequestParam("itemsid")int itemsid) {
		int result = is.updateNotes(notes,itemsid);
		if(result>0) {
			request.setAttribute("updateSuccess","修改成功");
		}else {
			request.setAttribute("updateErr","修改失败");
		}
		return "redirect:/itemsController/stulostItems";
	}
	
	@RequestMapping(value="/addItems",method=RequestMethod.POST)
	public String addItemss(HttpServletRequest request,@RequestParam("itemsName")String itemsName,
			@RequestParam("notes")String notes,@RequestParam("sid")int sid) {
		int result = is.addItems(itemsName, notes, sid);
		if(result>0) {
			request.setAttribute("addSuccess","添加成功");
		}else {
			request.setAttribute("addErr","添加失败");
		}
		return "redirect:/itemsController/lostItems";
	}
	
	@RequestMapping(value="/stulostItems",method=RequestMethod.GET)
	public String stulostItems(HttpServletRequest request,HttpSession session) {
		List<Items> itemsList = is.lostItems();
		session.setAttribute("itemsList", itemsList);
		return "StudentView/items";
	}
	
	@RequestMapping(value="/renewStatus",method=RequestMethod.GET)
	public String renewStatus(HttpServletRequest request,@RequestParam("itemsid")int itemsid) {
		int result = is.renewStatus(itemsid);
		if(result>0) {
			request.setAttribute("renew","更新成功");
		}else {
			request.setAttribute("renewErr","更新失败");
		}
		return "redirect:/itemsController/lostItems";
	}
	
	@RequestMapping(value="/addstuItems",method=RequestMethod.POST)
	public String addstuItems(HttpServletRequest request,@RequestParam("itemsName")String itemsName,
			@RequestParam("notes")String notes,@RequestParam("sid")int sid) {
		int result = is.addItems(itemsName, notes, sid);
		if(result>0) {
			request.setAttribute("addSuccess","添加成功");
		}else {
			request.setAttribute("addErr","添加失败");
		}
		return "redirect:/itemsController/stulostItems";
	}
	
	@RequestMapping(value="/deletestuItems",method=RequestMethod.GET)
	public String deletestuItems(HttpServletRequest request,@RequestParam("itemsid")int itemsid) {
		int result = is.Returned(itemsid);
		if(result>0) {
			request.setAttribute("delSuccess","清除成功");
		}else {
			request.setAttribute("delErr","清除失败");
		}
		return "redirect:/itemsController/stulostItems";
	}
}
