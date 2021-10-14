<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<div class="buy_layer_wrap">
	<div class="buy_wrap">
	
	</div><!--//.buy_wrap-->
</div><!--//.buy_layer_wrap-->

<script type="text/template" id="getList">

    <div class="buy_product_tab">
        <input checked type="radio" id="now" name="buy_tab" value="now">
        <label for="now">즉시 구매</label>
        <input type="radio" id="reservation" name="buy_tab" value="reservation">
        <label for="reservation">예약 구매</label>
    </div><!--//buy_product_tab-->
    <div class="buy_product_info">
        <div class="buy_product_img">
            <img src="/img/<@=cartList.representImg@>"/>
        </div>
        <h3 class="buy_title"><@=cartList.name@></h3>
        <h4 class="buy_option">(<@=cartList.optionName@>)</h4>
        <span><@=Math.floor(cartList.price-(cartList.price*(cartList.discountRate*0.01)))@>원  ㆍ<@=cartList.count@>개</span>
    </div><!--//.buy_product_info-->
    <form action="/deliveryInfo" method="post">
		<input type="hidden" name="loginMemberNo" value="${loginMember.no}"> 
		<input type="hidden" name="cartNo" value="<@=cartList.cartListNo@>">
        <div class="buy_input_wrap">

        <div class="buy_delivery_address_wrap">

                <ul class="quick_address">
				<@ _.each(lists,function(list,idx){ @>
					
                    <li><@=list.name@></li>
				<@})@>
                </ul>

                <ul class="buy_delivery_address">
                    <li class="delivery_date hidden">
                        <label for="reciveDate">주문 접수일자 정하기</label>
                        <input id="reciveDate" name="reciveDate" placeholder="날짜를 입력해주세요"/>
                        <i class="calendar far fa-calendar-alt"></i>
                    </li>
                    <li>
                        <label for="reciver">받으실분 성함</label>
                            <input id="reciver" name="receiver" placeholder="이름을 입력해주세요" value="<@=basicList.receiver@>"/>
                    </li>
                    <li class="join_form_address_contents">
                            <label class="join_form_label">받으실분 주소</label>
                            <input type="text" id="sample4_postcode" disabled  placeholder="우편번호" value="<@=basicList.postcode@>">
                            <input type="button" id="addressBtn" onclick="sample4_execDaumPostcode()" readonly value="우편번호 찾기"><br>
                            <input type="text" name="address" class="input_width" onclick="sample4_execDaumPostcode()" id="sample4_roadAddress" placeholder="도로명주소" value="<@=basicList.address@>">
                            <p/>
                            <span id="guide" style="color:#999;display:none"></span>
                            <input type="text" name="addressDetail" class="input_width" id="sample4_detailAddress"  placeholder="상세주소" value="<@=basicList.addressDetail@>">
                    </li>
                    <li>
                        <label>배송시 요청사항</label>
                        <input name="request" placeholder="내용을 입력해주세요"/>
                    </li>
                </ul>

        </div><!--//.buy_delivery_address_wrap-->
            <div class="btn_wrap">
                <button id="submit">저장하기</button>
                <button type="button" id="cancel">취소하기</button>
            </div>
        </div><!--//.buy_input_wrap-->
    </form>



</script>

<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
const getListTmpl = _.template($("#getList").html());


    // kakao API 이용해서 주소찾기 =============================================================================
    function sample4_execDaumPostcode() {

        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;



                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                $("#sample4_detailAddress").attr('disabled', false);
            }
        }).open()
    }


   

    //탭 클릭시 예약구매면 날짜보여주기
    $("html").on("click",".buy_product_tab input",function (){
        $(".delivery_date").removeClass("hidden");
        if($(this).val()=='now'){
            $(".delivery_date").addClass("hidden");
        };
    })

    //주소록 클릭시 css 변경
    $(".quick_address").children("li").on("click",function (){
        $(this).siblings().removeClass("active");
        $(this).addClass("active");
    })

	



</script>
</body>
</html>