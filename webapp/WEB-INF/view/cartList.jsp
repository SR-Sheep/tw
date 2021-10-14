<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선몰 : 장바구니</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/notosanskr.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/delivery.css"/>
    <link rel="stylesheet" href="/css/datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
      	#wrap{
      		widows: 1100px;
      		margin: auto;
      	}
        /*장바구니 전체 크기*/
        #cartListBox {
            /*background-color: #00bb00;*/
            width: 900px;
            min-height: 250px;

            position: relative;
            top: 50px;
            left: 50%;
            margin-left: -450px;
        }
        /*선택삭제, 전체삭제 버튼 박스*/
        .remove_btn_box {
            /*background-color: red;*/

            width: 184px;
            height: 30px;
            position: relative;
            margin-left: 615px;
        }
        /*공통 삭제 버튼 클래스*/
        .remove_btn {
            width: 90px;
            height: 28px;
        }
        /*장바구니의 폼 박스*/
        #cartListFormBox {
            /*background-color: #27AE60;*/

            width: 700px;
            min-height: 120px;

            position: relative;
            left: 50%;
            margin-left: -350px;
            margin-top: 15px;
        }
        /*장바구니 전체 (ul요소)*/
        #cartListFormBox ul {
            margin: 10px 0;
        }
        /*장바구니 하나씩 (li요소)*/
        #cartListFormBox li {
            position: relative;
            border-top: 1px solid #424242;
            height: 120px;

        }
        #cartListFormBox li:last-child {
            border-bottom: 1px solid #424242;
        }

        /*input checkbox*/
        #cartListFormBox input {
            position: absolute;
            left: 10px;
            top: 50px;
        }
        /*이미지, 상품 제목*/
        .cart_content {
            /*background-color: lawngreen;*/
            width: 420px;

            position: absolute;
            left: 40px;
            top: 10px;
        }
        /*이미지*/
        .cart_content img {
            vertical-align: middle;
        }
        /*상품 제목*/
        .goods_contents {
            display: inline-block;
            vertical-align: middle;
            /*background-color: #4b96e6;*/
            width: 250px;

            margin-left: 10px;
        }

        /*가격, 삭제/장바구니 버튼의 박스*/
        .price_and_btn_box {
            /*background-color: red;*/

            width: 200px;
            height: 100px;

            position: relative;
            left: 420px;
            top: 10px;
            display: inline-block;
        }
        /*가격*/
        .goods_price {
            position: absolute;
            left: 0;
            top: 42px;
        }
        .shipping_cost {
            position: absolute;
            width: 70px;

            left: 100px;
            top: 42px;

            text-align: center;
        }

        /*삭제,선물정보입력 버튼*/
        .cart_form_btn_box {
            /*background-color: lightblue;*/

            width: 100px;

            position: absolute;
            left: 180px;
            top: 12px;
        }
        .cart_form_btn_box button {
            width: 90px;
            height: 28px;
            margin: 5px auto;
        }

        /*총 주문금액이 나오는 부분*/
        #totalPriceInformationBox {
            width: 800px;
            height: 50px;

            border: 5px solid #C5F8DA;

            margin: 20px auto;
            display:none;
        }
        /* 총 상품가격, 배송비, 주문금액 부분*/
        #totalPriceInformationBox label{
            display: inline;
            position: relative;
            /*left: 100px;*/

            font-size: 18px;
            top: 15px;
            margin-left: 28px;
        }
        /* 가격 부분 */
        #totalPriceInformationBox p {
            display: inline;
            position: relative;

            font-size: 15px;
            top: 15px;
            margin-left: 28px;
        }
        /* + , = */
        #totalPriceInformationBox span {
            display: inline;
            position: relative;

            top: 15px;
            margin-left: 28px;
        }

        /*결제하기 버튼*/
        .purchase_btn {
            display: inline-block;
            width: 300px;
            height: 38px;
            background-color: #27AE60;

            border: 1px solid #424242;

            text-align: center;
            line-height: 40px;
            text-decoration: none;
            color: #000;

            position: relative;
            left: 50%;
            margin-left: -151px;
        }
        .purchase_btn:hover {
            background-color: #C5F8DA;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        /*상품, 금액, 배송비 정보*/
        #goodsInformation {
            width: 700px;

            margin: 10px auto;

        }
        /*상품 정보*/
        #goodsInformation td:nth-child(1) {
            position: relative;
            left: 190px;
        }
        /*상품 금액*/
        #goodsInformation td:nth-child(2) {
            position: relative;
            left: 170px;
        }
        /*배송비*/
        #goodsInformation td:nth-child(3) {
            position: relative;
            left: 18px;
        }

    </style>
