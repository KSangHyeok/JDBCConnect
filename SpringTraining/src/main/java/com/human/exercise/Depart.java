package com.human.exercise;

public class Depart {
	private int id;
	private String pname;
	private String ppname;
	private String name;
	public Depart() {
	}
	public Depart(int id, String pname, String ppname, String name) {
		this.id = id;
		this.pname = pname;
		this.ppname = ppname;
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPpname() {
		return ppname;
	}
	public void setPpname(String ppname) {
		this.ppname = ppname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
