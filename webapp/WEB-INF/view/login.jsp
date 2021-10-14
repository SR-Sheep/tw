<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/css/reset.css" />
	<link rel="stylesheet" href="/css/all.min.css" />
	<link rel="stylesheet" href="/css/notosanskr.css" />
	<link rel="stylesheet" href="/css/default.css" />
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    input {
        font-family: 'Noto Sans KR', sans-serif;
    }

    #content {
        width:1100px;
        min-height: 600px;
        margin: auto;
        /*background-color: lemonchiffon;*/
    }

    #loginBox {
        width: 600px;
        height: auto;
        /*background-color: #2699F7;*/
        margin: 100px auto;
    }

    #loginLogoBox {
        /*background-color: red;*/
        width: 200px;
        margin: auto;
    }

    #loginFormBox {
        /*background-color: blue;*/

    }
    /*input 요소 placeholder 안에 폰트어썸 적용*/
    .inputArea::placeholder {
        font-family: "Font Awesome 5 Free";
        -moz-osx-font-smoothing: grayscale;
        -webkit-font-smoothing: antialiased;
        display: inline-block;
        font-style: normal;
        font-variant: normal;
        text-rendering: auto;
        line-height: 1;
        font-weight: 900;
    }

    #loginTextBox input {
        font-size: 15px;
    }

    .inputArea {
        width: 300px;
        height: 40px;
        font-size: 20px;
        margin-left: -153px;
        margin-top: 10px    ;

        position: relative;
        left: 50%;
        top: 10px;

        border-radius: 5px;
        border: 1px solid #5e5e5e;

        display: block;
    }

    #loginJoinBox {
        /*background-color: yellow;*/

        height: 200px;

        margin: 10px 0;
    }

    #loginKeepingState, #loginJoinBox label {
        position: relative;
        left: 145px;

        cursor: pointer;

        margin-top: 10px;
    }

    .passwordSearch {
        position: relative;
        left: 225px;
    }

    #loginJoinBox button {
        display: block;
        width: 306px;

        margin: 5px auto;
        border-radius: 5px;
        border: 1px solid #5e5e5e;

        cursor: pointer;
    }

    #loginBtn {
        height: 50px;

        background-color: #27AE60;
    }

    #loginBtn:hover {
        background-color: #C5F8DA;
    }

    #signUpBtn {
        height: 35px;

        background-color: #BDBDBD;
    }

    #signUpBtn:hover {
        background-color: #E0E0E0;
    }
    
    #msg{
    	width:300px;
    	margin:30px auto 10px auto;
    	color:red;
    	text-align: center;
    }

</style>

</head>
<body>

<div id="content">

    <div id="loginBox">

    <div id="loginLogoBox">
        <a href="">
            <h1><img id="logoImg" src="img/logo.png" width="200"/></h1>
        </a>
    </div> <!-- #logoBox end -->

    <div id="loginFormBox">
		<form action="/log" method="post" >
        <div id="loginTextBox">
            <input id="id" name="id" class="inputArea" placeholder="&#xf2bb; 아이디를 입력해 주세요."/>
            <input id="password" type="password" name="password" class="inputArea" placeholder="&#xf13e; 비밀번호를 입력해 주세요."/>
			<div id="msg">
				<span>${message}</span>
			</div>
        </div>
        <div id="loginJoinBox">
            <input id="loginKeepingState" type="checkbox">
            <label for="loginKeepingState">로그인 상태 유지</label>
            <a class="passwordSearch" href="/">비밀번호 찾기</a>
            <button id="loginBtn">로그인</button>
            <button type="button" id="signUpBtn">회원가입</button>
        </div><!-- #loginJoin Box -->
		</form>
    </div><!-- #loginFormBox -->

    </div> <!-- #loginBox end -->

</div> <!-- #content end -->
</body>
</html>