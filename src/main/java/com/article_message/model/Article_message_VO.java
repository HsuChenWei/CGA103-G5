package com.article_message.model;

import java.sql.Timestamp;

public class Article_message_VO implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer art_msg_no;
	private Integer mem_no;
	private Integer frm_art_no;
	private Timestamp msg_time;
	private String msg_content;
	public Integer getArt_msg_no() {
		return art_msg_no;
	}
	public void setArt_msg_no(Integer art_msg_no) {
		this.art_msg_no = art_msg_no;
	}
	public Integer getMem_no() {
		return mem_no;
	}
	public void setMem_no(Integer mem_no) {
		this.mem_no = mem_no;
	}
	public Integer getFrm_art_no() {
		return frm_art_no;
	}
	public void setFrm_art_no(Integer frm_art_no) {
		this.frm_art_no = frm_art_no;
	}
	public Timestamp getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Timestamp msg_time) {
		this.msg_time = msg_time;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	
	
}