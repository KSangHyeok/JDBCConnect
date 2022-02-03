package com.human.exercise;

import java.util.ArrayList;

public interface iEmp {
	ArrayList<Employee> getEmpList();	
	void addMenu(String name,int price);
	void insertRoom(String name,int type,int howmany, int howmuch);
	void insertType(int typecode,String name);
	ArrayList<iRoom> getRoom();
}
