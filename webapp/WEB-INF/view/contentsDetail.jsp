<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 컨텐츠 상세 페이지</title>
   
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <style>
        body{
            font-family: "Noto Sans KR", sans-serif;
        }
        #content{
            overflow: hidden;
        }
        #footer{
            clear: both;
            margin-top: 150px;
        }
        /*상품리스트*/
        #itemList{
            /*background-color: grey;*/
            width: 1000px;
            min-height: 1000px;
            /*float: left;*/
            margin: 80px auto 0 auto;
        }
        #searchList{
            text-align: center;
        }
        .item_card_box{
            /*background-color: red;*/
            width: 248px;
            height: 298px;
            display: inline-block;
            margin: 0 0 50px 40px;
            border: 1px solid #eee;
            position: relative;
            text-align: left;
            cursor: pointer;
        }
        .item_card_box:hover{
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .item_card_box:nth-child(3n+1){
            margin-left: 0;
        }
        .item_card_box a{
            text-decoration: none;
            color: #424242;
        }
        .item_img{
            margin: 10px 0 0 45px;
        }
        .item_information{
            margin: 20px 0 0 20px;
        }
        .heart_icon{
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .item_information .sale_percent{
            margin-top: 20px;
        }
        .item_information .item_review_score {
            margin-top: 20px;
        }
        .review_box {
            background-image: url("/img/ico_newsview_200522.png");
            height:16px;
            display: inline-block;
        }
        .grade_star {
            width:88px;
            background-position: 0 -220px;
        }
        .inner_star {
            width:0px;
            background-position: 0 -240px;
        }
        .review_count{
            position: relative;
            top: -2px;
        }
        .sale_percent strong{
            color: red;
            font-size: 13px;
        }
        /* //상품리스트end */
        #contentsImg{
            width: 600px;
            height: 300px;
            /*position: relative;*/
            border: 1px solid #eee;
            margin: 50px auto 0 auto;
        }
        #contentsTitle{
            font-size: 20px;
            width: 600px;
            margin: 40px auto 0 auto;
        }
        #contentsText{
            width: 600px;
            margin: 20px auto 0 auto;
            line-height: 20px;
        }
        #contentsItemCount{
            position: relative;
            left: 750px;
            top: 10px;
        }
        .contents_title_hr{
            width: 600px;
        }
        /*평점 관련*/
        .review_box {
            background-image: url("/img/ico_newsview_200522.png");
            height:16px;
            display: inline-block;
        }
        .grade_star {
            width:88px;
            background-position: 0 -220px;
        }
        .inner_star {
            width:0px;
            background-position: 0 -240px;
        }
        .review_count{
            position: relative;
            top: -2px;
        }
        /*세일숫자*/
        .sale_percent strong{
            color: red;
            font-size: 13px;
        }
        /*찜 하트*/
        .full_heart{
            display: none;
        }
        /*카테고리*/
        #categoryBox{
            height: 50px;
            margin: 50px auto 0 auto;
        }
        #categoryList{
            width: 900px;
            height: 50px;
            align-items: center;
            margin: 0 auto;
        }
        #categoryList li{
            float: left;
            margin: 0 0 0 30px;
            font-size: 20px;
            text-align: center;
        }
        #categoryList a{
            text-decoration: none;
            color: #424242;
            font-style: italic;
        }
        #categoryList a:hover{
            color: #27AE60;
            text-decoration: underline;
        }
        .category_hr{
            width: 900px;
            margin: 0 auto;
        }
        h2{
            font-size: 22px;
            margin: 40px 0 0 150px;
        }
    </style>
</head>
<body>

