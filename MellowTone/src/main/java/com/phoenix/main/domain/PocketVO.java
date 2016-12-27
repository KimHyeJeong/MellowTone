package com.phoenix.main.domain;

public class PocketVO {
	private int no;
	private String id;
	private int count;
	private int price;
	private String name;
	private int total;
	private String url;
	
	public PocketVO() {
		// TODO Auto-generated constructor stub
	}

	public PocketVO(int no, String id, int count, int price, String name, int total, String url) {
		super();
		this.no = no;
		this.id = id;
		this.count = count;
		this.price = price;
		this.name = name;
		this.total = total;
		this.url = url;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
