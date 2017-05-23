package com.neo.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neo.ssm.bean.Department;
import com.neo.ssm.bean.Msg;
import com.neo.ssm.service.DepartmentService;

/**
 * 处理部门信息请求
 * @author Administrator
 *
 */
@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@ResponseBody
	@RequestMapping("/depts")
	public  Msg getDepts(){
	
		List<Department> list = departmentService.getDepts();
		return Msg.success().and("depts", list);
	}
}
