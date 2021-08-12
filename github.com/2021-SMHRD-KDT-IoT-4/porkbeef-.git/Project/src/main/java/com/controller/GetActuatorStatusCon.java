package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Actuator_Status_DAO;
import com.Model.Actuator_Status_DTO;
import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class GetActuatorStatusCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("EUC-KR");

		Actuator_Status_DAO dao = new Actuator_Status_DAO();
		Actuator_Status_DTO status = dao.GetActuatorStatus();
		
		Manual_Control_DTO asDTO = new Manual_Control_DAO().GetManual();
		if (status != null) {
			if(asDTO.getAct_absor()==0 &&
			   asDTO.getAct_aircon()==0 &&
			   asDTO.getAct_boil()==0 &&
			   asDTO.getAct_door()==0 &&
			   asDTO.getAct_feed()==0 &&
			   asDTO.getAct_humid()==0 &&
			   asDTO.getAct_pump()==0) {
				session.setAttribute("AutoMode", 0);
			}else {
				session.setAttribute("AutoMode", 1);
			}
			session.setAttribute("Actuator_Status_All", status);
			System.out.println("입력 성공");
		} else {
			session.invalidate();
			System.out.println("입력 실패");
		}
		response.sendRedirect("farmControl.jsp");

	}
}
