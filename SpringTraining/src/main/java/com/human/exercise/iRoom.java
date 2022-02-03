package com.human.exercise;

public class iRoom {
	private int roomcode;
	private String name;
	private int howmany;
	private int howmuch;
	public iRoom() {
	}
	public iRoom(int roomcode, String name, int howmany, int howmuch) {
		this.roomcode = roomcode;
		this.name = name;
		this.howmany = howmany;
		this.howmuch = howmuch;
	}
	public int getRoomcode() {
		return roomcode;
	}
	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
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
