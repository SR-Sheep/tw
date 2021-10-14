<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 컨텐츠 관리 페이지</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/adminMenu.css">
    <style>
        body{
            font-family: "Noto Sans KR", sans-serif;
        }
        #wrap{
            width: 1100px;
            margin: auto;
        }
        #content{
            /*background-color: yellow;*/
            width: 930px;
            height: 1000px;
            float: left;
        }
        #content h2{
            font-size: 30px;
            position: relative;
            top: 20px;
            left: 20px;
        }
        /*컨텐츠 관리 텍스트*/
        .today_contents{
            display: inline-block;
            position: relative;
            top: 50px;
            left: 20px;
        }
        .today_contents.text{
            top: 60px;
            left: 25px;
        }
        .total_contents{
            margin-left: 20px;
            display: inline-block;
            position: relative;
            top: 50px;
            left: 20px;
        }
        .total_contents.text{
            top: 60px;
            left: 160px;
        }
        .contents_count_text{
            height: 150px;
        }
        /*컨텐츠 리스트*/
        #contentsWrap{
            width: 930px;
        }
        #contentsWrap li{
            float: left;
            margin: 0 0 20px 20px;
        }
        .li_contents_box{
            border: 1px solid #eee;
            overflow: hidden;
        }
        .li_contents_box:hover .contents_img{
            transform: scale(1.05);
        }
        .li_contents_box:hover{
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        #contentsWrap a{
            text-decoration: none;
            color: #424242;
        }
        .contents_text, .contents_title{
            width: 275px;
            margin-top: 20px;
            position: relative;
            left: 10px;
            line-height: 20px;
        }
        .contents_item_count{
            text-align: right;
            font-size: 13px;
            margin: 5px 5px 0 0;
        }
        /*토글 버튼*/
        .toggleBox{
            /*background-color: red;*/
            text-align: center;
            margin: 10px 0 0 0;
        }
        .toggle span {
            display: inline-block;
            width:100px;
            height:36px;
            border-radius: 18px;
            background-color: #bbb;
            cursor: pointer;
            transition: .2s ease;
        }
        .toggle input {
            display: none;
        }
        .toggle input:checked+span {
            background-color: #27AE60;
        }
        .toggle span::before {
            content: "";
            display: block;
            width:40px;
            height:28px;
            border-radius: 28px;
            background-color: #fff;
            margin:4px;
            transition: .2s ease;
        }
        .toggle input:checked+span::before {
            transform: translateX(52px);
        }
    </style>
</head>
<body>
    <div id="wrap"><!--#wrap-->
        <!--관리자 헤더-->
        <div class="admin_header">
            <h1 class="admin_logo">
                <a href="adminMain.html"> ADMIN </a>
            </h1>
            <ul>
                <li class="admin_header_nav_item"> <a href="/"> 로그아웃 </a></li>
                <li class="admin_header_nav_item"> <a href="/"> 상품등록 </a></li>
                <li class="admin_header_nav_item"> <a href="/admin/contents/register"> 컨텐츠등록 </a></li>
                <li class="admin_header_nav_item"> <a href="/"> 카테고리등록 </a></li>
            </ul>
        </div><!--adminHeader end-->
        <!--관리자 사이드바-->
        <div class="admin_side_bar">
            <ul>
                <li class="admin_side_bar_list"> <a href="/"> 상품관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/"> 유저관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/admin/contents"> 컨텐츠관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/"> 배송관리 </a></li>
            </ul>
        </div><!--sideBar end-->
        <div id="content"><!--#content-->
            <h2>컨텐츠 관리</h2>
            <h3 class="today_contents">오늘 진행 중인 컨텐츠</h3>
            <h3 class="total_contents">총 컨텐츠 수</h3>
            <div class="contents_count_text">
                <span class="today_contents text">6</span>
                <span class="total_contents text">30</span>
            </div>
            <div id="contentsWrap">
                <ul id="contentsBox">
                	<c:forEach items="${contents }" var="content">
                    <li>
                        <div class="li_contents_box">
                        <a href="">
                            <div class="contents_img_box"><img class="contents_img" src="/img/${contentImg }" alt="컨텐츠이미지" width="280" height="140"></div>
                            <div class="contents_item_count">상품 개수 : ${content.prodCount }개</div>
                            <div class="contents_title">${content.title }</div>
                            <div class="contents_text">${content.description }</div>
                        </a>
                        </div>
                        <div class="toggleBox">
                            <label class="toggle">
                                <input type="checkbox" name="" value="" checked>
                                <span></span>
                            </label>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div><!--//#content-->
    </div><!--//#wrap-->
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script type="text/template">

</script>
<script>

</script>
</body>
</html>