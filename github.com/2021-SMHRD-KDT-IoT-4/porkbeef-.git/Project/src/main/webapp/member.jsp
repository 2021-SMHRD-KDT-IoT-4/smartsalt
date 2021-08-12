<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Model.UserDAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="EUC-KR">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=1024, height=768" />

<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>

<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel-layers.min.js"></script>

<style type="text/css">
.wrapper.style1 {
	background: url(./images/back.jpg) no-repeat center top;
	padding-top: 11em;
	padding-bottom: 24em;
	background-size: cover;
	background-attachment: fixed;
	-webkit-backface-visibility: hidden;
	-webkit-transform: translateZ(0);
}

#header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: #00000000;
	color: #fff;
	padding: 1.25em;
	z-index: 100;
}

.box {
	padding: 20px;
	background: #FFF;
	text-align: center;
	border-radius: 5px;
	margin-left: 19px;
}

table {
	width: 85%;
	margin-left: 13em;
	margin-top: 12em;
}

body, input, select, textarea {
	font-size: 12pt;
	line-height: 2.5em;
}

#logo {
	font-size: 2em;
	cursor: default;
}

#nav {
	position: absolute;
	right: 0;
	top: 0;
	cursor: default;
}

.\34 u {
	width: 200px;
}

.image.featured img {
	display: block;
	width: 90%;
}

.image.featured {
	position: static;
	display: block;
	width: 15em;
	padding: 10px;
	margin: auto;
}

#nav ul li a {
	-moz-transition: color 0.35s ease-in-out;
	-webkit-transition: color 0.35s ease-in-out;
	-o-transition: color 0.35s ease-in-out;
	-ms-transition: color 0.35s ease-in-out;
	transition: color 0.35s ease-in-out;
	display: inline-block;
	color: #ddd;
	color: black;
	font-weight: 900;
	text-decoration: none;
}

input[type="submit"], input[type="reset"], input[type="button"], .button
	{
	display: block;
	width: 65%;
	max-width: 350px;
	margin: 0em auto;
	font-size: 15px;
	font-weight: 600;
	border: 2px solid #FFF;
}

.td {
	border-style: solid;
	border-width: 3px;
}
</style>
</head>
<body>



	<%
	MemberDTO user = (MemberDTO) session.getAttribute("user");
	int grade = 3;

	if (user != null) {
		grade = user.getMb_grade();
		System.out.print(user.getMb_id());
		System.out.print(grade);
	}
	if (user == null) {
		response.sendRedirect("Login.jsp");
	} else if (grade != 0) {
		response.sendRedirect("index.jsp");
	}
	%>

	<div class="wrapper style1"
		style="height: 700px; padding-top: 1px; padding-bottom: 0px;">


		<div id="header" class="skel-panels-fixed"
			style="bottom: 690px; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 0px;">
			<div id="logo"
				style="border-top-width: 0px; padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
				<h1>
					<a href="index.jsp"><input type="image"
						src="./images/icon_back.png"
						style="width: 115px; padding-left: 0px; margin-left: 18px; margin-top: 17px;"></a>
				</h1>
			</div>
			<nav id="nav" style="bottom: 0px; padding-top: 0px;">
				<ul style="margin-bottom: 0px; height: 46px; padding-top: 10px;">
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="farmControl.do">축사 제어</a></li>
					<%
					if (user != null && user.getMb_grade() < 2) {
					%>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="automaticControl.do">자동 제어</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="member.jsp">회원 관리</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="domesticAnimals.do">돼지 현황</a></li>
					<%
					}
					%>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="logout.do">로그아웃</a></li>
				</ul>
			</nav>
		</div>

		<!-- 몸체 -->
		<div id="banner" class="container"
			style="margin-left: 100px; margin-right: 100px; margin-bottom: 100px; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 0px; margin-top: 100px;">


				<%
				UserDAO dao = new UserDAO();
				ArrayList<MemberDTO> list = dao.getAllMember();
				%>
				<div
					style="background-color: #ffff99b2; width: 50em; height: 30em; padding-top: 100px; padding-left: 0px; padding-bottom: 100px; padding-right: 0px; border-radius: 5em;">
					<table class="table"
						style="margin-left: 60px; margin-bottom: 0px; margin-top: 0px; padding-left: 0px; margin-right: 60px; color: black; font-weight: 900; padding-top: 0px;">
						<tr>
							<td colspan="5"><p
									style="font-size: 35px; font-family: '휴먼둥근헤드라인'; margin-bottom: 0px; color: #000;">☞회원관리☜</p></td>
						</tr>
						<tr class="tr">
							<td class="td">아이디</td>
							<td class="td">닉네임</td>
							<td class="td">등급</td>
							<td class="td">등급선택</td>
							<td class="td">수정</td>
						</tr>

						<%
						for (int i = 0; i < list.size(); i++) {
						%>

						<form action="updateMember.do" method="post"
								style="margin-left: 0px; margin-right: 0px;">
							<tr>
									<td class="td" align="center"><%=list.get(i).getMb_id()%></td>
									<td class="td" align="center"><%=list.get(i).getNick_name()%></td>
									<td class="td" align="center"><%=list.get(i).getMb_grade()%></td>
									<td class="td" align="center"><select id="grade"
										name="mb_grade"
										style="border-top-width: 2px; border-right-width: 2px; border-left-width: 2px; border-bottom-width: 2px;">
											<option value="none">====선택====</option>
											<option value="0">0</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
									</select></td>
									<td class="td" align="center"><input type="submit"
										value="등급 수정"
										style="padding-right: 0px; padding-left: 0px; padding-bottom: 0px; padding-top: 0px; margin-bottom: 5px; margin-top: 5px; margin-right: 0px; margin-left: 0px; height: 45px; width: 80px;"></td>
									<td><input type="hidden" name="mb_id"
										value="<%=list.get(i).getMb_id()%>"></td>
							</tr>
						</form>
						<%
						}
						%>
					</table>
				</div>
		
		</div>

	</div>

</body>
</html>