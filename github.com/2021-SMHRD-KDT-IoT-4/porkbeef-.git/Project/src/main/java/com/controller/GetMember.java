package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.UserDAO;

public class GetMember implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		UserDAO dao = new UserDAO();

		ArrayList<MemberDTO> allMember = dao.getAllMember();

		if (allMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("allMember", allMember);
			
			System.out.println("회원정보 전송 성공");
		} else {
			System.out.println("회원정보 전송 실패");
		}
		response.sendRedirect("member.jsp");
	}
}
