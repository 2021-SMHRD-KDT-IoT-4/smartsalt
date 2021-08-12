package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Model.MemberDTO;
import com.Model.UserDAO;

public class Join implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");
		String nick_name = request.getParameter("nick_name");

		UserDAO dao = new UserDAO();
		MemberDTO dto = new MemberDTO(mb_id, mb_pw, 3, nick_name);

		int cnt = dao.userJoin(dto);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("index.jsp");

		} else {

			System.out.println("회원가입 실패");
			response.sendRedirect("Join.jsp");
		}
	}
}
