package com.neo.ssm.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.neo.ssm.bean.Employee;

/**
 * spring 单元测试
 * @author Administrator
 *需要spring和spring mvc的配置文件
 * @param <WebAppContextSetup>
 * spring test 需要servlet-API 3.0 以上支持
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/spring-servlet.xml"})
public class MvcTest {

	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc(){
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPageHelp() throws Exception{
		//模拟一个mvc请求，并拿到他的返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageHelp", "1"))
				.andReturn();
		//请求成功后能拿到pageInfo
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		
		System.out.println("当前页码："+pi.getPageNum());
		System.out.println("当前页大小："+pi.getPageSize());
		System.out.println("总页数："+pi.getPages());
		System.out.println("总记录数："+pi.getTotal());
		
		int[] nums = pi.getNavigatepageNums();
		for (int i : nums) {
			System.out.println(" "+i);
		}
		
		List<Employee> list = pi.getList();
		for (Employee employee : list) {
			System.out.println("id:"+employee.getEmpId()+" " +"name:"+employee.getEmpName());
		}
	}
	
}
