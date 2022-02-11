package com.team.hotel;

public class Booklist {
	private int book_id;
	private int room_code;
	private String start_dt;
	private String end_dt;
	private int howmany;
	private int howmuch;
	private String booker;
	private String mobile;
	private String name;
	public Booklist() {
	}
	public Booklist(int book_id, int room_code, String start_dt, String end_dt, int howmany, int howmuch, String booker,
			String mobile, String name) {
		this.book_id = book_id;
		this.room_code = room_code;
		this.start_dt = start_dt;
		this.end_dt = end_dt;
		this.howmany = howmany;
		this.howmuch = howmuch;
		this.booker = booker;
		this.mobile = mobile;
		this.name = name;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public int getHowmany() {
		return howmany;
	}
	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public String getBooker() {
		return booker;
	}
	public void setBooker(String booker) {
		this.booker = booker;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
