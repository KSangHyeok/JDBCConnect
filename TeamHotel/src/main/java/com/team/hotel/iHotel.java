package com.team.hotel;

import java.util.ArrayList;

public interface iHotel {
	ArrayList<Typelist> gettype();
	ArrayList<Roomlist> getroom(int type_code,String start_dt,String end_dt,int howmany);
	ArrayList<Roomlist> getroomname(int type);
	ArrayList<Booklist> getbook();
	void insertbook(int room_code, String start_dt, String end_dt, int howmany, int howmuch, String booker, String mobile);
	void deletebook(int book_id);
	//승쨩
		void addType(String type_name);
	   void addRoom(String name, int type, int howmany, int howmuch);
	   void delType(int type_code);
	   void delRoom(int room_code);
	   void updType(int type_code,String type_name);
	   void updRoom(int room_code,String name,int type, int howmany, int howmuch);
	   
	   ArrayList<roomtypeDTO> selType();
	   ArrayList<roomDTO> selRoom();
}
