<%@page import="com.Model.Automatic_Control_DTO"%>
<%@page import="com.Model.Automatic_Control_DAO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>자동제어</title>
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
   width: 75%;
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

input[type="submit"].fit,
            input[type="reset"].fit,
            input[type="button"].fit,
            .button.fit {
                border: 2px solid #FFF;
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

      <% Automatic_Control_DTO acdto = (Automatic_Control_DTO)session.getAttribute("Automatic");%>
	
	  	<!-- 몸체 -->
		<div class="container"
			style="margin-left: 0px; margin-right: 0px; height: 300px; width: 950px; padding-left: 15px; padding-right: 0px; padding-top: 200px; padding-bottom: 200px; margin-top: 0px; border-right-width: 15px;">

			<div class="row no-collapse-1"
				style="margin-left: 0px; width: 1016px;">

				<form class="4u" action="updateAutomaticControl.do" method="post"
					style="padding-left: 0px;">

					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>사료 배급 설정 시간</h1>
						<%
						if (acdto != null) {
						%>
						<h1>
							<%=acdto.getFeed_time()%>
							<input type="time"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> 
								<input type="submit"
								name="feed_time" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%
						} else {
						%>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="1">
					</div>

				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>흡배기 동작 설정 농도</h1>
						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getAbsor_start() %>% <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="absor_start" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="2">
					</div>
				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>흡배기 정지 설정 농도</h1>
						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getAbsor_stop() %>% <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="absor_stop" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="3">
					</div>
				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">

						<h1>에어컨 동작 설정 온도</h1>
						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getAircon_start() %>℃ <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="aircon_start" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="4">
					</div>
				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>에어컨 정지 설정 온도</h1>
						<%
						if (acdto != null) {
						%>
						<h1>
							<%=acdto.getAircon_stop()%>℃ <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="aircon_stop" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="5">
					</div>
				</form>
			</div>

			<div class="row no-collapse-1"
				style="margin-left: 0px; width: 1016px; padding-left: 105px; padding-right: 105px;">

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>가습기 동작 설정 농도</h1>
						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getHumid_start() %>% <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="humid_start" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="6">
					</div>
				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>가습기 정지 설정 농도</h1>
						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getHumid_stop() %>% <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="humid_stop" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%} else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="7">
					</div>
				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>보일러 동작 설정 온도</h1>

						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getBoil_start() %>℃ <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="boil_start" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%}else{ %>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="8">
					</div>

				</form>

				<form class="4u" action="updateAutomaticControl.do"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 0px; padding-left: 0px; padding-top: 0px; padding-right: 0px; width: 190px; height: 165px;">
						<h1>보일러 정지 설정 온도</h1>

						<% if(acdto !=null){ %>
						<h1>
							<%=acdto.getBoil_stop() %>℃ <input type="text"
								style="padding-left: 0px; padding-bottom: 0px; padding-right: 0px; padding-top: 0px; width: 150px; height: 20px; margin-left: 20px; margin-right: 20px; margin-bottom: 5px; margin-top: 5px; border: solid 1px gray; font-size: 10px; text-align: center;"
								placeholder="값을 입력하세요." name="value"> <input type="submit"
								name="boil_stop" value="수정"
								style="padding-left: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; width: 85px;">
						</h1>
						<%
						} else {
						%>
						<h1>설정 정보가 없습니다.</h1>
						<%}%>
						<input type="hidden" name="num" value="9">
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>