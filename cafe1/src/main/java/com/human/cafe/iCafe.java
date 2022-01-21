package com.human.cafe;

import java.util.ArrayList;

public interface iCafe {
	ArrayList<Menu> getMenuList();
	void insertMenu(String name,int price);
	void updateMenu(int code, String name,int price);
	void deleteMenu(int code);
}
