<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 상품리스트</title>
    <link rel="stylesheet" href="css/all.min.css"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/notosanskr.css"/>
    <style>
        body {
            font-family: "Noto Sans KR",sans-serif;
            font-size: 14px;
        }
        #wrap{
            width: 1100px;
            /*background-color: red;*/
            margin: auto;
        }
        #header{
            height: 100px;
            /*background-color: blue;*/
            position: relative;
            border-bottom: 1px solid #424242;
        }
        /* 사이드 메뉴 */
        #sideMenuWrap{
            width: 150px;
            min-height: 1000px;
            background-color: #196439;

            /*21-02-23 10:44 상언 수정*/
            float: left;
        }
        #sideMenu{
            width: 150px;
            background-color: #196439;
            position: fixed;
        }
        #content{
            background-color: yellow;
        }
        #logo{
            position: absolute;
            left: 25px;
            top: 30px;
        }
        .headerBtn{
            float: right;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 70px;
        }
        .headerBtn a{
            text-decoration: none;
            color: #424242;
        }
        .sideMenuBtn{
            margin: 0 auto 50px auto;
            text-align: center;
            position: relative;
            top: 50px;
        }
        .sideMenuBtn a{
            text-decoration: none;
            color: #fff;
            font-size: 20px;
        }

        /*21-02-23 10:44 상언 수정*/
        /*itemListWrap. 사이드 메뉴 오른쪽에 보여주는 상품리스트 뷰*/
        #itemListWrap{
            width: 950px;
            float: right;
            height: 100%;
        }
        #itemListWrap h1 {
            font-size: 24px;
            font-weight: bold;
            margin: 30px 50px;
        }
        #itemSearchBox {
            width: 500px;
            margin: 30px auto;
            /*margin: 30px 225px;*/
        }
        #searchBtn{
            width: 30px;
            height: 30px;
            padding: 5px;
            cursor: pointer;
        }
        #itemSearchBox select, #itemSearchBox input {
            padding: 5px;
            margin-right: 12px;
        }
        #itemSearchBox input {
            width: 300px;
        }
        #itemPeriodFilter {
            width: 950px;

            /*21-02-24 05:28 수정*/
            text-align: center;
            /*margin: 30px auto;*/

        }
        #itemPeriodFilter .period {
            width: 60px;
            height: 30px;
            float: left;
            background-color: lightgray;
            text-align: center;
            line-height: 30px;
            border-radius: 8px;

            margin: 5px 15px;

        }
        #itemPeriodFilter li:hover {
            background-color: #27AE60;
            color: #fff ;
            cursor: pointer;
        }

        #itemPeriodFilter input {
            margin-top: 5px;
            padding: 5px;
        }
        #dateBox {
            /*float: left;*/
        }
        #dateBox span {
            margin: 0 10px;
        }




        #itemListTable {
            /*21-02-24 05:24 수정*/
            /*border: 1px solid #424242;*/

            width: 800px;
            text-align: center;
            margin: 30px auto;
            /*margin-right: auto;*/
            /*margin-left: auto;*/
        }
        #itemListTable th{
            padding: 15px 20px;
        }
        #itemListTable td {
            padding: 15px;
        }
        #itemListTable th, #itemListTable tr {
            border: 1px solid #424242;
        }

        /*21-22-24 11:10*/
        /*테이블 링크 이동*/
        #itemListTable tbody tr:hover {
            background-color: #27AE60;
        }
        #itemListTable td:hover {
            cursor: pointer;
        }

        /*테이블 이미지 요소 크기*/
        #itemListTable td img {
            width: 80px;
            height: 60px;
        }


        /* 토글 버튼 */
        .toggle span {
            display: inline-block;
            width: 63px;
            height: 36px;
            border-radius: 36px;
            background-color: #bbb;
            cursor: pointer;
            transition: .2s ease;
        }
        .toggle input[type=checkbox] {
            display: none;
        }
        .toggle input:checked+span {
            background-color: #cca872;
        }
        .toggle span::before {
            content: "";
            display: block;
            width: 28px;
            height: 28px;
            border-radius: 28px;
            background-color: #fff;
            margin: 4px;
            transition: .2s ease;
        }
        .toggle input:checked+span::before {
            transform: translateX(26px);
        }


    </style>
</head>
<body>
<div id="wrap">
<div id="header">
    <h1 id="logo"><a href=""><img src="img/logo.png" width="100" height="40" alt="로고"></a></h1>
    <div class="headerBtn"><a href="">로그아웃</a></div>
    <div class="headerBtn"><a href="">상품 등록</a></div>
    <div class="headerBtn"><a href="">컨텐츠 등록</a></div>
</div><!-- //#header end -->

<div id="sideMenuWrap">
    <div id="sideMenu">
        <div class="sideMenuBtn "><a href="">상품 관리</a></div>
        <div class="sideMenuBtn "><a href="">리뷰 관리</a></div>
        <div class="sideMenuBtn "><a href="">유저 관리</a></div>
        <div class="sideMenuBtn "><a href="">컨텐츠 관리</a></div>
    </div><!-- //#sideMenu end -->
</div><!-- //#sideMenuWrap end -->

<div id="container">
<div id="content">



    <div id="itemListWrap">
    <form id="itemListBox">

        <h1>상품리스트</h1>
            <div id="itemSearchBox">
                <!-- 21-02-27 03:18 수정 -->
<!--                <select name="standardUnit">-->
<!--                    <option>상품번호</option>-->
<!--                    <option>해시태그</option>-->
<!--                </select>-->
                <input id="typeItemName" type="text" class="item_search_box" placeholder="상품명을 입력하세요">
                <button id="searchBtn"><i class="fas fa-search"></i></button>