<div id="wrap"><!--#wrap-->
    <div id="header">
        <div id="headerLogoBox">
            <a href="/"><img id="headerLogo" src="/img/logo.png"></a>
        </div>
        <div id="headerSearchBox">
            <div id="headerItemSearchBox">
                <input id="headerItemSearch" name="itemSearchKeyword" placeholder="찾고 싶은 상품을 검색해 보세요">
                <button id="headerItemSearchBtn"><i class="fas fa-search"></i></button>
            </div>
        </div>
        <div id="headerKeywordBox">
            <div id="headerShowingKeyword">
                <span id="headerCurrentShowingRank">1</span>
                <span id="headerCurrentShowingKeyword">레고꽃다발</span>
                <span id="headerMoreKeywordDownBtn" class="active"><i class="fas fa-chevron-circle-down"></i></span>
                <span id="headerMoreKeywordUpBtn"><i class="fas fa-chevron-circle-up"></i></span>
            </div>
        </div>
        <div id="headerUserName">
            <a href=""><strong>트와이스 사나님</strong></a>
        </div>
        <div id="headerPoint">
            <strong>P</strong>
            <span>1,500p</span>
        </div>
        <div id="headerMyCart">
            <a href=""><i class="fas fa-shopping-cart"></i></a>
        </div>
        <!-- 오세훈 작성 -->
        <div id="signUpBtn">
            <a href=""><i class="fas fa-user-plus"></i>회원가입</a>
        </div>
        <div id="loginBtn">
            <a href=""><i class="fas fa-sign-in-alt"></i>로그인</a>
        </div>
        <!-- //오세훈 작성 -->
        <div id="headerMoreKeywordListBox">
            <ul id="headerMoreKeywordList">
                <li>

                </li>
            </ul>
        </div><!-- //keywordList   -->
    </div><!-- //#header   -->
    <div id="content"><!--#content-->
       <!--  <div id="categoryBox">
            <ul id="categoryList">
                <li><a href="">#생일</a></li>
                <li><a href="">#명품</a></li>
                <li><a href="">#결혼기념일</a></li>
                <li><a href="">#어른선물</a></li>
                <li><a href="">#건강선물</a></li>
                <li><a href="">#출산</a></li>
                <li><a href="">#졸업선물</a></li>
                <li><a href="">#생활용품</a></li>
            </ul>
        </div> -->
        <!-- <hr class="category_hr"> -->
        <h2>컨텐츠 상세페이지</h2>
        <div id="contentsImg"><img src="/img/${content.contentImg}" alt="컨텐츠이미지" width="600" height="300"></div>
        <div id="contentsItemCount">상품 개수 : ${content.countNum}개</div>
        <div id="contentsTitle">${content.title}</div>
        <hr class="contents_title_hr">
        <div id="contentsText">${content.description}</div>
        <div id="itemList">
            <ul id="searchList">

            </ul>
        </div>
    </div><!--//#content-->

    <div id="footer"><!--#footer-->
        <!--푸터 로고-->
        <h1 id="fLogo">
            <img src="/img/logo.png" alt="로고" width="100px" height="50px">
            <span>선몰(주)</span>
        </h1>
        <!--//푸터 로고-->
        <!--푸터 이용약관-->
        <div id="company" class="footerInfo">
            대표이사 : JYP
            주소 : 서울특별시 관악구 남부순환로 에그옐로우 6층
        </div>

        <div id="policy" class="footerInfo">
            사업자등록번호 : 152-56-78912
            통신판매업신고 : 2021-서울관악구-1579
        </div>
        <small class="copyright">Copyright © <a href="" >선:MALL Corp.</a> All rights reserved.</small>
        <!--//푸터 이용약관-->
    </div><!--//#footer-->
</div><!-- //#wrap   -->
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script type="text/template" id="searchListTmpl">
    <@ _.each(products,function(list,idx){ @>
        <li class="item_card_box">
        <a href="/gift/<@=list.no@>">
            <span class="heart_icon"><i class="far fa-heart empty_heart"></i><i class="fas fa-heart full_heart" style="color:red"></i></span>
            <img class="item_img" src="/img/<@=list.representImg@>" alt="상품이미지" width="150" height="150" />
            <div class="item_information">
                <h3><@=list.name@></h3>
                <div class="sale_percent">
					<@if(list.discountRate != 0){@>
					<strong><@=list.discountRate@>%</strong>
					<@}@>
				</div>
				<@if(list.discountRate != 0){@>
                <span class="before_sale_price" style="text-decoration: line-through"><@=list.price@>원 </span>
				<@}@>
                <span class="sale_price"> <@=Math.floor(list.price-(list.price*(list.discountRate*0.01)))@>원</span>
                <div class="item_review_score">
                    <div class="grade_star review_box">
                        <div class="inner_star review_box" style="width:<@=reviews[idx].score@>%"></div>
                    </div> <span class="review_count">(<@=reviews[idx].reviewNum@>)</span>
                </div>
            </div>
        </a>
    </li>
    <@})@>
</script>
<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    const searchListTmpl = _.template($("#searchListTmpl").html());
    const no = ${content.no}
    function getSearchList(){
        $.ajax({
            url:"/ajax/giftItem",
            dataType:"json",
            data:{
            	"no":no
            },
            type:"GET",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                $("#searchList").html(searchListTmpl(json));
            }
        })//ajax() end
    }//getSearchList() end
    getSearchList();
    //찜 눌렀을 때
    $("html").on("click",".empty_heart",function (e) {
        e.preventDefault();
        $(this).css("display","none");
        $(this).next().css("display","block");
    });
    //찜 취소
    $("html").on("click",".full_heart",function (e) {
        e.preventDefault();
        $(this).css("display","none");
        $(this).prev().css("display","block");
    })
</script>
</body>
</html>