package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Automatic_Control_DAO;
import com.Model.Automatic_Control_DTO;

public class Update_Automatic_Con implements Command {

	private Automatic_Control_DAO automatic_DAO = null;
	private Automatic_Control_DTO automatic_DTO = null;

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String value = null;
		try {
			value = request.getParameter("value");

		} catch (Exception e) {
			System.out.println("dd?");
		}

		if (value.equals("")) {
			response.sendRedirect("automaticControl.jsp");
			return;
		}
		automatic_DAO = new Automatic_Control_DAO();
		automatic_DTO = automatic_DAO.get_Automatic_SRead();

		set_automatic_DTO(automatic_DTO, num, value);
		int state_Check = automatic_DAO.Automatic_SUpdate(automatic_DTO);
		System.out.println(state_Check);
		if (state_Check > 0) {
			System.out.println("자동상태 설정 반영 성공");
		} else {
			System.out.println("자동상태 설정 반영 실패");
		}
		HttpSession session = request.getSession();
		session.setAttribute("Automatic", automatic_DTO);
		response.sendRedirect("automaticControl.jsp");
	}

	private Automatic_Control_DTO set_automatic_DTO(Automatic_Control_DTO automatic_DTO, int num, String value) {
		if (num == 1) {
			automatic_DTO.setFeed_time(value);
		} else if (num == 2) {
			automatic_DTO.setAbsor_start(Integer.parseInt(value));
		} else if (num == 3) {
			automatic_DTO.setAbsor_stop(Integer.parseInt(value));
		} else if (num == 4) {
			automatic_DTO.setAircon_start(Integer.parseInt(value));
		} else if (num == 5) {
			automatic_DTO.setAircon_stop(Integer.parseInt(value));
		} else if (num == 6) {
			automatic_DTO.setHumid_start(Integer.parseInt(value));
		} else if (num == 7) {
			automatic_DTO.setHumid_stop(Integer.parseInt(value));
		} else if (num == 8) {
			automatic_DTO.setBoil_start(Integer.parseInt(value));
		} else if (num == 9) {
			automatic_DTO.setBoil_stop(Integer.parseInt(value));
		}

		return automatic_DTO;
	}
}
