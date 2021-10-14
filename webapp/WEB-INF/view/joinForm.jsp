<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <style>
        body{
            font-family: "Noto Sans KR",sans-serif;
            font-size: 14px;
            color:#3d3222;
        }
        #joinFormWrap {
            position: relative;
            width: 500px;
            margin: 100px auto;
        }

        #joinFormWrap input{
            height : 20px;
            padding: 10px;
        }

        #joinFormWrap #addressBtn{
            height: 44px;
            margin: 10px 0 0 5px;
        }

        #joinFormWrap label{
            margin-right: 10px;
        }

        .join_form_label{
            width: 115px;
            height: 40px;
            /*background-color: orange;*/
            line-height: 40px;
            /*제목들 크기 지정하기 위해서*/
            display: inline-block;
            font-size: 20px;
        }
        #joinFormLogoImg {
            width: 260px;
            height: 95px;
            text-align: center;
            /*450/2 - 260/2 = 95*/
            margin-left: 95px;
        }
        #joinForm {
            height: 700px;
            margin : auto;
            padding: 20px 0;
        }
        #joinFormWrap div {
            padding: 5px 0;
        }
        span {
            font-size: 18px;
        }

        #phoneNum , #email {
            width: 215px;
        }

        input[type=radio] {
            display: none;
        }
        input[type=radio]+label {
            display: inline-block;
            /*아나바다 키컬러*/
            background-color: #f3f3f3;
            border-radius: 8px;
            width: 100px;
            height: 40px;
            line-height: 40px;
            text-align: center;
            font-size: 18px;
        }
        input[type=radio]:checked+label {
            background-color: #27AE60;
            color: white;
        }
        label[for=certification] {
            visibility: hidden;
        }
        /*회원가입 폼 버튼들*/
        .join_form_btn {
            /*버튼 테두리 없애기*/
            border: 0;
            /*버튼 둥글기*/
            border-radius: 8px;
            /*오븐에서 지정한 값*/
            width: 100px;
            height: 40px;
            font-size: 12px;
            /*아나바다 키컬러*/
            background-color: #27AE60;
            color: white;
            outline: 0;
            cursor: pointer;
        }
        .join_form_btn:hover {
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        /*회원가입 버튼*/
        #joinBtn, #cancelBtn {
            width: 200px;
            height: 40px;
            background-color:#27AE60;
            color: white;
            border-radius: 8px;
            font-size: 18px;
            margin: 0 5px;
        }
        /*인증번호 받는 input*/
        #certification {
            width: 200px;
        }

        .input_width{
            width: 300px;

        }

        #joinFormWrap #birthYear{
            width: 100px;
        }

        #joinFormWrap #birthMonth, #joinFormWrap #birthDate{
            width: 50px;
        }

        #joinFormWrap #sample4_roadAddress, #joinFormWrap #sample4_detailAddress, .regex{
            margin-left: 128px;
        }

        .join_form_address_contents input{
            margin: 5px 0;

        }

        #joinFormWrap #sample4_postcode{
            width : 185px;
        }

        .certificationBtn{
            height: 40px;
        }

        .btn_wrap{
            text-align: center;
        }

        .hidden{
            display: none;
        }

    </style>
</head>
<body>
<div id="joinFormWrap">
    <h1><a href=""><img id="joinFormLogoImg" src="img/sun_logo.png"></a></h1>

    <form id="joinForm" action="/join" method="post" onsubmit="return finalCheck()">
        <fieldset>
            <div class="join_form_id_contents">
                <label class="join_form_label" for="id">ID</label>
                <input id="id" class="input_width" name="id" placeholder="ID를 입력하세요." maxlength="20" required>
                <div class="id_regex regex"></div>
            </div><!--.join_form_id_contents end-->

            <div class="join_form_password_contents">
                <label class="join_form_label" for="pw">비밀번호</label>
                <input id="pw" class="input_width" name="password" type="password" placeholder="비밀번호를 입력하세요." required>
                <div class="pw_regex regex"></div>
            </div><!--.join_form_password_contents end-->

            <div class="join_form_password_check_contents">
                <label class="join_form_label" for="pwCheck">비밀번호 확인</label>
                <input id="pwCheck" class="input_width" type="password" placeholder="비밀번호를 확인해주세요." required>
                <div class="pwCheck_regex regex"></div>
            </div><!--.join_form_password_check_contents end-->

            <div class="join_form_name_contents">
                <label class="join_form_label" for="name">이름</label>
                <input id="name" class="input_width" name="name" placeholder="이름을 입력하세요." maxlength="10" required>
                <div class="name_regex regex"></div>
            </div><!--.join_form_name_contents end-->

            <div class="join_form_gender_contents">
                <label class="join_form_label gender">성별</label>
                <input name="sex" type="radio" id="man" value="M"><label for="man">남</label>
                <input name="sex" type="radio" id="woman" value="F" checked><label for="woman">여</label>
            </div><!--/join_form_gender_contents end-->

            <div class="join_form_birth_contents">
                <label class="join_form_label">생년월일</label>
                <span><input id="birthYear" maxlength="4" name="year" placeholder="연도" required> 년</span>
                <span><input id="birthMonth" maxlength="2" name="month" placeholder="월" required> 월</span>
                <span><input id="birthDate" maxlength="2" name="date" placeholder="일" required> 일</span>
                <div class="birth_regex regex"></div>
            </div><!--.join_form_birth_contents end-->

            <div class="join_form_phone_contents">
            	<p>
                <label class="join_form_label" for="email">이메일</label>
                <input name="email" id="email" maxlength="20" placeholder="이메일를 입력해주세요." required>
                <button type="button" class="join_form_btn" id="certificationBtn">인증번호전송</button>
                </p>
                <span class="email_regex regex"></span>
            </div><!--.join_form_phone_contents end-->

            <div class="join_form_certification_contents">
            	<p>
                	<label class="join_form_label" for="email_regx">확인</label>
                	<input id="email_regx" placeholder="인증번호를 적어주세요." required>
               		<button type="button" class="join_form_btn" id="checkEmailBtn">확인</button>
                </p>
                <span class="certification_regex regex"></span>
            </div><!--.join_form_certification_contents end-->

            <div class="btn_wrap">
                <button class="join_form_btn" id="joinBtn" type="submit">회원가입</button>
            </div><!-- .btn_wrap end -->

        </fieldset>
    </form><!--#joinForm end-->