<!--                <div id="searchBtn"><i class="fas fa-search"></i></div>-->
            </div><!-- //#itemSearchBox end -->

            <div id="itemPeriodFilter">
                <ul>
                    <li class="period">1주일</li>
                    <li class="period">1개월</li>
                    <li class="period">3개월</li>
                    <li class="period">6개월</li>
                    <li class="period">1년</li>

                </ul>

                <div id="dateBox">
                    <input type="date" id="start" value="0000-00-00">
                    <span>~</span>
                    <input type="date" id="end" value="0000-00-00"/>
                </div><!-- //#dateBox end -->
            </div><!-- //#itemPeriodFilter end -->

            <div id="itemListTable">
                <table id="itemList" border="1">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>상품명</th>
                            <th>상품이미지</th>
                            <th>판매가</th>
                            <th>재고 수량</th>
                            <th>구매 건수</th>
                            <th>상태변경</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>

                            <td>1</td>
                            <td>존 바바토스</td>
                            <td>
                                <img src="img/item.JPG">
                            </td>
                            <td>40,000원</td>
                            <td>100</td>
                            <td>50</td>
                            <td>


                                <button class="removeBtn">삭제</button>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>존 바바토스</td>
                            <td>
                                <img src="img/item.JPG">
                            </td>
                            <td>40,000원</td>
                            <td>100</td>
                            <td>50</td>
                            <td>

                                <button class="removeBtn">삭제</button>
                            </td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>존 바바토스</td>
                            <td>
                                <img src="img/item.JPG">
                            </td>
                            <td>40,000원</td>
                            <td>100</td>
                            <td>50</td>
                            <td>

                                <button class="removeBtn">삭제</button>
                            </td>
                        </tr>

                        <tr>
                            <td>4</td>
                            <td>존 바바토스</td>
                            <td>
                                <img src="img/item.JPG">
                            </td>
                            <td>40,000원</td>
                            <td>100</td>
                            <td>50</td>
                            <td>

                                <button class="removeBtn">삭제</button>
                            </td>
                        </tr>

                        <tr>
                            <td>5</td>
                            <td>존 바바토스</td>
                            <td>
                                <img src="img/item.JPG">
                            </td>
                            <td>40,000원</td>
                            <td>100</td>
                            <td>50</td>
                            <td>

                                <button class="removeBtn">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- //#itemListTable end -->



    </form><!-- //#itemListBox end -->

    </div><!-- //#itemListWrap end -->
</div><!-- //#content end -->
</div><!-- //#container end -->

</div><!-- //#wrap end -->
<script src="js/jquery.js"></script>
<script>
    /* 상태변경 토글 */
    // var toggle = false;
    // const toggleBtn = $("#toggleBtn");
    //
    // toggleBtn.addEventListener("click", function () {
    //     // 클릭할 때마다 현재상태 변환
    //     toggle = !toggle;
    //
    //     if (toggle == true) {
    //         selector.classList.add('on');
    //     }else{
    //         selector.classList.remove('on');
    //     }
    //
    // }, false);

    // function toggle(element) {
    //     console.log(element.checked);
    // }


    //테이블 tr 요소 링크 이동(a요소 없이)
    //21-02-24 06:50 김상언 수정
    // $("#itemListTable tr").on("click", function (e) {
    //     console.log("plz");
    //     e.location.href='';
    // })
    //21-02-24 11:08 김상언 수정
    $(document).ready(function () {
        $("#itemListTable tr").on("click", function () {
            var href = $(this).find("a").attr("href");
            if(href) {
                // window.location = ' ';
                location.href = '';

            }
            // console.log("test");
            alert("test");
        })
    })


    //테이블 행 삭제하기
    //21-02-24  11:03
    // $(".removeBtn").on("click", function () {
    //
    //     // $("#itemListTable tbody tr").eq(0).remove();
    //
    // })

    // $(document).ready(function(){
    //     $(".removeBtn").on("click",function () {
    //         function rowDelete(obj){
    //             $(obj).parent().parent().remove();
    //         }
    //     })
    //
    //
    // });

    $(".removeBtn").click(function () {
        // alert("test");
        $(this).parent().parent().remove();
    })

    //21-02-27 02:36
    //ajax로 상품 리스트 받을 부분(작업중)
    $("#searchBtn").click(function () {

        $.ajax({
            //연결 시킬 서블릿
            url:"data/itemList.json",
            //넘겨주는 방식
            type: "GET",
            //서블릿으로 넘겨줄 데이터
            dataType : "json",
            data: {

            },
            error:function(xhr,error){
                alert(error);
            },
            success:function (json) {

                //tr전부 비우기
                $("tbody").empty();

                $(json).each(function () {

                    //tr요소
                    const $tr = $("<tr>");

                    //td요소
                    const $td1 = $("<td>").text(this.no);
                    const $td2 = $("<td>").text(this.name);
                    const $td3 = $("<td>").text(this.img);
                    const $td4 = $("<td>").text(this.sellPrice);
                    const $td5 = $("<td>").text(this.stock);
                    const $td6 = $("<td>").text(this.purchaseNum);


                    //tr에 td들을 붙이고 tbody에 붙음
                    $tr.append($td1,$td2, $td3, $td4, $td5, $td6)
                        .appendTo("tbody");

                });//each() end



            }//success end
        });//$.ajax() end

    });//#searchBtn click() end


</script>
</body>
</html>