<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선몰 : 찜 리스트</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <link rel="stylesheet" href="css/default.css"/>
    <style>
        /*찜리스트 전체 크기*/
        #wishListBox {
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
            margin-left: 620px;
        }
        /*공통 삭제 버튼 클래스*/
        .remove_btn {
            width: 90px;
            height: 28px;
        }
        /*찜 리스트의 폼 박스*/
        #wishListFormBox {
            /*background-color: #27AE60;*/

            width: 700px;
            min-height: 120px;

            position: relative;
            left: 50%;
            margin-left: -350px;
        }
        /*찜 리스트 전체 (ul요소)*/
        #wishListFormBox ul {
            margin: 10px 0;
        }
        /*찜 리스트 하나씩 (li요소)*/
        #wishListFormBox li {
            position: relative;
            border-top: 1px solid #424242;
            height: 120px;

        }
        #wishListFormBox li:last-child {
            border-bottom: 1px solid #424242;
        }

        /*input checkbox*/
        #wishListFormBox input {
            position: absolute;
            left: 30px;
            top: 50px;
        }
        /*이미지, 상품 제목*/
        .wish_content {
            /*background-color: lawngreen;*/
            width: 420px;

            position: absolute;
            left: 80px;
            top: 10px;
        }
        /*이미지*/
        .wish_content img {
            vertical-align: middle;
        }
        /*상품 제목*/
        .goods_contents {
            display: inline-block;
            vertical-align: middle;
            /*background-color: #4b96e6;*/
            width: 285px;

            margin-left: 10px;
            color: #000;
        }
        /**/
        .wish_content:hover {
            font-weight: 600;
        }

        /*가격, 삭제/장바구니 버튼*/
        .price_and_btn_box {
            /*background-color: red;*/

            width: 200px;
            height: 100px;

            position: relative;
            left: 500px;
            top: 10px;
            display: inline-block;
        }
        /*가격*/
        .goods_price {
            position: absolute;
            left: 0;
            top: 42px;
        }
        /*삭제, 장바구니로 버튼 박스*/
        .wish_form_btn_box {
            /*background-color: lightblue;*/

            width: 100px;

            position: absolute;
            left: 100px;
            top: 12px;

        }
        /*삭제, 장바구니로 버튼*/
        .wish_form_btn_box button {
            width: 90px;
            height: 28px;
            margin: 5px auto;
        }


    </style>
</head>
<body>
<!--
(width 900px - 찜리스트 합쳐지는 부분)
02.23 18:04 김기현
-->
<!-- #wishListBox -->
<div id="wishListBox">


    <!-- 제거 버튼 박스 -->
    <!-- .remove_btn_box -->
    <div class="remove_btn_box">
        <button class="remove_selection_btn remove_btn">선택 삭제</button>
        <button class="remove_all_btn remove_btn">전체 삭제</button>
    </div><!-- //.remove_btn_box -->


    <!-- ajax로 List가 보여지는 부분 -->
    <!-- #wishListFormBox -->
    <div id="wishListFormBox">

        <ul>
            <li>
                <input class="check_box" type="checkbox" />

                <!-- .wish_content -->
                <div class="wish_content">
                    <a href="/">
                    <img src="img/ferrero.png" width="100">
                    <p class="goods_contents">페레로 로쉐 초콜릿 8개입 선물 페레로 로쉐 초콜릿 8개입 선물</p> </a>
                </div><!-- //.wish_content -->

                <!-- .price_and_btn_box -->
                <!--
                goodsContents 두 줄일 경우 vertical-align: middle;
                주기 위해 goodsPrice를 이쪽 div로 넣음
                -->
                <div class="price_and_btn_box">
                    <p class="goods_price">1,114,530원</p>
                    <div class="wish_form_btn_box">
                    <button class="remove_one_btn">삭 제</button>
                    <button class="transfer_cartlist_btn">장바구니로</button>
                    </div>
                </div><!-- //.price_and_btn_box -->
            </li>

            <li>
                <input class="check_box" type="checkbox" />

                <!-- .wish_content -->
                <div class="wish_content">
                    <a href="/">
                        <img src="img/gift.png" width="100">
                        <p class="goods_contents">페레로 로쉐 초콜릿 8개입 선물 페레로 로쉐 초콜릿 8개입 선물</p> </a>
                </div><!-- //.wish_content -->

                <!-- .price_and_btn_box -->
                <!--
                goodsContents 두 줄일 경우 vertical-align: middle;
                주기 위해 goodsPrice를 이쪽 div로 넣음
                -->
                <div class="price_and_btn_box">
                    <p class="goods_price">114,530원</p>
                    <div class="wish_form_btn_box">
                        <button class="remove_one_btn">삭 제</button>
                        <button class="transfer_cartlist_btn">장바구니로</button>
                    </div>
                </div><!-- //.price_and_btn_box -->
            </li>

            <li>
                <input class="check_box" type="checkbox" />

                <!-- .wish_content -->
                <div class="wish_content">
                    <a href="/">
                        <img src="img/gift.png" width="100">
                        <p class="goods_contents">페레로 로쉐 초콜릿 8개입 선물</p> </a>
                </div><!-- //.wish_content -->

                <!-- .price_and_btn_box -->
                <!--
                goodsContents 두 줄일 경우 vertical-align: middle;
                주기 위해 goodsPrice를 이쪽 div로 넣음
                -->
                <div class="price_and_btn_box">
                    <p class="goods_price">14,530원</p>
                    <div class="wish_form_btn_box">
                        <button class="remove_one_btn">삭 제</button>
                        <button class="transfer_cartlist_btn">장바구니로</button>
                    </div>
                </div><!-- //.price_and_btn_box -->
            </li>
        </ul>
    </div><!-- //#wishListFormBox -->


    <!-- 제거 버튼 박스 -->
    <!-- .remove_btn_box -->
    <div class="remove_btn_box">
        <button class="remove_selection_btn remove_btn">선택 삭제</button>
        <button class="remove_all_btn remove_btn">전체 삭제</button>
    </div><!-- //.remove_btn_box -->


<!-- ${pagenate } -->


</div><!-- //#wishListBox end -->

<script src="js/jquery.js"></script>
<script>


    /*
    02.25 13:20 김기현
    */

    // 삭제 버튼 클릭 시
    $(".remove_one_btn").on("click", function () {
       alert("삭제되었습니다.");
    });
    // 장바구니로 버튼 클릭 시
    $(".transfer_cartlist_btn").on("click", function () {
       alert("장바구니로 이동되었습니다.") ;
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


</script>
</body>
</html>