</div><!--#joinFormWrap end-->
<!--jquery import-->
<script src="js/jquery.js"></script>
<script>

    const $joinForm = $("#joinForm");
    const $joinBtn = $("#joinBtn");
	//인증번호
    let secretNum;
	//인증상태
	let auth=0;
    //유효성 검사 =======================================================
    const idExp = /^[a-zA-Z0-9]{4,20}$/;
    const emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const pwExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,16}$/;
    const pwCheckExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,16}$/;
    const nameExp = /^[가-힣]{2,10}$/;
    const birthYearExp = /^[0-9]{4}$/;
    const birthMonthExp = /^[0-9]{2}/;
    const birthDateExp = /^[0-9]{2}/;
	
    let arr=[false,false,false,false,false,false,false,false];

    const $id = $("#id");
    const $email = $("#email");
    const $pw = $("#pw");
    const $pwCheck = $("#pwCheck");
    const $name = $("#name");
    const $year = $("#birthYear");
    const $month = $("#birthMonth");
    const $date = $("#birthDate");
    //이메일인증 보내기 버튼
    const $certificationBtn=$("#certificationBtn");
    const $checkEmailBtn=$("#checkEmailBtn");
    const $email_regx=$("#email_regx");
    let today = new Date();
    let yearNow = today.getFullYear();
    let year;
    let month;
    let day;
 	function checkDate(){
  
		if (1900 > year || year > yearNow){ 
		  	return 1; 
		} else if (month < 1 || month > 12) {
			return 2; 
		} else if (day < 1 || day > 31) { 
			return 3;
		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			return 3; 
		} else if (month == 2) { 
			let isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) { 
				return 3;
			} else { 
				return 0;
			}
		} else {
			return 0;
		}
	}
 	function checkDateInput(){
 		if(arr[4]==true && arr[5]==true && arr[6]==true){
 			let num=checkDate()
 			if(num==0){
 				$(".birth_regex").html("잘 작성해주셨군요!");
 	            $(".birth_regex").css("color","#27AE60");
 	            return false;
 			}else if(num==1){
 				arr[4]=false;
 				year=null;
 				$year.val("");
 				$year.focus();
 			}else if(num==2){
 				arr[5]=false;
 				month=null;
 				$month.val("");
 				$month.focus();
 			}else{
 				arr[6]=false;
 				day=null;
 				$date.val("");
 				$date.focus();
 			}
 			$(".birth_regex").html("1999 년 08 월 03 일 형식으로 정확하게 적어주세요.");
	        $(".birth_regex").css("color","red");
 		}
 	}
    function finalCheck(){
    	for(let i=0; i<8; i++){
    		if(arr[i]==false){
    			console.log(i);
    			return false;
    		}
    	}
    	return true;
    }
    $id.on("keyup",function(){
    	$(".id_regex").html("탐색중");
        $(".id_regex").css("color","red");
        const result = $id.val();
		console.log(result);
        if(idExp.test(result)){
    			//이때 ajax를 이용하여 데이터베이스에
    			//이 아이디가 존재하는 지 확인!!
    			$.ajax({
    				url:"/ajax/check/id",//주소
    				type:"get",//방식
    				data:{"id":result},//파라미터
    				dataType:"json",//응답의 자료형
    				error:function(xhr,error){
    					alert("서버 점검중!");
    					$(".id_regex").html("다시 시도해주세요");
    			        $(".id_regex").css("color","red");
    				},
    				success:function(json){
    					console.log(json);
    					if(!json.result) {
    						$(".id_regex").html("좋은 아이디네요.");
    			            $(".id_regex").css("color","#27AE60");
    			            arr[0]=true;
    						
    					}else {
    						$(".id_regex").html("이미 있는 아이디입니다.");
    			            $(".id_regex").css("color","red");
    			            arr[0]=false;
    					}//if~else end
    				}
    			});//ajax end
        }else{
        	arr[0]=false;
            $(".id_regex").html("대문자 혹은 소문자, 숫자를 포함하여 4~20자로 입력해주세요.");
            $(".id_regex").css("color","red");
            // $joinBtn.attr("disabled",true);

        } //if-else end

    }); // $id input() end

    $pw.on("input",function(){
        const result = pwExp.test($pw.val());

        if(result){
            $(".pw_regex").html("좋은 비밀번호네요.");
            $(".pw_regex").css("color","#27AE60");
            arr[1]=true;

        }else{
            $(".pw_regex").html("하나 이상의 대문자, 소문자, 숫자 및 특수문자를 포함하여 8~16자로 입력해주세요.");
            $(".pw_regex").css("color","red");
            arr[1]=false;
        } //if-else end
    }); // $pw input() end

    //비밀번호 확인
    $pwCheck.on("keyup",function(){
        if($pw.val() == $pwCheck.val()){
            $(".pwCheck_regex").html("비밀번호가 일치합니다");
            $(".pwCheck_regex").css("color","#27AE60");
            arr[2]=true;
        }else{
            $(".pwCheck_regex").html("비밀번호가 일치하지않습니다");
            $(".pwCheck_regex").css("color","red");
            arr[2]=false;
        } //if-else end
    }) //$pwCheck keyup() end

    //이름 유효성검사
    $name.on("keyup",function(){
        const regex = nameExp
        const result = regex.exec($name.val());

        if(result != null){
            $(".name_regex").html("멋진 이름이네요.");
            $(".name_regex").css("color","#27AE60");
            arr[3]=true;
        }else{
            $(".name_regex").html("한글만 입력 가능합니다."); //우리 외국인 고갱님은 안받을건가요?
            $(".name_regex").css("color","red");
            arr[3]=false;
        } //if-else end
    }) //$name keyup() end
	
   

    $year.on("input",function(){
        const regex = birthYearExp
        year=$year.val();
        const result = regex.exec(year);

        if(result != null){
            arr[4]=true;
            checkDateInput();
        }else{
            $(".birth_regex").html("1999 년 08 월 03 일 형식으로 적어주세요.");
            $(".birth_regex").css("color","red");
            arr[4]=false;
        } //if-else end

    }) // $year input() end

    $month.on("keyup",function(){
        const regex = /\d{2}/;
        month=$month.val();
        const result = regex.exec(month);

        if(result != null){
            arr[5]=true;
            checkDateInput();
        }else{
            $(".birth_regex").html("1999 년 08 월 03 일 형식으로 적어주세요.");
            $(".birth_regex").css("color","red");
            arr[5]=true;
        } //if-else end

    }) // $month keyup

    $date.on("keyup",function(){
        const regex = /\d{2}/;
        day=$date.val();
        const result = regex.exec(day);

        if(result != null){
            arr[6]=true;
            checkDateInput();
        }else{
            $(".birth_regex").html("1999 년 08 월 03 일 형식으로 적어주세요.");
            $(".birth_regex").css("color","red");
            arr[6]=false;
        } //if-else end

    });
	$certificationBtn.on("click",function(){
		$certificationBtn.attr("disabled", true);
		secretNum=null;
		let inputValue = $email.val();
		if(emailExp.test(inputValue)){
			//console.log("형식은 맞음")
			$(".email_regex").html("전송중입니다.....");
            $(".email_regex").css("color","red");
			$.ajax({
				url:"/ajax/email",//주소
				type:"get",//방식
				data:{"email":inputValue},//파라미터
				dataType:"json",//응답의 자료형
				error:function(xhr,error){
					alert("서버 점검중!");
					$(".email_regex").html("잠시 후 전송해주세요");
		            $(".email_regex").css("color","red");
		            $certificationBtn.attr("disabled", false);
				},
				success:function(json){
					$(".email_regex").html("전송을 완료했습니다.");
		            $(".email_regex").css("color","#27AE60");
					//console.log(json.number);
					secretNum=json.number;
					$certificationBtn.attr("disabled", false);
				}
			});//ajax end
			
		}else{
			$(".email_regex").html("올바른 형식의 이메일로 입력해주세요.");
            $(".email_regex").css("color","red");
            $certificationBtn.attr("disabled", false);
		}
	});
	$checkEmailBtn.on("click",function(){
		let value=$email_regx.val();
		if(secretNum==null){
			$(".certification_regex").html("이메일 인증을 먼저해주세요.");
            $(".certification_regex").css("color","red");
		}else{
			if(secretNum==value){
				arr[7]=true;
				$(".certification_regex").html("인증이 완료되었습니다.");
	            $(".certification_regex").css("color","#27AE60");
			}else{
				$(".certification_regex").html("잘못된 번호를 입력하셨습니다");
	            $(".certification_regex").css("color","red");
			}
		}
	});
	
	//이메일 인풋 변경시 인증번호 삭제, 인증취소
	$email.on("change",function(){
		secretNum=null;
		arr[7]=false;
		$(".email_regex").html("");
		$(".certification_regex").html("");
	});
	
	
    $("#joinBtn").on("click");

</script>

</body>
</html>