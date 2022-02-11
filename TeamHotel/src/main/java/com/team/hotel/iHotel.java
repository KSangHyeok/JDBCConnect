package com.team.hotel;

import java.util.ArrayList;

public interface iHotel {
	ArrayList<Typelist> gettype();
	ArrayList<Roomlist> getroom(int type_code);
	ArrayList<Roomlist> getroomname(int type);
	ArrayList<Booklist> getbook();
}
