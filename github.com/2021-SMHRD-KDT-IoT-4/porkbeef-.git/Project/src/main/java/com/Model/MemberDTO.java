package com.Model;

public class MemberDTO {

	private String mb_id; // 회원 아이디
	private String mb_pw; // 회원 비밀번호
	private int mb_grade; // 회원 등급
	private String nick_name; // 회원 닉네임

/////////////////////////////////////////////////////////////////////////////////////////

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public int getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(int mb_grade) {
		this.mb_grade = mb_grade;
	}

	public String getNick_name() {
		return nick_name;
	}

	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}

/////////////////////////////////////////////////////////////////////////////////////////

	public MemberDTO(String mb_id,int mb_grade) {
		this.mb_id = mb_id;
		this.mb_grade = mb_grade;
	}
	public MemberDTO(String mb_id, String mb_pw) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
	}

	public MemberDTO(String mb_id, String mb_pw, int mb_grade, String nick_name) {
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.mb_grade = mb_grade;
		this.nick_name = nick_name;
	}
}