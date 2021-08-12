package com.Model;

// 센서상태
public class Actuator_Status_DTO {

	private int act_feed; 		// 밥통
	private int act_door; 		// 축사문
	private int act_absor;		// 흡배기
	private int act_aircon; 	// 에어컨
	private int act_pump; 		// 펌프
	private int act_boil; 		// 보일러
	private int act_humid; 		// 가습기

/////////////////////////////////////////////////////////////////////////////////////////

	public int getAct_feed() {
		return act_feed;
	}

	public void setAct_feed(int act_feed) {
		this.act_feed = act_feed;
	}

	public int getAct_door() {
		return act_door;
	}

	public void setAct_door(int act_door) {
		this.act_door = act_door;
	}

	public int getAct_absor() {
		return act_absor;
	}

	public void setAct_absor(int act_absor) {
		this.act_absor = act_absor;
	}

	public int getAct_aircon() {
		return act_aircon;
	}

	public void setAct_aircon(int act_aircon) {
		this.act_aircon = act_aircon;
	}

	public int getAct_pump() {
		return act_pump;
	}

	public void setAct_pump(int act_pump) {
		this.act_pump = act_pump;
	}

	public int getAct_boil() {
		return act_boil;
	}

	public void setAct_boil(int act_boil) {
		this.act_boil = act_boil;
	}

	public int getAct_humid() {
		return act_humid;
	}

	public void setAct_humid(int act_humid) {
		this.act_humid = act_humid;
	}

/////////////////////////////////////////////////////////////////////////////////////////

	public Actuator_Status_DTO(int act_feed, int act_door, int act_absor, int act_aircon, int act_pump, int act_boil,
			int act_humid) {
		this.act_feed = act_feed;
		this.act_door = act_door;
		this.act_absor = act_absor;
		this.act_aircon = act_aircon;
		this.act_pump = act_pump;
		this.act_boil = act_boil;
		this.act_humid = act_humid;
	}
}
