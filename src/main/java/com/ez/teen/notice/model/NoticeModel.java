package com.ez.teen.notice.model;

import java.util.Date;

public class NoticeModel {
	
	private int rn;
	private int noti_no;
	private int member_no;
	private String noti_title;
	private String noti_content;
	private Date noti_date;
	private int noti_hit_count;
	private String noti_file_check;
	private String member_nick;
	
	//첨부파일 업로드 추가
	private int FILE_NO;
	private String org_file_name;
	private String stored_file_name;
	private int file_size;
	private Date file_date;
	private String del_gb;
	
	
	public int getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(int noti_no) {
		this.noti_no = noti_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_hit_count() {
		return noti_hit_count;
	}
	public void setNoti_hit_count(int noti_hit_count) {
		this.noti_hit_count = noti_hit_count;
	}
	public String getNoti_file_check() {
		return noti_file_check;
	}
	public void setNoti_file_check(String noti_file_check) {
		this.noti_file_check = noti_file_check;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	
	//첨부파일 업로드 추가
	public int getFILE_NO() {
		return FILE_NO;
	}
	public void setFILE_NO(int FILE_NO) {
		this.FILE_NO = FILE_NO;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getStored_file_name() {
		return stored_file_name;
	}
	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	public String getDel_gb() {
		return del_gb;
	}
	public void setDel_gb(String del_gb) {
		this.del_gb = del_gb;
	}
	
}