</head>
<body>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/datepicker.min.js"></script>
<script src="/js/datepicker.ko.js"></script>
<div id="wrap">
<c:import url="/WEB-INF/view/template/basketAddress.jsp"></c:import>
<!-- #cartListBox -->
<div id="cartListBox">
	
    <!-- #goodsInformation -->
    <table id="goodsInformation">
        <tr>
            <td>상품 정보</td>
            <td>상품 금액</td>
            <td>배송비</td>
        </tr>
    </table> <!-- //#goodsInformation -->

    <!-- ajax로 List가 보여지는 부분 -->
    <!-- #cartListFormBox -->
    <div id="cartListFormBox">
	
        <ul>
			<c:forEach items="${cartLists}" var="cartList" varStatus="status">
            <li>
                <input data-prodNum="${cartList.no}" data-count="${cartList.count}" data-cartNo="${cartList.cartListNo}" data-optionNo="${cartList.optionNo}" class="check_box" name="check" type="checkbox" />

                <!-- .cart_content -->
                <div class="cart_content">
                    <img src="/img/${cartList.representImg}" width="100" height="100">
                    <p class="goods_contents">${cartList.name}(${cartList.optionName})</p>
                </div><!-- //.cart_content -->

                <!-- .cart_form_btn_box -->
                <!--
                goods_contents 두 줄일 경우 vertical-align: middle;
                주기 위해 goodsPrice를 이쪽 div로 넣음
                -->
                <div class="price_and_btn_box">
                    <p class="goods_price"><fmt:formatNumber value="${(cartList.price-(cartList.price*(cartList.discountRate*0.01)))*cartList.count}"  pattern="##.##"/>원</p>
                    <p class="shipping_cost"><c:choose><c:when test="${cartList.deliveryPrice != 0}">무료</c:when><c:when test="${(cartList.price-(cartList.price*(cartList.discountRate*0.01)))*cartList.count > cartList.deliveryOption}">무료</c:when><c:otherwise>${cartList.deliveryPrice}원</c:otherwise></c:choose></p>
                    <div class="cart_form_btn_box">
                        <button class="remove_one_btn">삭 제</button>
                        <!-- 선물정보 입력 클릭 시 popup이 뜨게  -->
                        <button class="enter_gift_information_btn" data-no="${cartList.cartListNo}">선물정보입력</button>
                    </div>
                </div><!-- //.cart_form_btn_box -->
            </li>
			</c:forEach>

            
        </ul>

    </div><!-- //#cartListFormBox -->


    <!-- 제거 버튼 박스 -->
    <!-- .removeBtnBox -->
    <div class="remove_btn_box">
        <button class="remove_selection_btn remove_btn">선택 삭제</button>
        <button class="remove_all_btn remove_btn">전체 삭제</button>
    </div><!-- //.removeBtnBox -->

    <!-- 총 상품가격 정보가 나오는 부분 -->
    <div id="totalPriceInformationBox">
        <label for="totalGoodsPrice">총 상품가격</label>
        <p id="totalGoodsPrice"></p>
        <span><i class="fas fa-plus"></i></span>
        <label for="totalShippingfee">총 배송비</label>
        <p id="totalShippingfee">무료</p>
        <span><i class="fas fa-equals"></i></span>
        <label for="totalOrderAmount">총 주문금액</label>
        <p id="totalOrderAmount"></p>
    </div>

    <!-- 결제하기 버튼 -->
    <button  class="purchase_btn" disabled>구매하기</button>

</div><!-- //#cartListBox end -->
</div><!-- //wrap end -->



