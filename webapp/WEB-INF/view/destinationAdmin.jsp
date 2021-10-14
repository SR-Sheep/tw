<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 배송지관리</title>
</head>
<link rel="stylesheet" href="/css/reset.css"/>
<link rel="stylesheet" href="/css/all.min.css"/>
<link rel="stylesheet" href="/css/notosanskr.css">
<link rel="stylesheet" href="/css/default.css">
<style>

    #adminWrap{
        width: 1100px;
        overflow: hidden;
    }
    #adminWrap h1{
        margin-top: 50px;
        margin-left: 60px;
        font-size: 25px;
    }
    #btnWrap{
        float: right;
    }
    #btnWrap button{
        position: relative;
        top:-20px;
        right: 280px;
        font-family: "Noto Sans KR", sans-serif;
        width: 120px;
        height: 30px;
        border: 1px solid #bebebe;
        border-radius: 5px;
        background-color: #fff;
    }
    #tableWrap table{
        width: 800px;
        margin-left: 50px;
    }
    #tableWrap th{
        background-color:  #C5F8DA;
        height: 70px;
        line-height: 70px;
    }
    #tableWrap td{
        text-align: center;
        background-color: #fff;
    }
    tr{
        border-bottom: 1px solid #424242;
    }
    td{
        background-color: red;
        height: 100px;
    }

    .user_name{
        margin-top: 15px;
    }
    .basic{
        margin-top: 15px;
        margin-left: 40px;
        width: 80px;
        height: 20px;
        margin-bottom: 15px;
        border: 2px solid #27AE60;
        color: #27AE60;
    }
    .post_num{
        margin-top: 15px;
        text-align: left;
        color: #bebebe;
        margin-bottom: 10px;
    }
    .address{
        margin-bottom: 10px;
        text-align: left;
    }
    .address_detail{
        text-align: left;
    }
    .phone{
        vertical-align: middle;
    }
    .c_d_btn{
        vertical-align: middle;
    }
    .basic_margin{
        vertical-align: middle;
    }
    .basic_name{
        margin-top: 15px;
    }
    .c_d_btn button{
        width: 50px;
    	margin: 5px 10px;
    }
    #destinationPopWrap{
        position: fixed;
        top:50%;
        left: 50%;
        margin: -380px 0 0 -350px;
        width: 700px;
        height: 760px;
        z-index: 1;
        background-color: #fff;
        border: 1px solid #bebebe;
        display: none;
        transform: scale(0.8);
    }
    #destinationPopHeader{
        width: 700px;
        height: 80px;
        border-bottom: 1px solid #bebebe;
        overflow: hidden;
    }
    #logoPop{
        width: 150px;
        height: 80px;
        float: left;
    }
    #logoPop img{
        margin-top: 5px;
        margin-left: 10px;
    }
    #titlePop{
        width: 400px;
        height: 80px;
        float: left;
        text-align: center;
        line-height: 80px;
        font-size: 25px;
    }
    #closePop{
        width: 150px;
        height: 80px;
        float: right;
    }
    .btn{
        cursor: pointer;
        border: none;
        outline: none;
        background-color: #fff;
        border-radius: 5px;
        width: 100px;
        height: 40px;
    }
    #closePop .btn{
        margin-top: 23px;
        float: right;
        font-size: 30px;
        background-color: #fff;
    }
    .btn img{
        width: 100px;
        height: 40px;
        cursor: pointer;
    }
    #destinationPopContent{
        width: 700px;
        height: 598px;

    }
    #destinationDetail{
        width: 600px;
        height: 70px;
        margin:0 auto 20px auto;
        border-bottom: 1px solid #bebebe;
        line-height: 70px;
    }
    #contentWrap{
        width: 600px;
        margin: auto;
    }
    .inputWrap label{
        display: inline-block;
        width: 80px;
    }
    .inputBox{
        margin-top: 20px;
        margin-left: 50px;
        width: 200px;
        height: 40px;
        border: 1px solid #bebebe;
        border-radius: 5px;
    }
    .inputWrap .btn{
        border: 2px solid #27AE60;
        margin-left: 5px;
        color: #27AE60;
        font-weight: 700;
        width: 120px;
        height: 43px;
    }
    .inputAddressDetail{
        margin-top: 5px;
        width: 430px;
    }
    .phone{
        width: 100px;
        height: 40px;
        text-align: center;
    }
    .inputWrap span{
        font-size: 50px;
        position: relative;
        top:20px;
        left: 5px;
    }
    .phone2{
        margin-left: 10px;
    }
    .phoneNum{
        position: relative;
        top:10px;
    }
    .checkBox{
        width: 20px;
        height: 20px;
        margin-top: 40px;
    }
    .basic_destination{
        position: relative;
        bottom: 3px;
    }
    #basic_setting{
        position: relative;
        top:-4px;
        left: 10px;
        font-size: 100%;
    }
    .list_text{
        margin-top: 40px;
    }
    #destinationPopFooter{
        width: 700px;
        height: 50px;
        text-align: center;
        line-height: 50px;
    }
    .pop_btn{
        border: 1px solid #bebebe;
        margin-left: 30px;
    }
    .pop_btn:hover{
        background-color: #27AE60;
        color: #fff;
    }



