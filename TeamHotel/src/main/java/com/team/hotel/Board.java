package com.team.hotel;

public class Board {
	private int post_code;
	private String title;
	private String content;
	private String created;
	public Board(int post_code, String title, String content, String created) {
		this.post_code = post_code;
		this.title = title;
		this.content = content;
		this.created = created;
	}
	public Board() {
	}
	public int getPost_code() {
		return post_code;
	}
	public void setPost_code(int post_code) {
		this.post_code = post_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	
	
}
