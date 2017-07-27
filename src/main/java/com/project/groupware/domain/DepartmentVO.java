package com.project.groupware.domain;

public class DepartmentVO {
	private String id;
	private String name;
	private int employeeCount;

	public DepartmentVO() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public int getEmployeeCount() {
		return employeeCount;
	}

	public void setEmployeeCount(int employeeCount) {
		this.employeeCount = employeeCount;
	}

	@Override
	public String toString() {
		return "DepartmentVO [id=" + id + ", name=" + name + ", employeeCount=" + employeeCount + "]";
	}
	
	
	

}
