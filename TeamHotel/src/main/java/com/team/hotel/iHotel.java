package com.team.hotel;

import java.util.ArrayList;

public interface iHotel {
	void Addbook(int room_code,String start_dt,String end_dt,int howmany,int howmuch,String booker,String mobile);
	ArrayList<Typelist> gettype();
	ArrayList<Roomlist> getroom(int type_code,String start_dt,String end_dt,int howmany);
	ArrayList<Roombook> getroombook(int type_code,String start_dt,String end_dt,int howmany);
	ArrayList<Roomlist> getroomname(int type);
	ArrayList<Booklist> getbook();
	ArrayList<Roomlist> getmuch(int room_code);
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
	//김유진씨
	   Member idcheck(String userid);
		Member usercheck(String userid);
		void insertMember(String userid,String passcode,String name,String mobile);
		void deleteMember(String userid);
		void loginMember(String userid);
		void logoutMember(String userid);
//		회원가입/회원탈퇴/로그인/로그아웃
	//지명은씨
		ArrayList<Board> getBoardList(int start,int end);
		Board getPost(int post_code);		
		int getTotal();
		void addBoard(String title, String content); //insert
		void updateBoard(int post_code, String title, String content);//update
		void deleteBoard(int post_code); //delete
}
