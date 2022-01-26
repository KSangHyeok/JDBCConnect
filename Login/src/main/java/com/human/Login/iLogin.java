package com.human.Login;

import java.util.ArrayList;

public interface iLogin {
	void insertSignon(String name,String gender,String userid,String passcode,String interest);
	ArrayList<Member> getLogin();
	void updateLogin(String userid);
	void updateLogout(String userid);
}
