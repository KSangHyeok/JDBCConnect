package com.team.hotel;

public class Roombook {
	private int room_code;
	private String name;
	private int type;	
	private int howmuch;
	private String type_name;
	public Roombook() {
	}
	public Roombook(int room_code, String name, int type, int howmuch, String type_name) {
		this.room_code = room_code;
		this.name = name;
		this.type = type;
		this.howmuch = howmuch;
		this.type_name = type_name;
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
	public int getHowmuch() {
		return howmuch;
	}
	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
}
