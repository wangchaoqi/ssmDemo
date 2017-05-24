package com.neo.ssm.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    private String empSex;

    @Pattern(regexp="(^[a-z0-9_-]{6,16}$)|(^[\u2e80-\u9fff]{2,5})",message="用户名错误")
    private String empName;

    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message="邮箱错误")
    private String email;

    private Integer dId;

    
    
    public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(Integer empId, String empSex, String empName, String email,
			Integer dId) {
		super();
		this.empId = empId;
		this.empSex = empSex;
		this.empName = empName;
		this.email = email;
		this.dId = dId;
	}

	private Department department;
    
    public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex == null ? null : empSex.trim();
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}