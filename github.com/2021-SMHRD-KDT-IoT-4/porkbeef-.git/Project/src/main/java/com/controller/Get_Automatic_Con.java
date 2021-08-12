package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Model.Automatic_Control_DAO;
import com.Model.Automatic_Control_DTO;

public class Get_Automatic_Con implements Command {

	private Automatic_Control_DAO automatic_DAO = null;
	private Automatic_Control_DTO automatic_DTO = null;

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("EUC-KR");

		automatic_DAO = new Automatic_Control_DAO();
		automatic_DTO = automatic_DAO.get_Automatic_SRead();

		if (automatic_DTO != null) {
			session.setAttribute("Automatic", automatic_DTO);
			System.out.println("성공");
		} else {
			session.invalidate();
			System.out.println("실패");
		}
		response.sendRedirect("automaticControl.jsp");
	}
}
