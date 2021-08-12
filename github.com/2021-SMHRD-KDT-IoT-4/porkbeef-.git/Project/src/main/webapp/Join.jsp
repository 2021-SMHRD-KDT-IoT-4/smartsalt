<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
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
                padding-top: 15em;
                padding-bottom: 14em;
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

            #button {
                position: relative;
                left: 18.5em;
            }

            #txt {
                color: white;
                float: right;
                position: relative;
                top: 19.5em;
                right: 68em;
            }

            form {
                width: 45%;
                margin: auto;
            }
        </style>
    </head>

    <body>
        <div class="wrapper style1"
            style="height: 768px; padding-top: 0px; padding-bottom: 0px; margin-left: 0px; margin-bottom: 0px;">

            <form action="Join.do"
                style="margin-left: 0px; width: 512px; height: 384px; margin-right: 0px; padding-left: 400px; margin-top: 0px; padding-top: 150px; padding-right: 0px;">
                <table style="margin-left: 0px; width: 256px; height: 192px; margin-right: 0px;">
                    <tr>
                        <td><input type="text" name="mb_id" placeholder="아이디" /><br></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="PW" name="mb_pw" placeholder="비밀번호" /><br></td>
                    </tr>
                    <tr>
                        <td><input type="password" id="PWCheck" name="PWCheck" placeholder="비밀번호 재확인"
                                onchange="pwcheck()" /><br></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="nick_name" placeholder="닉네임" /><br></td>
                    </tr>
                </table>


                <span id=button style="left: 70px; margin-left: 0px; width: 0px; height: 0px;"><input type="submit"
                        style="width: 100%; margin-left: 0px; margin-right: 0px; padding-left: 10px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px; margin-bottom: 5px; margin-top: 0px;"
                        class="button alt" value="회원가입" /> <input type="button" class="button alt" value="뒤로가기"
                        onclick="location.href='Login.jsp';"
                        style="width: 100%; margin-left: 0px; margin-right: 0px; padding-left: 10px; padding-top: 10px; padding-right: 10px; padding-bottom: 10px;" />
                </span>
            </form>
            <span id="txt" style="left: -476px; top: 18px;"></span>
        </div>

        <script>
            function pwcheck() {

                let PW = document.getElementById("PW").value;
                let PWCheck = document.getElementById("PWCheck").value;

                if (PW == PWCheck) {
                    document.getElementById("txt").innerText = "비밀번호 일치";

                } else {
                    document.getElementById("txt").innerText = "비밀번호 불일치";
                }
            }
        </script>

    </body>

    </html>