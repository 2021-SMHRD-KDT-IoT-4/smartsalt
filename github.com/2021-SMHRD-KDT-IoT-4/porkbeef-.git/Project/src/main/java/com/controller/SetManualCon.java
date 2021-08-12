package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.Manual_Control_DAO;
import com.Model.Manual_Control_DTO;

public class SetManualCon implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		int enablegrade = Integer.parseInt(request.getParameter("enablegrade"));
		boolean rtn = false;

		if (enablegrade != 3) {

			Manual_Control_DAO dao = new Manual_Control_DAO();
			Manual_Control_DTO dto = new Manual_Control_DTO(0, 0, 0, 0, 0, 0, 0, 0);
			if (dao.SetManual(dto) > 0) {
				rtn = true;
			}
		}

		PrintWriter out = response.getWriter();

		out.print(rtn);

	}
}
