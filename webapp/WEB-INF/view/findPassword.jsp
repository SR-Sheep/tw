<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 현재 비밀번호 입력</title>
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
            margin-top: 50px;
            margin-left: 220px;
        }
        #findIdWrap{
            width: 680px;
            height: 390px;
            border: 1px solid rgb(190, 190, 190);
            margin:30px auto 60px auto;
            border-radius: 10px;

        }
        #loginWrap input{
            font-family: "Noto Sans KR",sans-serif;
        }

        .emailBox{
            width: 400px;
            height: 55px;
            border-radius: 5px;
            border: 1px solid rgb(127,127,127);
            outline: none;
            text-indent: 10px;
            margin-left: 60px;


        }
        #email{
            margin-top: 20px;
        }
        #checkEmail{
            margin-top: 10px;
        }
        .checkMsg{
            font-size: 13px;
            font-weight: 500;
            color:red;
            margin-left: 60px;
            margin-top: 5px;
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
        #confirm {
            background-color: rgb(127, 127, 127);
        }
        #btnFindPassword{
            width: 566px;
            height: 55px;
            border-radius: 5px;
            background-color: rgb(127, 127, 127);
            color: #fff;
            box-shadow: 0 0 2px #424242;
            font-size: 17px;
            font-weight: bold;
            margin-left: 55px;
            margin-top: 30px;
        }
        #id{
            margin-top: 40px;
        }




    </style>

</head>
<body>
<div id="wrap">


<div id="content">
    <div id="findIdText">비밀번호 찾기</div>
    <div id="findIdWrap">
        <form action="/authorize" method="POST" onsubmit="">
            <input id="id" class="emailBox" placeholder="아이디를 입력해 주세요." type="text" maxlength="20" name="id">
            <h3 class="idCheck checkMsg "><c:if test="${msg!=null }">${msg }</c:if></h3>
            <input id="email" class="emailBox" placeholder="이메일을 입력해 주세요." type="text"  name="email" >
            <div class="btnWrap">
                <button id="send" class="btnConfirm"  type="button">인증번호 전송</button>
            </div>
			<h3 class="send_check checkMsg"></h3>
            <input id="checkEmail" class="emailBox" placeholder="인증번호를 입력해 주세요." type="text" >
            <div class="btnWrap">
                <button id="confirm" class="btnConfirm" type="button" >인증번호 확인</button>
            </div>
            <h3 class="certificationNumCheck checkMsg"></h3>
            <button id="btnFindPassword" >비밀번호 찾기</button>
        </form>
    </div>


</div>


</div>
<!--//wrap-->
<script src="js/jquery.js"></script>
<script>
	const $send = $("#send");
	const $confirm = $("#confirm");
	const $email =$("#email");
	const $checkEmail = $("#checkEmail");
	const emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let secretNum;
	let auth=false;
	/*
    $("#btnFindPassword").on("click",function () {
        $(".idCheck").text("가입되지 않는 아이디입니다.").css("color","red");
    });


    $("#send").on("click",function () {
        $("#confirm").css("backgroundColor","#27AE60");
        $("#confirm").attr("disabled", false);
    });


    $("#confirm").on("click",function () {
        $(".certificationNumCheck").text("인증번호가 일치하지 않습니다").css("color","red");
        $("#btnFindPassword").attr("disabled", false);
        $("#btnFindPassword").css("backgroundColor","#27AE60");
    });
*/
	function check(){
		return auth;
	}

    $send.on("click",function(){
    	$send.attr("disabled", true);
		secretNum=null;
		let inputValue = $email.val();
		if(emailExp.test(inputValue)){
			console.log("형식은 맞음")
			$(".send_check").html("전송중입니다.....");
            $(".send_check").css("color","red");
			$.ajax({
				url:"/ajax/email",//주소
				type:"get",//방식
				data:{"email":inputValue},//파라미터
				dataType:"json",//응답의 자료형
				error:function(xhr,error){
					alert("서버 점검중!");
					$(".send_check").html("잠시 후 전송해주세요");
		            $(".send_check").css("color","red");
		            $send.attr("disabled", false);
				},
				success:function(json){
					$(".send_check").html("전송을 완료했습니다.");
		            $(".send_check").css("color","#27AE60");
					console.log(json.number);
					secretNum=json.number;
					$send.attr("disabled", false);
				}
			});//ajax end
			
		}else{
			$(".send_check").html("올바른 형식의 이메일로 입력해주세요.");
            $(".send_check").css("color","red");
            $send.attr("disabled", false);
		}
	});
	$confirm.on("click",function(){
		let value=$checkEmail.val();
		if(secretNum==null){
			$(".certificationNumCheck").html("이메일 인증을 먼저해주세요.");
            $(".certificationNumCheck").css("color","red");
		}else{
			if(secretNum==value){
				auth=true;
				$(".certificationNumCheck").html("인증이 완료되었습니다.");
	            $(".certificationNumCheck").css("color","#27AE60");
			}else{
				$(".certificationNumCheck").html("잘못된 번호를 입력하셨습니다");
	            $(".certificationNumCheck").css("color","red");
			}
		}
	});
	
	//이메일 인풋 변경시 인증번호 삭제, 인증취소
	$email.on("change",function(){
		secretNum=null;
		auth=false;
		$(".email_regex").html("");
		$(".certification_regex").html("");
	});


</script>
</body>
</html>