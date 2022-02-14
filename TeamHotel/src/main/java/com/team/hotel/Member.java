package com.team.hotel;

public class Member {
	private String userid;
	private String passcode;
	private int user_type;
	
	public Member() {
	}

	public Member(String userid, String passcode, int user_type) {
		this.userid = userid;
		this.passcode = passcode;
		this.user_type = user_type;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasscode() {
		return passcode;
	}

	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	
}
