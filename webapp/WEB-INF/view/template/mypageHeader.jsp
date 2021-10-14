<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/datepicker.min.css">
<style>

    #contents{
        width: 1100px;
        margin: auto;
    }

    #navi{
        float: left;
        width: 200px;
        height: 100%;
    }
    #navi dt:nth-child(1){
        position: relative;
        background-color:  #C5F8DA;
        width: 200px;
        height: 200px;
        text-align: center;
        padding: 0;
    }

    #navi dt, #navi dd{
        width: 175px;
        padding-left: 25px;
        height: 40px;
        line-height: 30px;
    }

    #navi dt a, #navi dd a{
        text-decoration: none;
    }

    #navi dt{
        border-top: 1px solid #000;
        font-size: 20px;
        font-weight: 700;
    }

    #contents img{
        border-radius: 80px;
        display: inline-block;
        text-indent: -9999px;
        overflow: hidden;
    }

    #dashBoard{
        position: relative;
        top: 0;
        width: 900px;
    }
    #dashBoard li{
        border: 1px solid #000;
        /*background-color: #00bcd4;*/
        height: 200px;
        width: 298px;
        float: left;
        text-align: center;
    }
    #dashBoard li>div, #navi div{
        height: 50px;
        padding: 0;
    }
    #dashBoard li>div{
        position: relative;
    }

    .middle{
        top: 30px;
    }
    .now{
        padding-top:10px;
    }
    #asdf{
        width: 900px;
        height: 700px;
        background-color: #e4ac4a;
        float: right;
    }
    #dashBoardBox{
        float: left;
    }
    #content2{
        width: 900px;
        margin: auto;
    }

    #date li{
        margin: 20px 0;
        border: 1px solid #e0e0e0;
        width: 100px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        float: left;
        cursor: pointer;
    }
    #date li.active{
        background-color: #43A047;
        color: #fff;
    }
    #myReviewBox{
        clear: both;
        width: 900px;
        height: 200px;
    }
    #myReviewBox>h2{
        font-size: 25px;
        font-weight: 700;
        margin: 20px 0;
    }
    #thumbnailBox{
        padding: 10px 0;
        width: 900px;
        height: 50px;
        /*line-height: 50px;*/
        border-top: 1px solid #000;
        border-bottom: 1px solid #e0e0e0;
        /*vertical-align: middle;*/
        position:relative;
    }
    #thumbnailBox span{
        display: inline-block;
        height: 50px;
        line-height: 50px;
        position: absolute;
        margin-left: 10px;
    }
    #reviewBox{
        width: 900px;
        height: 150px;
        position: relative;
        border-bottom: 1px solid #000;
    }

    #review{
        height: 100px;
        width: 700px;
    }
    #btnBox{
        position: absolute;
        top: 0;
        right: 0;
        width: 200px;
        height: 150px;
    }
    .uploadImg{
        position: absolute;
        top: 25px;
        left: 0;
    }
    .update{
        position: absolute;
        right: 20px;
        top: 40px;
    }
    .delete{
        position: absolute;
        right: 20px;
        bottom: 40px;
    }
    .btn{
        width: 70px;
        height: 30px;
        background-color: #fff;
        border: 1px solid #424242;
        border-radius: 10px;
    }
    .star_box{
        margin: 10px 0;
        height: 16px;
        background-image: url("img/ico_newsview_200522.png");
    }
    .grad_star{
        width: 88px;
        background-position: 0 -220px;
    }
    .inner_star{
        width: 0;
        background-position: 0 -240px;
    }



</style>
<body>
<div id="contents">
    <div>
        <dl id="navi">
            <dt><div class="middle"><img src="img/jihyo.png" width="80px" height="80px" alt="프로필"/><div>박지효 님</div></div></dt>
            <dt><a href="">MY 쇼핑</a></dt>
            <dt><a href="">MY 쿠폰</a></dt>
            <dt><a href="">찜 리스트</a></dt>
            <dt><a href="">장바구니</a></dt>
            <dt>상품리뷰</dt>
                <dd><a href="">작성 가능한 리뷰</a></dd>
                <dd><a href="">내가 작성한 리뷰</a></dd>
            <dt>MY 정보</dt>
                <dd><a href="">개인정보수정</a></dd>
                <dd><a href="">배송지 관리</a></dd>
        </dl>
    </div>
    <div id="dashBoardBox">
        <ul id="dashBoard">
            <li><div class="middle"><img src="img/deliver.jpg" width="80px" height="80px" alt="배송중"/><div class="now">배송중 1개</div></div></li>
            <li><div class="middle"><img src="img/coupon.jpg" width="80px" height="80px" alt="쿠폰"/><div class="now">할인 쿠폰 3개</div></div></li>
            <li><div class="middle"><img src="img/cash.png" width="80px" height="80px" alt="캐시"/><div class="now">보유 캐시 123,567원<p><button>충전하기</button></p></div></div></li>
        </ul>
    </div>
</div>

</body>
</html>