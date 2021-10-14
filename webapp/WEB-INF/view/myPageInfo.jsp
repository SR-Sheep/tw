<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>선:MALL myPageInfo</title>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css">
<style>
#navi {
	float: left;
	width: 200px;
	height: 100%;
}

#navi dt:nth-child(1) {
	position: relative;
	background-color: #C5F8DA;
	width: 200px;
	height: 200px;
	text-align: center;
	padding: 0;
}

#navi dt, #navi dd {
	width: 175px;
	padding-left: 25px;
	height: 40px;
	line-height: 30px;
}

#navi dt a, #navi dd a {
	text-decoration: none;
	color: black;
}

#navi dt {
	border-top: 1px solid #000;
	font-size: 20px;
	font-weight: 700;
}

#contents img {
	border-radius: 80px;
	display: inline-block;
	text-indent: -9999px;
	overflow: hidden;
}

#dashBoard {
	position: relative;
	top: 0;
	width: 900px;
}

#dashBoard li {
	border: 1px solid #000;
	/*background-color: #00bcd4;*/
	height: 200px;
	width: 298px;
	float: left;
	text-align: center;
}

#dashBoard li>div, #navi div {
	height: 50px;
	padding: 0;
}

#dashBoard li>div {
	position: relative;
}

.middle {
	top: 30px;
}

.now {
	padding-top: 10px;
}

#destinationWrap {
	width: 900px;
	float: right;
}

#dashBoardBox {
	float: left;
}

html {
	width: 100%;
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	font-family: "Noto Sans KR", sans-serif;
}

#wrap {
	width: 1100px;
	margin: auto;
}

#header {
	width: 100%;
	height: 79px;
	margin: auto;
	border-bottom: 1px solid #424242;
	position: relative;
}

#headerLogoBox {
	width: 200px;
	height: 80px;
	text-align: center;
	position: absolute;
}

#headerLogo {
	height: 60px;
	margin: 10px 0px;
}

#headerSearchBox {
	width: 300px;
	height: 80px;
	position: absolute;
	margin-left: 200px;
}

#headerItemSearchBox {
	width: 258px;
	height: 38px;
	line-height: 38px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	margin: 20px auto;
}

#headerItemSearch {
	width: 200px;
	height: 28px;
	border: 0px;
	border-bottom: 1px solid #424242;
	background-color: transparent;
	margin-left: 5px;
}

#headerItemSearchBtn {
	width: 38px;
	height: 38px;
	background-color: #27AE60;
	border-radius: 50%;
	border: none;
	color: #ffffff;
}

#headerKeywordBox {
	width: 200px;
	height: 80px;
	line-height: 80px;
	position: absolute;
	margin-left: 500px;
	text-align: center;
}

#headerCurrentShowingRank {
	font-weight: bold;
	color: #27AE60;
}

#headerCurrentShowingKeyword {
	width: 120px;
	display: inline-block;
}

#headerMoreKeywordDownBtn {
	color: #27AE60;
	display: none;
}

#headerMoreKeywordUpBtn {
	color: #27AE60;
	display: none;
}

#headerUserName {
	width: 200px;
	height: 80px;
	line-height: 80px;
	position: absolute;
	margin-left: 700px;
	text-align: center;
}

#headerPoint {
	width: 100px;
	height: 80px;
	position: absolute;
	margin-left: 900px;
	line-height: 80px;
	text-align: center;
}

#headerPoint>Strong {
	color: #27AE60;
}

#headerMyCart {
	width: 100px;
	height: 80px;
	line-height: 80px;
	position: absolute;
	margin-left: 1000px;
	text-align: center;
	font-size: 30px;
}

#headerMoreKeywordListBox {
	width: 200px;
	height: 100%;
	position: absolute;
	margin-left: 500px;
	margin-top: 80px;
	display: none;
}

#headerMoreKeywordList {
	border: 1px solid #424242;
}

.header_more_keyword {
	width: 198px;
	height: 40px;
	line-height: 40px;
	/*text-align: center;*/
}

.header_more_keyword span:nth-child(1) {
	margin: 0px 20px;
}

#headerMoreKeywordDownBtn.active, #headerMoreKeywordUpBtn.active {
	display: inline;
}

#headerMoreKeywordListBox.active {
	display: block;
}

#wrap {
	width: 1100px;
	margin: auto;
}

