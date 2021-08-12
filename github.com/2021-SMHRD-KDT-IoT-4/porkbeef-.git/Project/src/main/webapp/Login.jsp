<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>로그인</title>
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
                padding-bottom: 15em;
                background-size: cover;
                background: url(./images/back.jpg) no-repeat center top;
                background-attachment: fixed;
                -webkit-backface-visibility: hidden;
                -webkit-transform: translateZ(0);
            }

            input[type="submit"].alt,
            input[type="button"].alt,
            .button.alt {
                border: 2px solid #FFF;
            }

            input[type="text"],
            input[type="password"],
            textarea {
                line-height: 2em;
                -moz-appearance: none;
                -webkit-appearance: none;
                -o-appearance: none;
                -ms-appearance: none;
                appearance: none;
                background: white;
                color: #555555;
                display: -webkit-box;
                outline: 0;
                padding: 1em 1em;
                text-decoration: none;
                width: 100%;
                border-radius: 6px;
                opacity: 0.7;
            }

            table {
                width: 60%;
                margin: auto;
                white-space: pre-line;
            }

            #txt {
                color: white;
                float: right;
                position: relative;
                top: 312px;
                right: 840px;
            }

            form {
                width: 110%;
                margin: auto;
            }

            #page {
                position: relative;
                background: space;
                padding: 9.5em;
                border-radius: 25px;
                bottom: -70px;
            }

            input[type="submit"].fit,
            input[type="reset"].fit,
            input[type="button"].fit,
            .button.fit {
                width: 60%;
                border: 2px solid #FFF;
            }
        </style>
    </head>

    <body>

	<div class="wrapper style1"
		style="height: 768px;; padding-top: 0px; padding-bottom: 0px;">

		<div id="page" class="container"
			style="height: 384px; margin-left: 0px; margin-right: 0px; padding-bottom: 0px; padding-right: 250px; padding-top: 90px; padding-left: 250px; top: 0px; bottom: 0px;">

			<div>
				<input type="image" src="./images/icon_back.png"
					style="width: 350px; padding-left: 0px; margin-left: 100px;">
			</div>

			<form action="Login.do" method="post"
				style="width: 550px; margin-right: 0px; height: 200px; margin-left: 0px;">
				<table>
					<tr>
						<td><input type="text" name="mb_id" placeholder="ID를 입력하세요"><br></td>
					</tr>
					<tr>
						<td><input type="password" name="mb_pw"
							placeholder="PW를 입력하세요"><br></td>
					</tr>
					<tr>
						<td id="button"
							style="padding-left: 110px; padding-right: 110px; padding-bottom: 5px;"><input
							type="submit" value="로그인" class="button fit"
							style="margin-left: 0px; margin-right: 0px; margin-bottom: 5px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; width: 112px;"></td>
					</tr>
					<tr>
						<td id="button"
							style="padding-left: 110px; padding-right: 110px; padding-bottom: 5px;"><input
							type="button" value="회원가입" class="button fit"
							onClick="location.href='Join.jsp'"
							style="margin-left: 0px; margin-right: 0px; margin-bottom: 5px; padding-left: 10px; padding-right: 10px; padding-top: 10px; padding-bottom: 10px; width: 112px;"></td>
					</tr>
				</table>

			</form>
		</div>
	</div>
</body>

    </html>