<script>


	let cartNo=[];
	let optionNo=[];
	let count=[];
	let prodNum=[];
	//loginMember.no << 값이들어가야함
    const no = ${loginMember.no};
    /*
    02.25 13:20 김기현
    */

    // 삭제 버튼 클릭 시
    $(".remove_one_btn").on("click", function () {
        alert("삭제되었습니다.");
    });
    // 전체 삭제 버튼 클릭 시
    $(".remove_all_btn").on("click", function () {
        alert("전체 상품이 삭제되었습니다.");
    });
    // 선택 삭제 버튼 클릭 시
    $(".remove_selection_btn").on("click", function () {
        if ($(".check_box").is(":checked")==true) {
            alert("선택 상품이 삭제되었습니다.");
        }else {
            alert("상품을 선택해주세요.");
        };
    });

    $(".enter_gift_information_btn").on("click", function () {
        $(".buy_layer_wrap").css("display","block");
        $(".buy_wrap").css("display","block");
        
        const cartListNo = $(this).attr("data-no");
        $.ajax({
            url:"/ajax/deliveryList",
            dataType:"json",
            data:{
            	"no":no,
            	"cartListNo":cartListNo
            },
            type:"GET",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                $(".buy_wrap").html(getListTmpl(json));
            }
        })//ajax() end
        
        
    });
    $("html").on("click",".quick_address li", function () {
        
        
      
        const name = $(this).text();
        $.ajax({
            url:"/ajax/deliveryList/filter",
            dataType:"json",
            data:{
            	"no":no,
            	"name":name
            },
            type:"GET",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
      			$("#reciver").val(json.list.receiver);
      			$("#sample4_postcode").val(json.list.postcode);
      			$("#sample4_roadAddress").val(json.list.address);
      			$("#sample4_detailAddress").val(json.list.addressDetail);
            }
        })//ajax() end
        
    });
    
    $("html").on("click","#cancel", function () {
        $(".buy_layer_wrap").css("display","none");
        $(".buy_wrap").css("display","none");
        
    });
    
    
    $('#reciveDate').datepicker({
    	language: 'ko',
    	autoClose: true,
        dateFormat:'yyyy-mm-dd'
        
    });

    //캘린더를 클릿했을 떄 데이트 피커 호출
    $("html").on("click",".calendar",function (){
    	$("#reciveDate").datepicker('show');
    	
    });
    
    let idx=0;
    const length = $("#cartListFormBox li").length;
    
    $(".check_box").on("click",function(){
    	const priceS = $(this).next().next().find(".goods_price").text();
        const prePriceS = $("#totalGoodsPrice").text();
        let sumPrice = null;
        const deliveryPriceS = $(this).next().next().find(".shipping_cost").text();
        const predeliveryPriceS =$("#totalShippingfee").text();
        $("#totalPriceInformationBox").css("display","block");
        $(".purchase_btn").attr("disabled",false);
    	
        if($("input:checkbox[name='check']").is(":checked") == true) {
         let price =priceS.substring(0,priceS.length-1);
         price=Number(price);
         let prePrice=prePriceS.substring(0,prePriceS.length-1);
         prePrice=Number(prePrice);
         sumPrice=price+prePrice;
         $("#totalGoodsPrice").text(sumPrice+"원");
         
         cartNo[idx]=$(this).attr("data-cartNo");
         optionNo[idx]=$(this).attr("data-optionNo");
         count[idx]=$(this).attr("data-count");
         prodNum[idx]=$(this).attr("data-prodNum");
         
         if(predeliveryPriceS =='무료' && deliveryPriceS=='무료'){
        	 
        	 $("#totalShippingfee").text("무료");
        	 $("#totalOrderAmount").text(sumPrice+"원");
         }//if end
        
          
        }else{
        	$("#totalPriceInformationBox").css("display","none");
        	$("#totalGoodsPrice").text("");
        	$("#totalShippingfee").text("무료");
       	 	$("#totalOrderAmount").text("");
       		$(".purchase_btn").attr("disabled",true);
       		 
       		 
        }
    	idx++;
    });
    
    if(idx==length){
    	idx=0;
    }
    
    $(".purchase_btn").on("click",function(){
    	let sumPrice =$("#totalOrderAmount").text();
    	sumPrice = sumPrice.substring(0,sumPrice.length-1);
    	$.ajaxSettings.traditional = true;
        $.ajax({
           url:"/ajax/order",
           dataType:"json",
           type:"post",
           data:{
           	"cartNo":cartNo,
           	"optionNo":optionNo,
           	"sumPrice":sumPrice,
           	"no":no,
           	"count":count,
           	"prodNum":prodNum
           },
           error:function () {
               alert("서버 점검중!");
           },
           success:function (json) {
           	if(json.result){
           		location.href="/member/"+no+"/cartList";
           	}
        	  
           	
           }//success end
       });//$.ajax() end 
    	
    });

	


    

</script>

</body>
</html>