package com.human.exercise;

public class Emp {
	private int employee_id;
	private String emp_name;
	private String phone_number;
	private String hire_date;
	private String manager_id;
	public Emp() {
	}
	public Emp(int employee_id, String emp_name, String phone_number, String hire_date, String manager_id) {
		this.employee_id = employee_id;
		this.emp_name = emp_name;
		this.phone_number = phone_number;
		this.hire_date = hire_date;
		this.manager_id = manager_id;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
}
