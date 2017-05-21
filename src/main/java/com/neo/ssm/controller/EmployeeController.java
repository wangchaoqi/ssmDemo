package com.neo.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neo.ssm.bean.Employee;
import com.neo.ssm.service.EmployeeService;

/**
 * 
 * @author Administrator
 *
 *处理员工列表增删改查
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	/**
	 * 分页查询员工
	 * @return
	 */
	@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pageNumber" ,defaultValue="1") Integer pageNumber,Model model){
		//引入分页插件pageHelp,页码，每页数量
		PageHelper.startPage(pageNumber, 5);
		List<Employee> emps = employeeService.getAll();
		//使用pageinfo封装查询信息，将pageInfo交给页面就可以了,连续查询5页
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}
	
}
