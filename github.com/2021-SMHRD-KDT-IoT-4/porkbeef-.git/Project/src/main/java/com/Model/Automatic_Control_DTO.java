package com.Model;

// �ڵ��������
public class Automatic_Control_DTO {

	private String feed_time = null; 	// ���ٽð�
	private int absor_start = 0; 		// ���� ���� ��
	private int absor_stop = 0; 		// ���� ���� ��
	private int aircon_start = 0; 		// ������
	private int aircon_stop = 0; 		// ������ ���� �µ�
	private int humid_start = 0;		// ������ ���� ����
	private int humid_stop = 0;		 	// ������ ���� ����
	private int boil_start = 0; 		// ���Ϸ� ���� �µ�
	private int boil_stop = 0; 			// ���Ϸ� ���� �µ�

/////////////////////////////////////////////////////////////////////////////////////////

	public String getFeed_time() {
		return feed_time;
	}

	public void setFeed_time(String feed_time) {
		this.feed_time = feed_time;
	}

	public int getAbsor_start() {
		return absor_start;
	}

	public void setAbsor_start(int absor_start) {
		this.absor_start = absor_start;
	}

	public int getAbsor_stop() {
		return absor_stop;
	}

	public void setAbsor_stop(int absor_stop) {
		this.absor_stop = absor_stop;
	}

	public int getAircon_start() {
		return aircon_start;
	}

	public void setAircon_start(int aircon_start) {
		this.aircon_start = aircon_start;
	}

	public int getAircon_stop() {
		return aircon_stop;
	}

	public void setAircon_stop(int aircon_stop) {
		this.aircon_stop = aircon_stop;
	}

	public int getHumid_start() {
		return humid_start;
	}

	public void setHumid_start(int humid_start) {
		this.humid_start = humid_start;
	}

	public int getHumid_stop() {
		return humid_stop;
	}

	public void setHumid_stop(int humid_stop) {
		this.humid_stop = humid_stop;
	}

	public int getBoil_start() {
		return boil_start;
	}

	public void setBoil_start(int boil_start) {
		this.boil_start = boil_start;
	}

	public int getBoil_stop() {
		return boil_stop;
	}

	public void setBoil_stop(int boil_stop) {
		this.boil_stop = boil_stop;
	}

/////////////////////////////////////////////////////////////////////////////////////////
	
	public Automatic_Control_DTO(String feed_time, int absor_start, int absor_stop, int aircon_start, int aircon_stop,
			int humid_start, int humid_stop, int boil_start, int boil_stop) {
		super();
		this.feed_time = feed_time;
		this.absor_start = absor_start;
		this.absor_stop = absor_stop;
		this.aircon_start = aircon_start;
		this.aircon_stop = aircon_stop;
		this.humid_start = humid_start;
		this.humid_stop = humid_stop;
		this.boil_start = boil_start;
		this.boil_stop = boil_stop;
	}
}
