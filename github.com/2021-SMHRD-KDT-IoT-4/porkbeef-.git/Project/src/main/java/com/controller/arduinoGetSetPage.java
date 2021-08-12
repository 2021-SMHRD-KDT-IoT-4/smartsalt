package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Actuator_Status_DAO;
import com.Model.Actuator_Status_DTO;
import com.Model.Automatic_Control_DAO;
import com.Model.Automatic_Control_DTO;
import com.Model.Entire_Environment_DAO;
import com.Model.Entire_Environment_DTO;

public class arduinoGetSetPage implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int humi = Integer.parseInt(request.getParameter("h"));
		int temp = Integer.parseInt(request.getParameter("t"));
		int gas = Integer.parseInt(request.getParameter("g"));
		PrintWriter out = response.getWriter();
		
		String json = "null";
		Actuator_Status_DTO asDTO =null;
		Entire_Environment_DTO eeDTO = new Entire_Environment_DTO(humi, temp, gas);
		System.out.println("습도:" + humi);
		System.out.println("온도:" + temp);
		System.out.println("가스:" + gas);
		int eAW_Cnt = new Entire_Environment_DAO().Environment_AWrite (eeDTO);//축사 상태 입력

		if(eAW_Cnt>0) {			
			Automatic_Control_DTO acDTO = new Automatic_Control_DAO().get_Automatic_SRead();
			asDTO = calculate(eeDTO, acDTO);
			json = "/{"
					+ "\"fs\":\""+asDTO.getAct_feed()+"\","
//					+ "\"d\":\""+asDTO.getAct_door()+"\","
					+ "\"ab\":\""+asDTO.getAct_absor()+"\","
					+ "\"ai\":\""+asDTO.getAct_aircon()+"\","
//					+ "\"p\":\""+asDTO.getAct_pump()+"\","
					+ "\"b\":\""+asDTO.getAct_boil()+"\","
					+ "\"h\":\""+asDTO.getAct_humid()
					+ "}/";
		}
		
		
		if(asDTO != null) {
			asDTO.setAct_feed(0);
			new Actuator_Status_DAO().SetActuatorStatus(asDTO);
		}
		
		out.print(json);
		System.out.println(json);
		// 비교하고

//		db 인젝트
//		
//		정해진 시간 상태

		
		
	}

	private Actuator_Status_DTO  calculate(Entire_Environment_DTO eeDTO,Automatic_Control_DTO acDTO) {
		Actuator_Status_DTO asDTO = new Actuator_Status_DAO().GetActuatorStatus();
		
		if(eeDTO.getTemp() < acDTO.getAircon_stop()) asDTO.setAct_aircon(0);			
		if(eeDTO.getTemp() > acDTO.getAircon_start()) asDTO.setAct_aircon(1);
				
		if(eeDTO.getGas() < acDTO.getAbsor_stop()) asDTO.setAct_absor(0);
		if(eeDTO.getGas() > acDTO.getAbsor_start()) asDTO.setAct_absor(1);
		
		if(eeDTO.getHumi() < acDTO.getHumid_stop()) asDTO.setAct_humid(0);	
		if(eeDTO.getHumi() > acDTO.getHumid_start()) asDTO.setAct_humid(1);
		
		if(eeDTO.getTemp() < acDTO.getBoil_stop()) asDTO.setAct_boil(0);
		if(eeDTO.getTemp() > acDTO.getBoil_start()) asDTO.setAct_boil(1);
		LocalTime present = LocalTime.now();
		LocalTime getFeedTime = LocalTime.parse(acDTO.getFeed_time(),DateTimeFormatter.ofPattern("HH:mm"));
		
		if(present.getHour()==getFeedTime.getHour() && present.getMinute() == getFeedTime.getMinute())
			asDTO.setAct_feed(1);
		
		
		return asDTO;
	}
	
}
