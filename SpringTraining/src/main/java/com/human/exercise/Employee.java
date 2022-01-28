package com.human.exercise;

public class Employee {
	private int employee_id;
	private String emp_name;
	private String email;
	private String phone_number;
	private String hire_date;
	private int salary;
	public Employee() {
		
	}
	public Employee(int employee_id, String emp_name, String email, String phone_number, String hire_date, int salary) {
		super();
		this.employee_id = employee_id;
		this.emp_name = emp_name;
		this.email = email;
		this.phone_number = phone_number;
		this.hire_date = hire_date;
		this.salary = salary;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}	
}
