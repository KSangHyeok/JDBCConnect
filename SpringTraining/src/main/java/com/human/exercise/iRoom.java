package com.human.exercise;

public class iRoom {
	private int code;
	private String roomname;
	private String name;
	private int howmany;
	private int howmuch;
	public iRoom() {
	}
	public iRoom(int code, String roomname, String name, int howmany, int howmuch) {
		this.code = code;
		this.roomname = roomname;
		this.name = name;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	
}