</style>
<body>
           
           
<!-- #destinationWrap -->
<div id="destinationWrap">
    <div id="adminWrap">
        <h1>배송지 관리</h1>
        <div id="btnWrap">
            <button id="btnRegister">+ 배송지 등록</button>
        </div>
    </div>
    <!-- #tableWrap -->
    <div id="tableWrap">
    
        <table>
            <thead>
            <tr>
                <th style="width: 20%" >배송지</th>
                <th style="width: 30%">주소</th>
                <th style="width: 25%">연락처</th>
                <th style="width: 25%">수정 / 삭제</th>
            </tr>
            </thead>
            <tbody>
            
            <%-- 21.03.04 10:25 김기현 수정 --%>
            <c:forEach items="${addressList }" var="address">
            <tr>
                <!--기본배송지일때 class="basic_name" 추가바람 -->
                <td class="basic_margin">
	                <p class="destination_name basic_name">${address.name }</p>
	                <p class="user_name">${address.receiver }</p>  
	                <c:if test="${address.baseDet=='Y' }">
	                <p class="basic">기본배송지</p>
	                </c:if>
                </td>
                
                <td>
                <p class="post_num">${address.postcode }</p>
                <p class="address">${address.address }</p> 
                <p class="address_detail">${address.addressDetail }</p>
                </td>
                <td class="phone">${address.fullPhone }</td>
                <td class="c_d_btn">
                	<button class="btnModify">수정</button>
                <form action="/member/${address.memberNo}/address" method="post">
                	<button>삭제</button>
                	<input type="hidden" name="_method" value="DELETE" />
                	<input type="hidden" name="no" value="${address.no}"/>
                </form>
                </td>
            </tr>
            </c:forEach>
            
            </tbody>
        </table>
        
    </div><!-- //#tableWrap -->
</div><!-- //#destinationWrap -->


<!-- #destinationPopWrap -->
<div id="destinationPopWrap">

    <div id="destinationPopHeader">
        <div id="logoPop">
            <img src="/img/sun_logo.png" width="120" height="70">
        </div>
        <div id="titlePop">배송지 등록</div>
        <div id="closePop">
            <button name="CloseBtn" class="btn close"><img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M7.05 7.05l9.9 9.9M16.95 7.05l-9.9 9.9'/%3E %3C/g%3E %3C/svg%3E" alt="닫기 버튼"></button>
        </div>
    </div>
    
    <div id="destinationPopContent">
        <div id="destinationDetail">배송지 정보 상세</div>
        <!-- #contentWrap -->
        <div id="contentWrap">
        	
			<form id="addressBtnSubmit" action="/member/${memberNo }/address" method="post">
        	<input type="hidden" name="memberNo" value="${memberNo }" />

            <div class="inputWrap">
                <label>배송지명</label>
                <input  class="inputBox" type="text" maxlength="20" name="name" value="" placeholder="배송지명을 입력해주세요."  />
            </div>
            <div class="inputWrap">
                <label>수령인</label>
                <input  class="inputBox" type="text" maxlength="20" name="receiver" value="" placeholder="수령인을 입력해주세요."  />
            </div>
            <div class="inputWrap">
                <label>주소</label>
                <input id="sample6_postcode" onclick="sample6_execDaumPostcode()" class="inputBox" type="text" maxlength="20" name="postcode" value="" readonly placeholder="우편번호를 입력해주세요."  />
                <button class="btn" onclick="sample6_execDaumPostcode()" type="button">주소검색</button>
            </div>
            <div class="inputWrap">
            	<label></label>
                <input id="sample6_address"  class="inputBox inputAddressDetail" type="text" maxlength="20" name="address" value="" readonly placeholder="주소를 입력해주세요."  />
            </div>
            <div class="inputWrap">
            	<label></label>
                <input  class="inputBox inputAddressDetail" type="text" maxlength="20" name="addressDetail" value="" placeholder="상세주소를 입력해주세요."  />
            </div>
            <div class="inputWrap">
                <label class="phoneNum">연락처</label>
                <input type="hidden" name="phone" />
                <select id="phone1" class="inputBox phone" name="phone1" >
                    <option value="010">010</option>
                    <option value="016">016</option>
                    <option value="011">011</option>
                </select>
                <span>-</span>
                <input  class="inputBox phone phone2" type="text" maxlength="4" name="phone2" value="" />
                <span>-</span>
                <input  class="inputBox phone phone2" type="text" maxlength="4" name="phone3" value="" />
            </div>
            <div class="inputWrap">
                <label class="basic_destination">기본배송지</label>
                <input  class="inputBox checkBox" type="checkbox" name="base" />
                <input  class="inputBox checkBox" type="hidden" name="baseDet" value="N" />
                <span id="basic_setting">기본 배송지로 설정</span>
            </div>
            <div class="inputWrap list_text">
                <em>입력/수정하신 배송지는 배송지 목록에 저장됩니다.</em>
            </div>
        	</form>
            
        </div><!-- //#contentWrap -->
    </div>
    <div id="destinationPopFooter">
        <button class="btn close pop_btn">닫기</button>
        <button form="addressBtnSubmit" class="btn save pop_btn">저장</button>
    </div>
