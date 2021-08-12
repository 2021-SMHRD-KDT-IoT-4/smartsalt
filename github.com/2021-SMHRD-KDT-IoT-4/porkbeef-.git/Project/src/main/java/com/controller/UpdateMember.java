package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.MemberDTO;
import com.Model.UserDAO;

public class UpdateMember implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		String mb_id = request.getParameter("mb_id");
		int mb_grade = Integer.parseInt(request.getParameter("mb_grade"));

		UserDAO dao = new UserDAO();
		MemberDTO dto = new MemberDTO(mb_id, mb_grade);
		int cnt = dao.userUpdate(dto);

		if (cnt > 0) {
			System.out.println("회원정보 수정 성공!");
		} else {
			System.out.println("회원정보 수정 실패!");
		}
		response.sendRedirect("member.jsp");
	}
}
