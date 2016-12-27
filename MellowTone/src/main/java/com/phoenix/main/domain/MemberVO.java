package com.phoenix.main.domain;

public class MemberVO {
	private int no;
	private String id;
	private String password;
	private String password_ck;
	private String name;
	private String post;
	private String address1;
	private String address2;
	private String phone;
	private String email;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int no, String id, String password, String password_ck, String name, String post, String address1,
			String address2, String phone, String email) {
		super();
		this.no = no;
		this.id = id;
		this.password = password;
		this.password_ck = password_ck;
		this.name = name;
		this.post = post;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_ck() {
		return password_ck;
	}

	public void setPassword_ck(String password_ck) {
		this.password_ck = password_ck;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
