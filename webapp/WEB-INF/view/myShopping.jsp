<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
 uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선몰 : My쇼핑</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/notosanskr.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/datepicker.min.css">
    <!-- popup css -->
    <link rel="stylesheet" href="/css/myShoppingPop.css"/>

    <style>
        /*My쇼핑 전체 크기*/
        #myShoppingBox {
            /*background-color: #00bb00;*/
            width: 900px;
            min-height: 250px;

            position: relative;
            top: 50px;
            left: 50%;
            margin-left: -450px;
        }

        /*date필터, 배송상태 box*/
        #myShoppingDateFilter {
            /*background-color: red;*/
            width: 800px;

            position: relative;
            left: 50%;
            margin-left: -400px;
            margin-bottom: 20px;
        }

        /*date 필터*/
        #dateFilter li{
            display: inline-block;
            margin: 20px 0;
            border: 1px solid #e0e0e0;
            width: 80px;
            height: 30px;
            text-align: center;
            line-height: 30px;

            cursor: pointer;
        }
        #dateFilter li.active{
            background-color: #43A047;
            color: #fff;
        }
        #datePickerForm {
            position: absolute;
            left: 520px;
            top: 18px;
        }
        .datepicker_form {
            width: 80px;
            height: 30px;
        }
        /*배송상태 select*/
        #myShoppingDateFilter select {
            height: 30px;

            position: absolute;
            left: 715px;
            top: 21px;
        }

        /*900px 전체 주문리스트*/
        #myShoppingBoxFormBox {
            /*background-color: red;*/
            width: 900px;
            height: auto;

            position: relative;
            left: 50%;
            margin-left: -450px;
            /*margin-top: 10px;*/
        }

        /*전체 날짜 별 주문리스트 폼 박스*/
        .my_shopping_list_by_date {
            /*background-color: #27AE60;*/

            width: 798px;
            min-height: 140px;

            border: 1px solid #424242;

            position: relative;
            left: 50%;
            margin-left: -400px;
            margin-bottom: 50px;
        }
        /*YYYY.MM.DD 주문*/
        .order_goods_by_date {
            background-color: #fff;
            width: 150px;
            height: 35px;

            border: 2px solid #424242;
            border-radius: 20px;

            text-align: center;
            line-height: 35px;

            position: relative;
            left: 20px;
            top: -20px;
        }

        /*날짜 별 주문리스트*/
        .my_shopping_list {
            /*background-color: blue;*/
            width: 750px;

            position: relative;
            left: 50%;
            margin-left: -375px;
        }
        /*날짜 별 주문리스트 (ul요소)*/
        .my_shopping_list ul {
            margin: 10px 0 30px 0;
        }
        /*장바구니 하나씩 (li요소)*/
        #my_shopping_list li {

        }
        /*상품 detail_information box*/
        .my_shopping_goods {
            /*background-color: lawngreen;*/
            width: 630px;
            height: 139px;
            border-bottom: 1px solid #424242;
            
            position: relative;
            left: 0;
            top: 0;

            cursor: pointer;
        }
        .my_shopping_goods:hover {
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        /*도착 날짜 정보*/
        .courier_arrives_by_date {
            position: absolute;
            left: 0;
            top: 5px;
        }
        /*이미지*/
        .my_shopping_goods img {
            position: absolute;
            left: 0;
            top: 30px;
        }
        /*상품 제목*/
        .goods_contents {
            /*background-color: #4b96e6;*/

            width: 450px;

            position: absolute;
            left: 110px;
            top: 30px;
        }
        /*가격*/
        .goods_price {
            position: absolute;
            left: 110px;
            top: 80px;
        }
        /*운송장정보*/
        .goods_waybill {
            position: absolute;
            left: 110px;
            top: 110px;

            font-size: 12px;
            color: #424242;
        }

        /*리뷰쓰기, 리뷰수정 상태*/
        .writeable_review_state {
            /*background-color: greenyellow;*/
            width: 120px;
            height: 139px;

            position: relative;
            left: 630px;
            top: 0;
            margin-top: -140px;

            border-bottom: 1px solid #424242;
        }
        /*왼쪽 선*/
        .line_of_writeable_review_state {
            height: 100px;

            border-left: 1px solid #424242;

            position: absolute;
            left: 0;
            top: 20px;
        }
        /*원*/
        .review_state_circle {
            background-color: #C5F8DA;
            width: 80px;
            height: 80px;

            border-radius: 50%;

            position: absolute;
            left: 20px;
            top: 20px;

            cursor: pointer;
        }
        .review_state_circle:hover {
            background-color: #27AE60;
            color: #27AE60;
        }
        /*연필*/
        .writeable_review_state i {
            color: #000;
            font-size: 50px;

            position: absolute;
            left: 15px;
            top: 15px;
        }
        .writeable_review {
            width: 80px;
            font-weight: 700;

            text-align: center;

            position: absolute;
            left: 0;
            top: 85px;
        }




        /* 기현 : 팝업 처리 css는 양이 많아서 외부css로 임포트 시켰습니다~ */


    </style>
</head>
<body>

<!--
(width 900px - 합쳐지는 부분)
02.27 11:38 김기현
-->
<!-- #myShoppingBox (width : 900px) -->
<div id="myShoppingBox">

    <div id="myShoppingDateFilter">
        <div id="dateFilter">
            <ul>
                <li class="active">오늘</li>
                <li>1개월</li>
                <li>3개월</li>
                <li>6개월</li>
                <li>1년</li>
                <li>3년</li>
            </ul>
        </div>
        <div id="datePickerForm">
            <input type="text" id="datepickerStart" class="datepicker_form">
            <span>~</span>
            <input type="text" id="datepickerEnd" class="datepicker_form">
        </div>
        <select>
            <option>전체상태</option>
            <option>결제완료</option>
            <option>배송중</option>
            <option>배송완료</option>
        </select>
    </div>

    <!-- ajax로 MyShopping 리스트가 보여지는 부분 -->
    <!-- #myShoppingBoxFormBox (width : 900px) -->
    <div id="myShoppingBoxFormBox">

    </div><!-- //#myShoppingBoxFormBox -->

    <!-- pagenate -->

</div><!-- //#myShoppingBox end -->




<!--
03.01 12:51 김기현
 -->
<!-- 주문 상세를 팝업으로 보여준다. -->
<!-- .modal-wrapper -->
<div class="modal-wrapper">
    <div class="modal">
        <!-- 날짜 별 리스트 전체를 묶는 div (width : 800px) -->
        <!-- .my_shopping_detail_by_date -->
        <div class="my_shopping_detail_by_date_pop">

            <div class="order_goods_detail_by_date">2020.02.22 주문</div>
            <!-- pop닫기 버튼 -->
            <span class="toggle_pop"><i class="fas fa-times"></i></span>
            <!-- 해당 날짜 주문상세 (width : 750px) -->
            <!-- .my_shopping_detail -->
            <div class="my_shopping_detail">

                <!-- .shopping_goods -->
                <div class="shopping_goods">
                    <p class="payment_information">결제정보</p>
                    <img src="img/gift.png" width="100" height="100px">
                    <label class="product_price_label">상품가격</label>
                    <p class="product_price">18,820 원</p>
                    <label class="shipping_cost_label">배송비</label>
                    <p class="shipping_cost">무료</p>
                    <label class="total_payment_amount_label">총 결제금액</label>
                    <p class="total_payment_amount">37,620 원</p>
                </div><!-- //.shopping_goods -->

                <!-- .writeable_review_state -->
                <div class="delivery_type">
                    <div class="line_of_delivery_type"></div>
                    <div class="delivery_type_circle">
                        <i class="fas fa-coins"></i>
                        <p class="delivery_type_text">
                            결제완료
                        </p>
                    </div>
                </div><!-- //.writeable_review_state -->

                <div class="receiver_information">
                    <p class="receiver_name">채영</p>
                    <p class="receiver_address">서울특별시 중랑구 면목동 1534 아진빌라 205호</p>
                    <p class="receiver_phone">010-1234-5678</p>
                    <p class="receiver_request">배송요청 : 문 앞에 놔주세요!</p>
                </div>

            </div><!-- //.my_shopping_detail -->

        </div><!-- //.my_shopping_detail_by_date_pop -->
    </div><!--  //#modal -->
</div><!--//.modal-wrapper-->






<!--
03.01 21:58 김기현
 -->
<script type="text/template" id="myShoppingListTmpl">


    <@ _.each(payment,function(goods){@>
	<@ console.log(payment); @>
    <!-- 날짜 별 리스트 전체를 묶는 div (width : 800px) -->
    <!-- .my_shopping_list_by_date -->
    <div class="my_shopping_list_by_date">
	
    <div class="order_goods_by_date"><@=goods.date@> 주문</div>
    <!-- 해당 날짜 안에 들어가는 주문리스트 (width : 750px) -->
    <!-- .my_shopping_list -->
    <div class="my_shopping_list">

        <ul>
            <!-- getmyShoppingGoods(); ajax get방식으로 들어오는 부분 -->
            <@_.each(goods.orderProds,function(good){@>

            <li>
                <!-- .my_shopping_goods -->
                <div class="my_shopping_goods toggle_pop">
                    <p class="courier_arrives_by_date">
					<@if(good.rdate!='1970.0.1'){@>
						<@=good.rdate@>
					<@}@>
					</p>
                    <img src="img/<@=good.representImg@>" width="100" height="100px">
                    <p class="goods_contents"><@=good.name@></p>
                    <p class="goods_price"><@=good.price@></p>
                    <p class="goods_waybill"><@=good.waybill@></p>
                </div><!-- //.my_shopping_goods -->

                <!-- .writeable_review_state -->
                <div class="writeable_review_state">
                    <div class="line_of_writeable_review_state"></div>
                    <div class="review_state_circle">
                        <i class="fas fa-pencil-alt"></i>
                        <p class="writeable_review">
                            <@if(good.blind=="N"){@>
                            리뷰 쓰기
                            <@}else {@>
                            리뷰 수정
                            <@}@>
                        </p>
                    </div>
                </div><!-- //.writeable_review_state -->
            </li>
            <@})@>

        </ul>

    </div><!-- //.my_shopping_list -->

    </div><!-- //.my_shopping_list_by_date -->

    <@})@>
</script>


<!--
03.01 23:40 김기현
 -->

<script src="/js/jquery.js"></script>
<script src="/js/datepicker.min.js"></script>
<script src="/js/datepicker.ko.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

    //template 셋팅
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };


    /*
     03.01 21:58 김기현
    */
    const $myShoppingList = $("#myShoppingBoxFormBox");
    const myShoppingListTmpl = _.template($("#myShoppingListTmpl").html());
    
    let page = 1;
    let memberNo = 1;
    
    

    // myShoppingList ajax처리
    function getmyShoppingGoods(){
        $.ajax({
            url:"/ajax/myShopping/"+memberNo+"/"+page, //ajax/myOrderGoods.json
            type:"get",
            data:{
				page:page
				
			},
            error:function(){
                alert("error");
            },
            success:function(json){
            	console.log(json);
            	console.log(json.payment[0].regdate);
            	
            	
            	
            	
            	const jp=json.payment
            	for(idx in json.payment ){
            		let date1 = new Date(json.payment[idx].regdate);
            		console.log("포문입니다 : "+date1.getFullYear()+"."+date1.getMonth()+"."+date1.getDate());
            		json.payment[idx].date=date1.getFullYear()+"."+date1.getMonth()+"."+date1.getDate();
            		
            		for(j in json.payment[idx].orderProds ){
                		let date2 = new Date(json.payment[idx].orderProds[j].receiveDate);
                		json.payment[idx].orderProds[j].rdate=date2.getFullYear()+"."+date2.getMonth()+"."+date2.getDate();
                		
                		//console.log("포문입니다 : "+date1.getFullYear()+"."+date1.getMonth()+"."+date1.getDate());
                		//json.payment[idx].date=date1.getFullYear()+"."+date1.getMonth()+"."+date1.getDate();
                	}
            		
            	}
            	
            	
            	
            	
                //리스트 출력
                $myShoppingList.append(myShoppingListTmpl(json));

                //레이어 팝업 출력
                $( document ).ready(function() {
                    $('.toggle_pop').on('click', function() {
                        $('.modal-wrapper').toggleClass('open');
                        $('.page-wrapper').toggleClass('blur-it');
                        return false;
                    });
                });

                //리뷰쓰기, 리뷰수정 클릭 시
                $(".review_state_circle").on("click", function () {
                    alert("리뷰 수정, 쓰기 폼과 합쳐야 합니다~");
                });

            }
        });
    };//getmyShoppingGoods end
    
    
    $("#myShoppingBoxFormBox").on("click",".paginate a",function(e) {
		e.preventDefault();
		page = this.dataset.no;
		getmyShoppingGoods();
		
	})

    $(document).ready(function(){
        getmyShoppingGoods();
    });

    //datepicker
    $("#datepickerStart, #datepickerEnd").datepicker({
        dateFormat: 'yyyy-mm-dd',
        language: 'ko',
        autoClose: true
    });


    //dateFilter
    let idx = 0;
    $("#dateFilter li").on("click", function () {

        $(".active").removeClass("active");

        //클릭한 그 li요소에 active 클래스를 더한다.
        $(this).addClass("active");

        idx = $(this).index();

        $(".tab").eq(idx).addClass("active");
    });




</script>
</body>
</html>