package com.Model;

public class Domestic_AnimalsDTO {
	
	private int room; 				// 방번호
	private int product_cnt; 		// 개체수
	private String receving_date; 	// 입고날짜
	private String forwarding_date; // 출고날짜
	private String fir_vaccine; 	// 1차 백신날짜
	private String sec_vaccine; 	// 2차 백신날짜
	private String thr_vaccine; 	// 3차 백신날짜
	private int enableGrade; 		// 수정 가능 등급

/////////////////////////////////////////////////////////////////////////////////////////

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public int getProduct_cnt() {
		return product_cnt;
	}

	public void setProduct_cnt(int product_cnt) {
		this.product_cnt = product_cnt;
	}

	public String getReceving_date() {
		return receving_date;
	}

	public void setReceving_date(String receving_date) {
		this.receving_date = receving_date;
	}

	public String getForwarding_date() {
		return forwarding_date;
	}

	public void setForwarding_date(String forwarding_date) {
		this.forwarding_date = forwarding_date;
	}

	public String getFir_vaccine() {
		return fir_vaccine;
	}

	public void setFir_vaccine(String fir_vaccine) {
		this.fir_vaccine = fir_vaccine;
	}

	public String getSec_vaccine() {
		return sec_vaccine;
	}

	public void setSec_vaccine(String sec_vaccine) {
		this.sec_vaccine = sec_vaccine;
	}

	public String getThr_vaccine() {
		return thr_vaccine;
	}

	public void setThr_vaccine(String thr_vaccine) {
		this.thr_vaccine = thr_vaccine;
	}

	public int getEnableGrade() {
		return enableGrade;
	}

	public void setEnableGrade(int enableGrade) {
		this.enableGrade = enableGrade;
	}

/////////////////////////////////////////////////////////////////////////////////////////

	public Domestic_AnimalsDTO(int room, int product_cnt, String receving_date, String forwarding_date,
			String fir_vaccine, String sec_vaccine, String thr_vaccine, int enableGrade) {
		this.room = room;
		this.product_cnt = product_cnt;
		this.receving_date = receving_date;
		this.forwarding_date = forwarding_date;
		this.fir_vaccine = fir_vaccine;
		this.sec_vaccine = sec_vaccine;
		this.thr_vaccine = thr_vaccine;
		this.enableGrade = enableGrade;
	}

	public Domestic_AnimalsDTO(String forwarding_date, String fir_vaccine, String sec_vaccine, String thr_vaccine) {
		this.forwarding_date = forwarding_date;
		this.fir_vaccine = fir_vaccine;
		this.sec_vaccine = sec_vaccine;
		this.thr_vaccine = thr_vaccine;
	}
		
	
}
