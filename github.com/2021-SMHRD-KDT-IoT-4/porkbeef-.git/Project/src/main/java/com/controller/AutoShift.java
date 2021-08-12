package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class AutoShift implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Manual_Control_DAO asDAO = new Manual_Control_DAO();
		Manual_Control_DTO asDTO = new Manual_Control_DTO(0, 0, 0, 0, 0, 0, 0, 2);
		asDAO.SetManual(asDTO);
		response.sendRedirect("farmControl.do");
	}

}
