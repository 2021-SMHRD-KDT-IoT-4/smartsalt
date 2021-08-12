package com.Model;

// 전체 환경
public class Entire_Environment_DTO { 

	private int seq_num; 		// 번호
	private String check_time; 	// 시간
	private int temp; 			// 온도
	private int humi; 			// 습도
	private int gas; 			// 가스

/////////////////////////////////////////////////////////////////////////////////////////

	public int getSeq_num() {
		return seq_num;
	}

	public void setSeq_num(int seq_num) {
		this.seq_num = seq_num;
	}

	public String getCheck_time() {
		return check_time;
	}

	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}

	public int getTemp() {
		return temp;
	}

	public void setTemp(int temp) {
		this.temp = temp;
	}

	public int getHumi() {
		return humi;
	}

	public void setHumi(int humi) {
		this.humi = humi;
	}

	public int getGas() {
		return gas;
	}

	public void setGas(int gas) {
		this.gas = gas;
	}

/////////////////////////////////////////////////////////////////////////////////////////

	public Entire_Environment_DTO(int seq_num, String check_time, int temp, int humi, int gas) {
		this.seq_num = seq_num;
		this.check_time = check_time;
		this.temp = temp;
		this.humi = humi;
		this.gas = gas;
	}
	public Entire_Environment_DTO( int temp, int humi, int gas) {
		this.temp = temp;
		this.humi = humi;
		this.gas = gas;
	}
}
