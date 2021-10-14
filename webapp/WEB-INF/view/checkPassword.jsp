<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 현재 비밀번호 확인</title>
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/notosanskr.css">
    <link rel="stylesheet" href="css/reset.css">
    <style>
        #wrap{
            width: 1100px;
            margin: auto;
        }
        body{
            font-family: "Noto Sans KR";
            user-select: none;
        }
        /* 버튼 css 제거 */
        button{
            border: none;
            background-color: transparent;
            font-family: "Noto Sans KR", sans-serif;
            user-select: none;
            cursor: pointer;
            outline: none;
        }


        #content{
            width: 1100px;
        }
        #findIdText{
            width: 1100px;
            font-size: 35px;
            margin-top: 60px;
            margin-left: 220px;
        }
        #findIdWrap{
            width: 680px;
            border: 1px solid rgb(190, 190, 190);
            margin:40px auto 100px auto;
            border-radius: 10px;

        }
        #loginWrap input{
            font-family: "Noto Sans KR",sans-serif;
        }

        .password_box{
            width: 400px;
            height: 55px;
            border-radius: 5px;
            border: 1px solid rgb(127,127,127);
            outline: none;
            text-indent: 10px;
            margin-left: 60px;


        }
        #currentPassword{
            margin-top: 20px;
        }
        #checkPassword,#password{
            margin-top: 20px;
        }
        .certificationNumCheck,.check_msg{
            font-size: 13px;
            font-weight: 500;
            color:red;
            margin-left: 60px;
            margin-top: 5px;
            margin-bottom:10px;
        }


        .btnWrap {
            width: 150px;
            height: 57px;
            margin-left: 470px;
            margin-top: -58px;
        }
        .btnConfirm{
            width: 150px;
            height: 57px;
            border-radius: 5px;
            background-color: #27AE60;
            color: #fff;
            box-shadow: 0 0 2px #424242;
            font-size: 17px;
            font-weight: bold;
        }
        #confirm{
            background-color: rgb(127, 127, 127);
        }

    </style>

</head>
<body>
<div id="wrap">


<div id="content">
    <div id="findIdText">현재 비밀번호 확인</div>
    <div id="findIdWrap">
        <form action="/password" method="post" id="putPassword" onsubmit="return check()">
        	<input type="hidden" name="_method" value="PUT"/>
        	<input type="hidden" id="id" value="${loginMember.id }"/>
        	<p class="check_msg"></p>
            <input id="password" class="password_box" placeholder="현재 비밀번호를 입력해주세요." type="password"  name="password">
			<p id="passwordMsg" class="check_msg"></p>
        </form>
    </div>
    <div class="btnWrap">
          <button form="putPassword" id="submitBtn" class="btnConfirm" >비밀번호 확인</button>
    </div>
</div>


</div>
<!--//wrap-->

<script src="js/jquery.js"></script>
<script>
	const $password = $("#password");
	const $checkPassword=$("#checkPassword");
	const pwExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,16}$/;
	let auth=false;
	
	function check(){
		let auth=pwExp.test($password.val());
		return auth;
	}	
	
</script>
</body>
</html>