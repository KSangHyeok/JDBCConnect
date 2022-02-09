package com.human.exercise;

public class EmpInfo {
	private int eid;
	private String ename;
	private String mobile;
	private String dname;
	public EmpInfo() {
	}
	public EmpInfo(int eid, String ename, String mobile, String dname) {
		this.eid = eid;
		this.ename = ename;
		this.mobile = mobile;
		this.dname = dname;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
}
