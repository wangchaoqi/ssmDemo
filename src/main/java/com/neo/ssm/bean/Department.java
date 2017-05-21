package com.neo.ssm.bean;

public class Department {
    private Integer deptId;

    private String deptName;

    
    
    public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

    //创建有参构造器时，一定要创建无参构造器
	public Department(Integer deptId, String deptName) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}