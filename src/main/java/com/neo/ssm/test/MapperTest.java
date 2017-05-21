package com.neo.ssm.test;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.neo.ssm.bean.Employee;
import com.neo.ssm.bean.EmployeeExample;
import com.neo.ssm.dao.DepartmentMapper;
import com.neo.ssm.dao.EmployeeMapper;

/**
 * 
 * @author Administrator
 *测试DeparmentDao
 *@ContextConfiguration指定spring文件的位置
 *@RunWith指定使用哪个模块的单元测试
 *sqlSession application.xml配置，批量执行sql
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
/*	@Autowired
	Employee employee;*/
	/**
	 * 测试DepartmentMapper
	 */
	@Test
	public void testC(){ 
		/*ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		DepartmentMapper bean = ctx.getBean(DepartmentMapper.class);
		System.out.println(bean);*/
//		部门数据
//		departmentMapper.insertSelective(new Department(null,"研发部"));
//		departmentMapper.insertSelective(new Department(null,"产品部"));
//		System.err.println("插入完成 ");
		
//		员工数据
//		employeeMapper.insertSelective(new Employee(null,"m","zhangsan","1273786176@qq.com",5));
	
//		批量插入，使用sqlsession
//		EmployeeMapper employee = sqlSession.getMapper(EmployeeMapper.class);
		
//		for (int i = 0; i < 1000; i++) {
//			String m;
//			String uid = (String) UUID.randomUUID().toString().subSequence(0, 5) + i;
//			if(i%2 == 0)
//			{
//				m = "m";//男
//			}else
//			{
//				m = "w";//女
//			}
//			employee.insertSelective(new Employee(null,m,uid,uid+"@qq.com",5));
//		}
//		System.err.println("插入完成");
		
		List<Employee> list = employeeMapper.selectByExampleWithDept(new EmployeeExample());
		for (Employee employee : list) {
			System.out.println("id:"+employee.getEmpId()+" " +"name:"+employee.getEmpName());

		}
	}
}