body {
	font-family: "Noto Sans KR", sans-serif;
	user-select: none;
}

#adminWrap {
	width: 1100px;
	overflow: hidden;
}

#adminWrap h1 {
	margin-top: 50px;
	margin-left: 60px;
	font-size: 25px;
}

#containerMyPageInfoTitle {
	font-size: 25px;
}

#myPageInfoTable {
	border-collapse: collapse;
	font-size: 20px;
	width: 700px;
}

.info_table_columns_row {
	height: 100px;
	line-height: 100px;
}

.info_table_columns_name {
	text-align: center;
}

.info_table_columns_row td {
	width: 200px;
	border-bottom: 1px solid #424242;
}

.info_change_pop_up_wrap {
	width: 100%;
	height: 100%;
	position: fixed;
	margin: 0;
	left: 0;
	top: 0;
	background-color: rgba(0, 0, 0, .5);
	display: none;
}

.info_change_pop_up_wrap.active {
	display: block;
}

.info_change_pop_up_box {
	width: 600px;
	height: 400px;
	position: fixed;
	left: 50%;
	top: 50%;
	margin: -200px 0 0 -300px;
	background-color: #ffffff;
}

.info_change_pop_up_header {
	font-size: 30px;
	margin: 30px 20px;
}

.info_change_pop_up_container {
	width: 80%;
	margin: 20px auto;
	font-size: 20px;
	border: 1px solid #424242;
}
.info_change_pop_up_container_title{
   display:inline-block;
   width:100px;
   margin-left:10px;
}
.info_change_pop_up_container>p {
   margin-top:20px;
}
#sendCheckText.send_check, #certificationNumCheckText.certificationNumCheck{
   display:inline-block;
   width:100%;
   height:15px;
   font:10px;
   margin: 10px;
   line-height:15px;
}

.info_change_pop_up_container>span {
	margin: 0px 20px;
}

#infoChangeEmail {
	width: 250px;
	height: 30px;
}

.info_change_pop_up_footer {
	text-align: center;
}

.info_change_pop_up_footer>button {
	width: 100px;
	height: 50px;
	margin: 20px;
	font-size: 30px;
	outline: none;
	border: none;
}
#sendEmailBtn, #checkEmailBtn{
   width:88px;
   height:35px;
   line-height:37px;
   background-color:#fff;
   border:1px solid #27AE60;
   color: #27AE60;
   font:18px;
   text-align:center;
   display: inline-block;
   margin-left : 10px;
}

.info_change_pop_up_footer>button:hover {
	color: #27AE60;
	border: 1px solid #27AE60;
}

#footer{
        margin-top: 40px;
        float: right;
        /*너비*/
        width: 1100px;
        /*높이*/
        height: 150px;
        /*배경색*/
        background-color: #f3f3f3;

    }
    #footer a{
        /*a요소밑줄없애기*/
        text-decoration: none;
        /*글자색*/
        color:#808080;
    }

    .footerInfo{
        /*너비*/
        width:1100px;
        /*글자크기*/
        font-size: 11px;
    }
    #company{
        /*부모기준*/
        position: absolute;
        margin: 15px 35px;
    }
    #policy{
        /*부모기준*/
        position: absolute;
        margin: 35px 35px;
    }

    #footer small{
        /*글자색*/
        color:#808080;
    }
    #footer img{
        display: inline-block;
        margin-top: 20px;
        margin-left: 35px;
    }
    #footer span{
        position: relative;
        top:-20px;
    }

