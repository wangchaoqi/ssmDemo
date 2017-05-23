package com.neo.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neo.ssm.bean.Employee;
import com.neo.ssm.bean.Msg;
import com.neo.ssm.dao.EmployeeMapper;
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
	 * 改造后的ajax方法
	 * @param pageNumber
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/emps")
	public Msg getEmpsWithJson(@RequestParam(value="pageNumber" ,defaultValue="1") Integer pageNumber,Model model){
		//引入分页插件pageHelp,页码，每页数量
				PageHelper.startPage(pageNumber, 5);
				List<Employee> emps = employeeService.getAll();
				//使用pageinfo封装查询信息，将pageInfo交给页面就可以了,连续查询5页
				PageInfo page = new PageInfo(emps,5);
				return Msg.success().and("pageInfo", page);
	}
	
	/**
	 * 新增员工
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	public Msg saveEmps(Employee employee){
		employeeService.saveEmps(employee);
		return Msg.success().and("result", "ok");
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteemp/{id}",method=RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("id")Integer id){
		System.out.println("1231231313");
		employeeService.deleteEmpById(id);
		return Msg.success().and("result", "ok");
		}
	/**
	 * 分页查询员工
	 * @return
	 */
	/*@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pageNumber" ,defaultValue="1") Integer pageNumber,Model model){
		//引入分页插件pageHelp,页码，每页数量
		PageHelper.startPage(pageNumber, 5);
		List<Employee> emps = employeeService.getAll();
		//使用pageinfo封装查询信息，将pageInfo交给页面就可以了,连续查询5页
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo", page);
		return "list";
	}*/
	
}