</div><!-- //#destinationPopWrap -->


<script src="/js/jquery.js"></script>
<!--카카오 지도 api script-->
<!--도로명 주소 검색 api-->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	
	//저장하기 클릭 시
	//21.03.04 11:49 김기현
	$(".save").on("click", function() {
		
		let phone1 = $("select[name=phone1]").val();
		let phone2 = $("input[name=phone2]").val();
		let phone3 = $("input[name=phone3]").val();
		console.log(phone1);
		console.log(phone2);
		console.log(phone3);
		
		//전화번호를 받아오는 input 3개의 문자열을 합친다
		let phone = phone1 + phone2 + phone3;
		console.log(phone);
		
		//합친 문자열을 input hidden name=phone에 넣어준다.
		$("input[name=phone]").val(phone);
		
		//checkbox가 체크 되있다면 Y, 아니라면 N
		//
		if($("input[name=base]").is(":checked") == true) {
			$("input[name=baseDet]").val("Y");
		}

	});

	var name = ${address.name}
	
	console.log(name);

	
	

	//21.03.04 11:49 김기현 .btnModify ajax 추가
	$(".btnModify").on("click",function () {
		
	    $.ajax({
	    	url:"/ajax/address/modify", //uri 주소
	    	type:"get", //get방식
	    	error:function(error) {
	    		alert("error!");
	    		console.log(error);
	    	},
	    	success:function(json) {
	    		//수정 창이 보임
	    		$("#destinationPopWrap").css("display","block");
	    		//수정 클릭 시 form요소 안에 input _method PUT 추가
	    		$("#addressBtnSubmit").append('<input type="hidden" name="_method" value="PUT" />');
	    		
	    		$("input[name=name]").attr("value","${address.name}");
	    		$("input[name=receiver]").attr("value","${address.receiver}");
	    		$("input[name=postcode]").attr("value","${address.postcode}");
	    		$("input[name=address]").attr("value","${address.address}");
	    		$("input[name=addressDetail]").attr("value","${address.addressDetail}");
	    		$("input[name=phone1]").attr("value","${address.phone1}");
	    		$("input[name=phone2]").attr("value","${address.phone2}");
	    		$("input[name=phone3]").attr("value","${address.phone3}");
	    		$("input[name=baseDet]").attr("value","${address.baseDet}");
	    		
	    		
	    		
	    		console.log(${address.name});
	    		console.log(${address.receiver});
	    		console.log(${address.postcode});
	    		console.log(${address.address});
	    		console.log(${address.addressDetail});
	    		console.log(${address.phone1});
	    		console.log(${address.phone2});
	    		console.log(${address.phone3});
	    		console.log(${address.baseDet});
	    		
	    	}
	    });//ajax end
	    
	});



	
	


    $("#btnRegister").on("click",function () {
        $("#destinationPopWrap").css("display","block");
    });
    
    $(".close img").on("click",function () {
        $("#destinationPopWrap").css("display","none");
    });
    $(".close").on("click",function () {
        $("#destinationPopWrap").css("display","none");
    });

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;

                } //else {
                  //  document.getElementById("sample6_extraAddress").value = '';
                // }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
                $(".inputAddressDetail").focus();
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    /* //지도 및 주소 검색 api */






</script>
</body>
</html>