</style>
</head>
<body>

	<div id="wrap">

		<div id="header">
			<div id="headerLogoBox">
				<a href="/"><img id="headerLogo" src="/img/sun_logo.png"></a>
			</div>
			<div id="headerSearchBox">
				<div id="headerItemSearchBox">
					<input id="headerItemSearch" name="itemSearchKeyword"
						placeholder="찾고 싶은 상품을 검색해 보세요">
					<button id="headerItemSearchBtn">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<div id="headerKeywordBox">
				<div id="headerShowingKeyword">
					<span id="headerCurrentShowingRank">1</span> <span
						id="headerCurrentShowingKeyword">레고꽃다발</span> <span
						id="headerMoreKeywordDownBtn" class="active"><i
						class="fas fa-chevron-circle-down"></i></span> <span
						id="headerMoreKeywordUpBtn"><i
						class="fas fa-chevron-circle-up"></i></span>
				</div>
			</div>
			<div id="headerUserName">
				<a href=""><strong>${userInfo.name}님</strong></a>
			</div>
			<div id="headerPoint">
				<strong>P</strong> <span>${userInfo.point}p</span>
			</div>
			<div id="headerMyCart">
				<a href=""><i class="fas fa-shopping-cart"></i></a>
			</div>
			<div id="headerMoreKeywordListBox">
				<ul id="headerMoreKeywordList">
					<li class="header_more_keyword"><span>1</span> <span>레고
							꽃다발</span></li>
					<li class="header_more_keyword"><span>2</span> <span>꽃다발</span>
					</li>
					<li class="header_more_keyword"><span>3</span> <span>레고
							세트</span></li>
					<li class="header_more_keyword"><span>4</span> <span>초콜릿</span>
					</li>
					<li class="header_more_keyword"><span>5</span> <span>케이크</span>
					</li>
				</ul>
			</div>
		</div>


		<div>
			<dl id="navi">
				<dt>
					<div class="middle">
						<img src="/img/${userInfo.profile}" width="80px" height="80px" alt="프로필" />
						<div>${userInfo.name} 님</div>
					</div>
				</dt>
				<dt>
					<a href="">MY 쇼핑</a>
				</dt>
				<dt>
					<a href="">MY 쿠폰</a>
				</dt>
				<dt>
					<a href="">찜 리스트</a>
				</dt>
				<dt>
					<a href="">장바구니</a>
				</dt>
				<dt>상품리뷰</dt>
				<dd>
					<a href="">작성 가능한 리뷰</a>
				</dd>
				<dd>
					<a href="">내가 작성한 리뷰</a>
				</dd>
				<dt>MY 정보</dt>
				<dd>
					<a href="">개인정보수정</a>
				</dd>
				<dd>
					<a href="">배송지 관리</a>
				</dd>
			</dl>
		</div>
		<div id="dashBoardBox">
			<ul id="dashBoard">
				<li><div class="middle">
						<img src="/img/deliver.jpg" width="80px" height="80px" alt="배송중" />
						<div class="now">배송중 ${delWaitingCount}개</div>
					</div></li>
				<li><div class="middle">
						<img src="/img/coupon.jpg" width="80px" height="80px" alt="쿠폰" />
						<div class="now">할인 쿠폰 3개</div>
					</div></li>
				<li><div class="middle">
						<img src="/img/cash.png" width="80px" height="80px" alt="캐시" />
						<div class="now">
							보유 캐시 ${userInfo.point}원
							<p>
								<button>충전하기</button>
							</p>
						</div>
					</div></li>
			</ul>


			<div id="containerMyPageInfo">
				<table id="myPageInfoTable">
					<tbody>
						<tr class="info_table_columns_row">
							<td colspan="3" id="containerMyPageInfoTitle">개인정보 수정</td>
						</tr>
						<tr class="info_table_columns_row">
							<td class="info_table_columns_name">이름</td>
							<td colspan="2">${userInfo.name}</td>
						</tr>
						<tr class="info_table_columns_row">
							<td class="info_table_columns_name">아이디</td>
							<td colspan="2">${userInfo.id}</td>
						</tr>
						<tr class="info_table_columns_row">
							<td class="info_table_columns_name">비밀번호</td>
							<td colspan="2"><a href="">비밀번호 변경하러 가기</a></td>
						</tr>
						<tr class="info_table_columns_row">
							<td class="info_table_columns_name">이메일</td>
							<td id="infoTableEmailText">${userInfo.email}</td>
							<td><button id="infoTableMyEmailChangeBtn">이메일 주소
									변경</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!--푸터-->
		<div id="footer">
			<!--푸터 로고-->
			<h1 id="fLogo">
				<img src="/img/sun_logo.png" alt="로고" width="100px" height="50px">
				<span>선몰(주)</span>
			</h1>
			<!--//푸터 로고-->
			<!--푸터 이용약관-->
			<div id="company" class="footerInfo">대표이사 : JYP 주소 : 서울특별시 관악구
				남부순환로 에그옐로우 6층</div>

			<div id="policy" class="footerInfo">사업자등록번호 : 152-56-78912
				통신판매업신고 : 2021-서울관악구-1579</div>

			<!--//푸터 이용약관-->
		</div>
		<!--//푸터-->




		<div id="myEmailChangePopUp" class="info_change_pop_up_wrap">
         <div class="info_change_pop_up_box">
            <div class="info_change_pop_up_header">이메일 주소 변경</div>
            <div class="info_change_pop_up_container">
            <p>
               <span class="info_change_pop_up_container_title">이메일 주소</span><input id="infoChangeEmail" name="email" placeholder="이메일 주소를 입력하세요" /><button id="sendEmailBtn">인증하기</button>
            </p>
            <span id="sendchecktext" class="send_check"></span>
            <p>
               <span class="info_change_pop_up_container_title">인증번호</span><input id="infoCheckEmail" placeholder="이메일 주소를 입력하세요" /><button id="checkEmailBtn">확인하기</button>
            </p>
            <span id="certificationNumCheckText" class="certificationNumCheck"></span>   
            </div>
            <div class="info_change_pop_up_footer">
               <button id="infoChangeEmailBtn" type="button">등록</button>
               <button class="pop_up_close_btn" type="button">닫기</button>
            </div>
         </div>
      </div>

		<script src="/js/jquery.js"></script>
		<script>
		//테이블의 정보 변경 버튼
        const $infoTableMyEmailChangeBtn = $("#infoTableMyEmailChangeBtn");
        //팝업 wrap 관련 요소
        const $myEmailChangePopUp = $("#myEmailChangePopUp");
        const $info_change_pop_up_wrap = $(".info_change_pop_up_wrap");
        //팝업 닫기 버튼 요소
        const $pop_up_close_btn = $(".pop_up_close_btn");
        //팝업 수정 버튼 요소
        const $infoChangeEmailBtn = $("#infoChangeEmailBtn");
        // 수정 값 인풋 요소
        const $infoChangeEmail = $("#infoChangeEmail");
        // 인증번호 인풋 요소
        const $infoCheckEmail = $("#infoCheckEmail");
        //테이블 데이터 요소
        const $infoTableEmailText = $("#infoTableEmailText");
        //이메일 전송버튼
        const $sendEmailBtn = $("#sendEmailBtn");
        //인증코드 확인버튼
        const $checkEmailBtn = $("#checkEmailBtn");
        
        let secretNum;
        let auth=false;
        
         $sendEmailBtn.on("click",function(){
               $sendEmailBtn.attr("disabled", true);
              secretNum=null;
              let inputValue = $infoChangeEmail.val();
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
                          $sendEmailBtn.attr("disabled", false);
                    },
                    success:function(json){
                       $(".send_check").html("전송을 완료했습니다.");
                          $(".send_check").css("color","#27AE60");
                       console.log(json.number);
                       secretNum=json.number;
                       $sendEmailBtn.attr("disabled", false);
                    }
                 });//ajax end
                 
              }else{
                 $(".send_check").html("올바른 형식의 이메일로 입력해주세요.");
                    $(".send_check").css("color","red");
                    $sendEmailBtn.attr("disabled", false);
              }
           });
           $checkEmailBtn.on("click",function(){
              let value=$infoCheckEmail.val();
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
           $infoChangeEmail.on("change",function(){
              secretNum=null;
              auth=false;
              $(".send_check").html("");
              $(".certificationNumCheck").html("");
           });
        
        

        let emailExp =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        //팝업 켜고 닫는 이벤트
        $infoTableMyEmailChangeBtn.on("click", function() {
           $myEmailChangePopUp.addClass("active");
        });
        $pop_up_close_btn.on("click", function() {
           $info_change_pop_up_wrap.removeClass("active");
        });
        
        //등록 ajax 이벤트
        $infoChangeEmailBtn.on("click", function() {
           let id="abcd";
           let value = $infoChangeEmail.val();
           console.log(value);
           if (auth) {
              let data = {
                 "email" : value
              }
              console.log(data);
              $.ajax({
                 url : "/member/"+id+"/email",
                 
                 type : 'PUT',
                 data:data,
                 dataType : "json",
                 error : function(xhr, error, code) {
                    console.log("ajax에러");
                 },
                 success : function(json) {
                    //변경 완료
                    $infoTableEmailText.text(value);
                    $info_change_pop_up_wrap.removeClass("active");
                 }
              });
           } else {
              alert("잘못된 형식을 입력하셨습니다. 다시 확인해주세요");
              $infoChangeEmail.focus();
           }
        });
		</script>
</body>
</html>