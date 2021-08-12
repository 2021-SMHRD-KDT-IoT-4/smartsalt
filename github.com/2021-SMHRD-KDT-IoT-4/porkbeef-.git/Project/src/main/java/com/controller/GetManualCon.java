package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class GetManualCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		HttpSession session = request.getSession();

		Manual_Control_DAO dao = new Manual_Control_DAO();
		Manual_Control_DTO manual = dao.GetManual();

		if (manual != null) {
			session.setAttribute("Manual_Control_All", manual);
			System.out.println("성공");
		} else {
			session.invalidate();
			System.out.println("실패");

		}
		response.sendRedirect("farmControl.jsp");

	}

}
