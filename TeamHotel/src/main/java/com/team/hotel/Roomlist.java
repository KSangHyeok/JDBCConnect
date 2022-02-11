package com.team.hotel;

public class Roomlist {
	private int room_code;
	private String name;
	private int type;
	private int howmany;
	private int howmuch;
	public Roomlist() {
	}
	public Roomlist(int room_code, String name, int type, int howmany, int howmuch) {
		this.room_code = room_code;
		this.name = name;
		this.type = type;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public int getRoom_code() {
		return room_code;
	}
	public void setRoom_code(int room_code) {
		this.room_code = room_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
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
