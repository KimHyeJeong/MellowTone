package com.phoenix.community.domain;

import java.util.Date;

public class BoardVO {
	 private int bno;
	 private int tno;
	 private String title;
	 private String content;
	 private String image;
	 private int replycnt;
	 private String writer;
	 private Date regdate;
	 private int viewcnt;
	 
	 
	 
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", tno=" + tno + ", title=" + title + ", content=" + content + ", image=" + image
				+ ", replycnt=" + replycnt + ", writer=" + writer + ", regdate=" + regdate + ", viewcnt=" + viewcnt
				+ "]";
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getTno() {
		return tno;
	}
	public void setTno(int tno) {
		this.tno = tno;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	 

}
