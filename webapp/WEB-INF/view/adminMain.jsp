<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/tui-date-picker.min.css"/>
    <style>
		html.on{
			overflow-y: hidden;
            padding-right: 17px;
		}
		
		#wrap{
			width:1100px;
			margin: 0 auto;
		}

        /*관리자 헤더*/
        .admin_header{
            position: relative;
            height:100px;
            border-bottom: 1px solid #bebebe;
        }

        .admin_header ul{
            position: absolute;
            right: 0;
            bottom: 30px;
        }

        .admin_header_nav_item{
            float: right;
            margin-right: 15px;

        }
        .admin_header_nav_item a{
            font-size: 20px;
            color: #424242;
        }
        .admin_header_nav_item a:hover{
        	color: #27AE60;
        }
        .admin_logo{
            /*width: 170px;*/
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            width: 170px;
            height: 50px;
            line-height: 50px;
            position:relative;
            top:20px;
        }

        /*관리자사이드바*/
        .admin_side_bar{
            width: 170px;
            position: absolute;
            height: 1500px;
            background-color: #196439;
        }

        .admin_side_bar_list{
            list-style: none;
            font-size: 20px;
            font-weight: bold;
            margin: 25px 0 0 20px;
        }

        .admin_side_bar_list a{
        	
            color: #fff;
        }

        .admin_logo a{
            text-decoration: none;
            color: #424242;
        }
		a{
			text-decoration: none;
            color: #424242;
		}
        /*팝업 뒷배경*/
        .main_bg_pop,.answer_bg_pop{
            display: none;
            position: fixed;
            z-index: 2;
            left:0;
            top:0;
            width:100%;
            height:100%;
            background-color: rgba(0,0,0,.5);
            background-repeat: no-repeat;
            background-position: center;
            cursor: pointer;
        }

        .main_pop, .answer_pop{
            cursor: auto;
            position: fixed;
            margin: -325px 0 0 -350px;
            top:50%;
            left: 50%;
            width: 700px;
            height: 650px;
            background-color: #fff;
            border-radius: 5px;
            z-index:3;
            display: none;
        }

        /*메인영역 필터영역*/
        .admin_main_filter_area{
            position: relative;
            left: 170px;
            width: 100%;
            height: 400px;
            /*background-color: darksalmon;*/

        }

        .admin_main_filter_box,.admin_main_review_box,.admin_main_summary_box{
            position: absolute;
            width: 910px;
            height: 360px;
            margin: 20px;
            background-color: #eee;
            border-radius: 5px;
        }
        .admin_main_review_box{
            background-color: #f5fffc;
            margin-top: 65px;
            height: 580px;
            /*white-space: nowrap;*/
            /*line-height: 1em;*/
            overflow: auto;
        }
        .admin_main_summary_box{
            height: 400px;
            background-color: #fff;
        }

        /*필터 선택 영역*/
        .admin_main_filter{
            /*background-color: rosybrown;*/
            margin-top: 15px;
            position: relative;
            height: 40px;
        }

        .admin_main_filter.btn{
            margin-left: 315px;

        }

        .btn_period, .check_declaration, .check_score, .input_name,.check_state,.check_answer,.btn_filter{
            float: left;
            height: 40px;
            line-height: 40px;
            margin-right: 15px;
            font-size: 18px;
            cursor: pointer;
            /*background-color: orange;*/
        }

        .btn_period{
            width: 50px;
            height: 38px;
            text-align: center;
            border: 1px solid #b2b2b2;
            border-radius: 5px;
        }
        .input_date{
            width: 130px;
            height: 38px;
            font-size: 14px;
            border: none;
            cursor: pointer;
        }
        .btn_period.wave{
            border: none;
            /*margin: 0;*/
            width: 10px;
        }

        .input_search_name{
            width: 200px;
            height: 34px;
            border: 1px solid #b2b2b2;
            cursor: auto;
        }
        .btn_filter button{
            /*margin: auto;*/
            width: 140px;
            height: 35px;
            font-size: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            /*display: none;*/
        }
        .btn_filter.search button{
            background-color: #27AE60;
        }
        .btn_filter.search button:hover{
            cursor: pointer;
            font-weight: bold;
            color: #fff;
        }

        .btn_filter.reset button{
            background-color: #fff;
        }

        .label{
            margin-left: 10px;
            width: 140px;
            height: 40px;
            text-align: right;
            border: none;
        }


        /*메인영역 리뷰목록영역*/
        .admin_main_review_area{
            position: relative;
            left: 170px;
            width: 100%;
            height: 650px;
            /*background-color: bisque;*/
        }
        .admin_main_review_area h2{
            position: absolute;
            z-index: 1;
            margin: 10px 0 0 20px;
            font-size: 30px;
            font-weight: bold;
        }
        .review_filter{
            position: absolute;
            top:20px;
            z-index: 1;
            left: 630px;
        }
        .review_filter .review_filter_num{
            position: absolute;
            top:-5px;
            height: 25px;
        }
        .admin_main_review_area .review_filter li{
            float: left;
            left: 100px;
            margin-right: 10px;
            color: #999;
        }

        /*리뷰 테이블 영역*/
        .review_table_col_area{
            position: absolute;
            overflow: hidden;
            top:62px;
            left: 20px;
            width: 910px;
            z-index: 1;
            /*top: -40px;*/
            /*background-color: #4b96e6;*/
        }
        .review_table_col_area ul{
            position: relative;
            left: 0;
        }

        .review_table_data{
            position: absolute;
            top:40px;
        }

        .review_table_data li:hover{
            /*background-color: #bcffc8;*/
            cursor: pointer;
        }

        .review_table_data a{
            display: inline-block;
            height: 102px;
        }

        /*테이블 컬럼 영역*/
        .review_table_col{
            width: 75px;
            height: 40px;
            text-align: center;
            padding: 0 5px;
            line-height: 40px;
            vertical-align: middle;
            /*float: left;*/
            display: inline-block;
            font-size: 18px;
            border-radius: 5px;
            background-color: #eee;
            border: 1px solid #eee;
            z-index: 1;
        }
        /*리뷰테이블 가로길이 지정*/
        .review_table_data ul, .review_table_col_area ul{
            width: 1110px;
        }

        /*데이터 행 영역*/
        .row{
            /*margin-top: 40px;*/
            height: 100px;
            line-height: 100px;
            /*vertical-align: center;*/
            background-color: #fff;
            border-right: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }
        .review_table_col.check{
            width: 20px;
        }
        .review_table_col.item_name{
            width: 150px;
            line-height: 40px;
        }
        .review_table_col.review_text{
            width: 250px;
            line-height: 40px;
        }
        .review_table_col.review_text p{
            width: 240px;
            line-height: 20px;
            padding: 5px;
            /*background-color: #4b96e6;*/
        }
        .review_table_col.item_name p{
            /*width: 250px;*/
            position: relative;
            top:30px;
            line-height: 20px;
            /*background-color: #4b96e6;*/
        }
        .review_table_col.review_modify{
            width: 150px;
        }
        .review_table_col.review_score{
            width: 45px;
        }


        /*메인영역 요약영역*/
        .admin_main_summary_area{
            position: relative;
            left: 170px;
            width: 100%;
            height: 450px;
            /*background-color: darkseagreen;*/
        }

        .summary_menu{
            float: left;
            margin-left: 90px;
            margin-top: 10px;
            font-size: 35px;
            width: 250px;
            height: 200px;
            /*background-color: #4b96e6;*/
        }

        .summary_menu_detail{
            font-size: 20px;
            /*margin-top: 5px;*/
        }
        .summary_menu_detail li{
            margin-top: 15px;
        }
        .summary_menu_detail li a{
            float: right;
            right: 10px;
        }



        .review_popup_title{
            font-size: 30px;
            font-weight: bold;
            margin: 10px 0 20px 10px;
        }
        .review_detail{
            margin-top: 10px;
            width: 590px;
            /*background-color: #4b96e6;*/
            display: block;
        }
        .user_review_card{
            position: relative;
            margin: auto;
            width: 600px;
            height: 540px;
            /*border: 1px solid #000;*/
            border-radius: 5px;
        }
        .user_review_image{
            display: inline-block;
            margin-left: 5px;
            border: 1px solid #424242;
            border-radius: 5px;
            width: 100px;
            height: 100px;
        }
        .user_info{
            display: inline-block;
            position: relative;
            font-weight: bold;
            top:5px;
            left: 10px;
        }
        .write_date{
            float: right;
            /*position: absolute;*/
            margin-right: 15px;
        }

        .review_content p{
            border-radius: 5px;
            border: 1px solid #424242;
            margin: auto;
            width: 550px;
            height: 120px;
            padding: 10px;
            overflow: auto;
        }
        .review_popup_item{
            display: inline-block;
            margin-right: 25px;
            margin-left: 10px;
        }

        .review_popup_info{
            position: relative;
            left: 10px;
            width: 220px;
            margin-top: 10px;
            /*border: 1px solid #424242;*/
            /*background-color: #4b96e6;*/
        }

        .review_popup_info_data{
            float: right;
            /*background-color: #196439;*/

        }
        .answer_content,.answer_write_content{
            border:1px solid #424242;
            border-radius: 5px;
            width: 550px;
            height: 60px;
            padding: 10px;
            overflow: auto;
            margin: auto;
        }
        .answer_write_content{
            height: 312px;
        }
        .answer_write_content textarea{
            resize: none;
            width: 542px;
            height: 302px;
            border-radius: 5px;
        }
        .answer_title{
            position: relative;
            left: 10px;
            font-weight: bold;
            margin-bottom: 5px;
        }
        /*블라인드 처리 버튼*/
        .display_btn, .submit_btn{
            position: relative;
            left: 175px;
            top:15px;
            width: 120px;
            height: 30px;
            text-align: center;
            display: inline-block;
            border: 1px solid #424242;
            border-radius: 5px;
            font-family: "Noto Sans KR", sans-serif;
            font-size: 17px;
        }
        .display_btn:hover, .submit_btn:hover{
            background-color: #196439;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }


        .review_menu{
            float: left;
            margin-left: 40px;
            margin-top: 10px;
            border: 1px solid #b2b2b2;
            border-radius: 5px;
            text-align: center;
            line-height: 30px;
            width: 100px;
            height: 30px;
        }
        .review_menu:hover{
            background-color: #27AE60;
            border: 1px solid #27AE60;
            cursor: pointer;
            font-weight: bold;
            color: #fff;

        }
        .review_menu.review_bundle_answer{
            display: none;
            margin-left: 330px;
        }
        .review_menu.review_paginate{
            position: absolute;
            margin-left: 472px;
            width:50px;
        }
		.review_menu.review_paginate.right{
			margin-left: 522px;
		}

        .popup_date_start,.popup_date_end {
            position: absolute;
            background-color: #fff;
            z-index: 9;
            margin-left: 210px;
            display: none;
        }

        .popup_on {
            display: block;
        }

        .btn_FilterClick {
            opacity: 1;
        }

        .start_wrapper{
            position: relative;
            left: 350px;
        }
        .end_wrapper{
            position: relative;
            left: 500px;
        }

        .review_filter .active{
            color: #196439;
            font-weight: bold;
        }
        .period .active{
            background-color: #27AE60;
            color: #fff;
            font-weight: bold;
            border: 1px solid #27AE60;
        }
    </style>

</head>
<body>

<div id="wrap">
<div class="admin_header">

        <h1 class="admin_logo">
            <a href="adminMain.html"> ADMIN </a>
        </h1>
    <ul>
        <li class="admin_header_nav_item"> <a href="/"> 로그아웃 </a></li>
        <li class="admin_header_nav_item"> <a href="/"> 상품등록 </a></li>
        <li class="admin_header_nav_item"> <a href="/"> 컨텐츠등록 </a></li>
        <li class="admin_header_nav_item"> <a href="/"> 카테고리등록 </a></li>
    </ul>
</div><!--adminHeader end-->



<div class="admin_side_bar">
    <ul>
        <li class="admin_side_bar_list"> <a href="/"> 상품관리 </a></li>
        <li class="admin_side_bar_list"> <a href="/"> 유저관리 </a></li>
        <li class="admin_side_bar_list"> <a href="/"> 컨텐츠관리 </a></li>
        <li class="admin_side_bar_list"> <a href="/"> 배송관리 </a></li>
    </ul>
</div><!--sideBar end-->

<!-- 리뷰 상세 팝업 뒷배경 -->
<div class="main_bg_pop"></div>
<div class="main_pop">

</div>

<div class="answer_bg_pop"></div>
<form class="review_form" action="/admin/reply" method="POST">
<input type="hidden" name="adminMember" value="1">
<div class="answer_pop">
    <h2 class = "review_popup_title">판매자 일괄답글 작성</h2>
    <div class="user_review_card">
<!--        <div class="review_detail">-->
<!--            <ul>-->
<!--                <li class="user_review_image"><img src=""></li>-->
<!--                <li class="user_review_image"><img src=""></li>-->
<!--                <li class="user_review_image"><img src=""></li>-->
<!--            </ul>-->
<!--        </div>-->
        <div class="user_info">선택된 리뷰 번호</div>
        <div class="review_detail review_content reviews_no">
            <p>
                리뷰 내용입니다.리뷰 내용입니다.리뷰 내용입니다.리뷰 내용입니다.리뷰 내용입니다.리뷰 내용입니다.
            </p>
        </div>
        <div class="review_detail">
            <p class="answer_title">판매자 답글쓰기</p>
            <div class="answer_write_content">
                <textarea name="replyContent"></textarea>
            </div>
        </div>
        <button class="submit_btn"> 등록</button>
        <div class="display_btn answer_close_btn"> 닫기</div>
    </div>

</div>
</form>



<div class="admin_main_filter_area">
    <div class="admin_main_filter_box">
        <ul>
            <div class="admin_main_filter period">
                <ul>
                    <li class="btn_period label">리뷰작성일</li>
                    <li><div data-period="0" class="btn_period active">오늘</div></li>
                    <li><div data-period="7" class="btn_period">1주일</div></li>
                    <li><div data-period="30" class="btn_period">1개월</div></li>
                    <li><div data-period="90" class="btn_period">3개월</div></li>
                    <li><div data-period="180" class="btn_period">6개월</div></li>
                    <li><div data-period="365" class="btn_period">1년</div></li>
                    <li><input type="text" class="btn_period input_date input_date_start" aria-label="Date-Time" placeholder="시작날짜 입력"></li>
                    <li class="btn_period wave">~</li>
                    <li><input type="text" class="btn_period input_date input_date_end" aria-label="Date-Time" placeholder="끝날짜 입력"></li>
                </ul>
            </div>
            <div class="popup_date_start">
                <div class="start_wrapper" >
                </div>
            </div><!-- //.popup_date_start -->
            <div class="popup_date_end">
                <div class="end_wrapper" >
                </div>
            </div><!-- //.popup_date_end -->

            <div class="admin_main_filter name">
                <ul>
                    <li class="input_name label">상품이름</li>
                    <li><input class="input_name input_search_name" type="text" placeholder="상품이름 검색"></li>
                </ul>
            </div>
            <div class="admin_main_filter score">
                <ul>
                    <li class="check_score label">구매자 평점</li>
                    <li><label data-score="5" class="check_score check_score_all"><input class="check_score input" type="checkbox" checked="checked">전체</label></li>
                    <li><label data-score="1" class="check_score"><input class="check_score input" type="checkbox">1점</label></li>
                    <li><label data-score="2" class="check_score"><input class="check_score input" type="checkbox">2점</label></li>
                    <li><label data-score="3" class="check_score"><input class="check_score input" type="checkbox">3점</label></li>
                    <li><label data-score="4" class="check_score"><input class="check_score input" type="checkbox">4점</label></li>
                    <li><label data-score="5" class="check_score"><input class="check_score input" type="checkbox">5점</label></li>
                </ul>
            </div>
            <div class="admin_main_filter state">
                <ul>
                    <li class="check_state label">디스플레이 상태</li>
                    <li><label data-state="" class="check_state check_state_all"><input class="check_state" type="checkbox" checked="checked">전체</label></li>
                    <li><label data-state="y" class="check_state"><input class="check_state input" type="checkbox">정상</label></li>
                    <li><label data-state="n" class="check_state"><input class="check_state input" type="checkbox">블라인드</label></li>
                </ul>
            </div>
            <div class="admin_main_filter answer">
                <ul>
                    <li class="check_answer label">답글여부</li>
                    <li><label data-score="" class="check_answer check_answer_all"><input type="checkbox" checked="checked">전체</label></li>
                    <li><label data-score="y" class="check_answer"><input class="check_answer input" type="checkbox">등록</label></li>
                    <li><label data-score="n" class="check_answer"><input class="check_answer input" type="checkbox">미등록</label></li>
                </ul>

            </div>
            <div class="admin_main_filter btn">
                <ul>
                    <li class="btn_filter search"><button>검색</button></li>
                    <li class="btn_filter reset"><button>초기화</button></li>
                </ul>
            </div>
        </ul>
    </div><!--//admin_main_filter_box-->
</div><!--//admin_main_filter_area-->

<div class="admin_main_review_area">
    <h2>리뷰목록 (총 52개)</h2>
    <div class="review_menu review_bundle_answer">일괄답글</div>
    <div class="review_menu review_paginate left">
    	<div><i class="fas fa-angle-left"></i></div>
    </div>
    <div class="review_menu review_paginate right">
    	<div><i class="fas fa-angle-right"></i></div>
    </div>
    <div class="review_filter">
        <ul>
            <li><a href="" >상품명순</a></li>
            <li><a href="" >평점순</a></li>
            <li><a href="" class="active">리뷰등록순</a></li>
        </ul>
        <select class="review_filter_num">
            <option value="10">10개씩</option>
            <option value="30">30개씩</option>
            <option value="50">50개씩</option>
            <option value="100">100개씩</option>
        </select>
    </div>
    <div class="review_table_col_area">
        <ul>
            <li class="review_table_col check"><input type="checkbox" class="check_all"></li><!--
                --><li class="review_table_col"><p>상품번호</p></li><!--
                --><li class="review_table_col item_name">상품명</li><!--
                --><li class="review_table_col id">등록자</li><!--
                --><li class="review_table_col review_score">평점</li><!--
                --><li class="review_table_col">리뷰번호</li><!--
                --><li class="review_table_col review_text">리뷰내용</li><!--
                --><li class="review_table_col review_modify">최종수정일</li><!--
                --><li class="review_table_col">전시상태</li><!--
                --><li class="review_table_col">답글여부</li><!--
                --><!--<li class="review_table_col">신고여부</li>-->
        </ul>
    </div>
    <div class="admin_main_review_box">
        <div class="review_table_data"></div>
    </div><!--//admin_main_review_box-->
</div>

<div class="admin_main_summary_area">
    <div class="admin_main_summary_box">
        <ul>
            <li class="summary_menu">상품 관리
                <div class="summary_menu_detail">
                    <ul>
                        <li>등록된 상품<a href="">20건 <i class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </div>
            </li>
            <li class="summary_menu">유저 관리
                <div class="summary_menu_detail">
                    <ul>
                        <li>신규유저<a href="">117건 <i class="fas fa-chevron-right"></i></a></li>
                        <li>가입된 유저<a href="">2017건 <i class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </div>
            </li>
            <li class="summary_menu">콘텐츠 관리
                <div class="summary_menu_detail">
                    <ul>
                        <li>작성된 콘텐츠<a href="">17건 <i class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </div>
            </li>
            <li class="summary_menu">배송 관리
                <div class="summary_menu_detail">
                    <ul>
                        <li>오늘 갈 배송<a href="">117건 <i class="fas fa-chevron-right"></i></a></li>
                        <li>배송 건 수<a href="">111117건 <i class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</div>
</div><!-- //#wrap -->
<script type="text/template" id="reviewListTmpl">
    <@ _.each(list,function(review){@>
        <ul class="review-table-row" data-reviewNo="<@=review.no@>">
            <li class="row review_table_col check"><input type="checkbox" class="check"></li><!--
            --><li class="row col_data review_table_col"><@=review.productNo@></li><!--
            --><li class="row col_data review_table_col item_name"><p><@=review.productName@></p></li><!--
            --><li class="row col_data review_table_col id"><@=review.memberId@></li><!--
            --><li class="row col_data review_table_col review_score"><@=review.score@></li><!--
            --><li class="row col_data review_table_col review_no"><@=review.no@></li><!--
            --><li class="row col_data review_table_col review_text"><p><@=review.content@></p></li><!--
            --><li class="row col_data review_table_col review_modify"></li><!--
            --><li class="row col_data review_table_col"><@=review.blind@></li><!--
				<@if(review.replyReivewNo>0){@>
            --><li class="row col_data review_table_col">Y</li><!--
				<@} else{@>
			--><li class="row col_data review_table_col">N</li><!--
				<@}@>
            --><!--<li class="row col_data review_table_col"><@=review.declaration@></li>-->
        </ul>
    <@})@>
</script>
<script type="text/template" id="reviewDetailTmpl">

<h2 class = "review_popup_title">리뷰상세보기</h2>
    <div class="user_review_card">
        <div class="review_detail">
            <ul>
				<@ _.each(reviewImage,function(reviewImg){@>
                <li class="user_review_image"><img src="/img/<@=reviewImg.name@>" width="100" height="100"></li>
				<@})@>
            </ul>
        </div>
        <div class="review_detail">
            <ul>
                <li class="user_info"><@=reviewDetail.memberId@></li>
                <li class="user_info">★★★★☆</li>
                <li class="user_info write_date"></li>
            </ul>
        </div>
        <div class="review_detail review_content">
            <p>
           	<@=reviewDetail.content@>
            </p>
        </div>
        <div class="review_detail">
            <ul>
                <li class="review_popup_info"><span>상품명 : </span> <span class="review_popup_info_data"><@=reviewDetail.productName@></span></li>
                <li class="review_popup_info"><span>상품 주문번호 : </span> <span class="review_popup_info_data"><@=reviewDetail.paymentNo@></span></li>
                <li class="review_popup_info"><span>리뷰 글 번호 : </span> <span class="review_popup_info_data"><@=reviewDetail.no@></span></li>
                <li class="review_popup_info"><span>리뷰 전시 여부 :</span> <span class="review_popup_info_data"><@=reviewDetail.blind@></span> </li>
            </ul>

        </div>
        <div class="review_detail">
            <p class="answer_title">판매자 답글내용</p>
            <div class="answer_content">
                <p>
					<@=reviewDetail.replyContents@>
				</p>
            </div>
        </div>
        <button class="submit_btn"> 수정하기</button>
        <div class="display_btn"> 블라인드 처리</div>
    </div>


</script>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>

<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim, evaluate: /\<\@([\s\S]+?)\@\>/gim, escape: /\<\@\-(.+?)\@\>/gim};

    const $reviewOrderFilter = $(".review_filter a");
    const $reviewDateFilter = $(".period div.btn_period");
    const $review_table_data = $(".review_table_data");// 탭
    const reviewListTmpl = _.template($("#reviewListTmpl").html());// 템플릿
    const getReviewListButton = $(".btn_filter.search");

    const $periodFilter = $(".admin_main_filter.period div");
    const $nameFilter = $(".admin_main_filter.name label");
    const $declarationFilter = $(".admin_main_filter.declaration label");
    const $scoreFilter = $(".admin_main_filter.score label");
    const $stateFilter = $(".admin_main_filter.state label");
    const $answerFilter = $(".admin_main_filter.answer label");

    const $reviewBox = $(".admin_main_review_box");
    const $reviewColumn = $(".review_table_col_area ul");
    // let $reviewRow = $(".review_table_data .row");
    const $mainBgPop = $(".main_bg_pop");
    const $answerBgPop = $(".answer_bg_pop");
    const $selectedReviewsArea = $(".answer_pop .reviews_no p");
    const reviewDetailTmpl = _.template($("#reviewDetailTmpl").html());
    const $reviewFilterNum = $(".review_filter_num");
    const $paginateRight = $(".review_paginate.right");
    const $paginateLeft = $(".review_paginate.left");

    let period = 0; // 0, 7, 30, 90, 180, 365, 날짜 계산 일수
    let name = ""; //글자
    let score = "5"; // 1, 2, 3, 4, 5 기본값 5
    let display = ""; // n, y
    let reply = ""; // n, y
    let sort = 1; //리뷰등록순 : 1, 평점순 : 3, 상품명순 : 8
    let rownum = 10; //10, 30, 50, 100 보여질 게시물 수
    let today = new Date(); //현재날짜
    let startDate = $(".input_date_start").val(); //버튼에입력된 날짜
    let endDate = $(".input_date_end").val(); //버튼에입력된 날짜
	let page = 1; //기본 페이지 1

	//필터의 검색 버튼을 눌렀을 때
    getReviewListButton.click(function () {
        
    	$(".btn_period active").attr("data-period");
    	//console.log($(".btn_period.active").attr("data-period"))
    	//console.log($(".input_search_name").val())
    	$(".check_state.input:checked").each(function (index) {
    		console.log("zz")
    	})
    	//console.log($(".check_score.input:checked"));
    	//console.log($(".check_state.input:checked").length);
    	//console.log($("."))
    	
    	
        //리뷰목록을 파라미터에 따라 ajax로 불러온다
        getReviewList(period,name,score,display,reply,sort,rownum);
    })
	
	//보여질 게시물 수 설정
	$reviewFilterNum.on("change",function(){
		rownum = $(this).val();
		//console.log($(this).val())
		getReviewList(period,name,score,display,reply,sort,rownum);
	});
	
	//달력 시작날짜 입력 필터 버튼 클릭 시
    $(".admin_main_filter .input_date_start").click(function () {
        clickFilterBtn($(this), $(".popup_date_start"));
        // alert("tl")
    });
	
  	//달력 종료날짜 입력 필터 버튼 클릭 시
    $(".admin_main_filter .input_date_end").click(function () {
        clickFilterBtn($(this), $(".popup_date_end"));
    });
    
    //시작날짜 데이트피커
    const startDatepicker = new tui.DatePicker('.start_wrapper', {
        startDate: new Date(),
        input: {
            element: '.input_date_start',
            format: 'yyyy-MM-dd',
        },
        showAlways: true,
        language: 'ko',
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ]
    });
    
    //시작날짜 데이트피커 날짜 클릭 시
    $(".tui-calendar-date.tui-is-selectable").click(function(){
        startDate = this.dataset.timestamp;
        startYear = startDate.year;
        startMonth = startDate.month;
        startDay = startDate.day;
        clickFilterBtn( $(".admin_main_filter .input_date_start"), $(".popup_date_start"));
        //console.log(startDate);
    });

    //종료날짜 데이트피커
    const endDatepicker = new tui.DatePicker('.end_wrapper', {
        endDate: new Date(),
        input: {
            element: '.input_date_end',
            format: 'yyyy-MM-dd',
        },
        showAlways: true,
        language: 'ko',
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ]
    });

    //종료날짜 데이트피커 날짜 클릭 시
    $(".tui-calendar-date.tui-is-selectable").click(function(){
        endDate = this.dataset.timestamp;
        clickFilterBtn( $(".admin_main_filter .input_date_end"), $(".popup_date_end"));
        //console.log(endDate)
    });
	
    //데이트피커 팝업창 띄우기
    function clickFilterBtn($btn, $popup) {
        $(".popup_on").not($popup).removeClass("popup_on");
        $(".btn_FilterClick").not($btn).removeClass("btn_FilterClick");
        $btn.toggleClass("btn_FilterClick");
        $popup.toggleClass("popup_on");
    }
	/*
	$("html").on("click",function(){
		console.log($(".input_date_start").val());
		console.log($(".input_date_end").val());
	})
    */
    //기본 리뷰 리스트 호출
    getReviewList(period,name,score,display,reply,sort,rownum);

    $reviewOrderFilter.click(function (e) {
        e.preventDefault();
        $reviewOrderFilter.removeClass("active");
        $(this).toggleClass("active");
    })
    $reviewDateFilter.click(function (e) {
        e.preventDefault();
        $reviewDateFilter.removeClass("active");
        $(this).toggleClass("active");
    })

    $(".reset button").on("click",function () {
        period=0;
        getReviewList(period,name,score,display,reply,sort,rownum);
    });

    //리뷰 리스트 데이터영역 클릭 시 리뷰상세 가져오기 및 팝업 띄우기
    $("html").on("click",".row.col_data",function () {
    	
    	//console.log($(this).parent().attr("data-reviewNo"))
    	const reviewNo = $(this).parent().attr("data-reviewNo");
    	
    	$.ajax({
    		url:"/ajax/admin/review/"+reviewNo,
            //넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
            dataType:"json",
            //파라미터 지우고 주소에 쓰면 pathVariable 가능             
            error:function(xhr,error){
                alert(error);
            },
            success:function(json){
            	console.log(json)
            	$mainBgPop.css({
                    display : "block"
                })
                $(".main_pop").css("display","block");
            	$(".main_pop").html(reviewDetailTmpl(json));
                $("html").addClass("on");
            }
    	})//ajax() end
    })

    //리뷰 상세보기 팝업 끄기
    $mainBgPop.click(function (e) {
        e.stopPropagation();
        const bg = $mainBgPop.css("display");
        if(bg == 'block'){
            $(".main_pop").css("display","none");
            $mainBgPop.css({
                display : "none"
            })
            $("html").removeClass("on");
        }
    })
    //일괄 답변 등록 버튼 클릭시 체크된 리뷰번호 목록으로 띄우기
    $("html").on("click",".review_bundle_answer",function () {
        let selectedReviewNo = "";
        $(".review-table-row .review_table_col input").each(function (index,item) {
            if($(this).is(":checked") == true) {
                selectedReviewNo += $(this).parent().parent().data("reviewNo") +"  ";
            	$("<input type=\"hidden\" class=\"new_input\" name=\"reviewNo\" value="+$(this).parent().parent().data("reviewNo")+">").prependTo($(".review_form"))                
            }
        });
        $selectedReviewsArea.text(selectedReviewNo);
        $answerBgPop.css({
            display : "block"
        })
        $("html").addClass("on");
    })

    //답글 일괄작성 팝업 키고, 끄기
    $answerBgPop.click(function (e) {
        e.stopPropagation();
        const bg = $answerBgPop.css("display");
        if(bg == 'block'){
            $(".answer_pop").css("display","none");
            $answerBgPop.css({
                display : "none"
            })
            $(".new_input").attr("disabled",true);
            $("html").removeClass("on");
        }
    })

    //답글 일괄작성 팝업의 닫기 버튼을 눌렀을 때
    $(".answer_close_btn").click( function () {
        $(".answer_pop").css("display","none");
        $answerBgPop.css({
            display : "none"
        })
    });

    //답글 일괄작성 버튼을 눌렀을 때
    $(".review_bundle_answer").on("click",function () {
        $(".answer_pop").css({
            display:"block"
        })
    })

    //리뷰 목록 불러오기 ajax
    function getReviewList(period,name,score,display,reply,sort,rownum){

        $.ajax({
            //연결 시킬 서블릿
            url:"/ajax/admin/review",
            //넘겨주는 방식
            type:"get",
            //넘겨주는 데이터 형식
            dataType:"json",
            //서블릿으로 넘겨줄 데이터
            data:{
                "period" : period,
                "name" : name,
                "score" : score,
                "display" : display,
                "reply" : reply,
                "sort" : sort,
                "numPage" : rownum,
                "page":page},
            error:function(xhr,error){
                alert(error);
            },
            success:function(json){
                $review_table_data.html(reviewListTmpl({list:json}));
                console.log(json)
            }
        })
    }

    //리뷰목록 테이블의 모두 체크하기를 눌렀을 때
    $(".check_all").on("click",function () {

        //모두 체크하기가 체크돼있을 때
        if($(".check_all").prop('checked')) {
            $(".check").prop('checked',true);
            $(".check").attr('checked',true);
            $(".review_menu.review_bundle_answer").css({
                display:"block"
            })
        } else {
            $(".check").prop('checked',false);
            $(".check").attr('checked',false);
            $(".review_menu.review_bundle_answer").css({
                display:"none"
            })
        }//if~else end
    });//checkAll 클릭 시 전체선택 및 해제

    //리뷰목록 테이블의 데이터 영역 체크박스 클릭 시
    $("html").on("click",".review_table_col .check",function () {

        if($("input:checkbox[class='check']").is(":checked") == true) {
            $(".check_all").prop('checked',false);
            $(this).attr('checked',true);
        }
        else if($("input:checkbox[class='check']").is(":checked") == false) {
            $(this).attr('checked',false);
            $(".review_menu.review_bundle_answer").css({
                display: "none"
            })
        }
        $(".review_table_col .check").each(function (index,item) {
            if ($(item).prop("checked")) {
                $(".review_menu.review_bundle_answer").css({
                    display: "block"
                })
            }
        });
    })
    //구매자 평점 전체 필터 버튼
    $("html").on("click",".check_score_all",function () {
        if($(this).children().prop('checked')) {
            $(".check_score").children().prop('checked',true);
        } else {
            $(".check_score").children().prop('checked',false);
        }//if~else end
    });
    //구매자 평점 점수 필터 버튼(1~5점)
    $("html").on("click",".check_score",function () {
        if($(this).children().is(":checked").length == 5) {
            $(".check_score_all").children().attr('checked',false);
            $(this).children().attr('checked',true);
        }
        else if($(this).children().is(":checked") != 5) {
            $(this).children().attr('checked',false);
        }
    });
    //디스플레이 상태 전체 필터 버튼
    $("html").on("click",".check_state_all",function () {
        if($(this).children().prop('checked')) {
            $(".check_state").children().prop('checked',true);
            $(".check_state").children().attr('checked',true);
        } else {
            $(".check_state").children().prop('checked',false);
            $(".check_state").children().attr('checked',false);
        }//if~else end
    });
    //디스플레이 상태 정상,블라인드 버튼
    $("html").on("click",".check_state",function () {
        if($(this).children().is(":checked") == true) {
            $(".check_state_all").children().attr('checked',false);
            $(this).children().attr('checked',true);
        }
        else if($(this).children().is(":checked") == false) {
            $(this).children().attr('checked',false);
        }
    });
    //답글여부 전체 필터 버튼
    $("html").on("click",".check_answer_all",function () {
        if($(this).children().prop('checked')) {
            $(".check_answer").children().prop('checked',true);
            $(".check_answer").children().attr('checked',true);
        } else {
            $(".check_answer").children().prop('checked',false);
            $(".check_answer").children().attr('checked',false);
        }//if~else end
    });
    //답글여부 등록, 미등록 버튼
    $("html").on("click",".check_answer",function () {
        if($(this).children().is(":checked") == true) {
            $(".check_answer_all").children().attr('checked',false);
            $(this).children().attr('checked',true);
        }
        else if($(this).children().is(":checked") == false) {
            $(this).children().attr('checked',false);
        }
    });
    
    //리뷰목록 데이터영역 스크롤 감지
    $reviewBox.scroll(function (event) {
        scrollLeftValue = $(this).scrollLeft();
        console.log(scrollLeftValue);
        if (scrollLeftValue >= 0){
            $reviewColumn.animate({
                'left': 0 - scrollLeftValue
            }, 0);
        }
    });
  	
  	//1 page이면 이전 버튼 안보이기
  	function defaultBtn(){
  		//console.log(page)
  		//console.log($(".review_menu.review_paginate.left"))
  		if(page == 1){
  			$(".review_menu.review_paginate.left").css("visibility","hidden");
  		} else if($(".review-table-row").length<10){
  			$(".review_menu.review_paginate.right").css("visibility","hidden");
  		}
  	}
  	defaultBtn();
  	
  		let reviewPageTotal = 10; 
  		
  	//다음 버튼 클릭 시 이전버튼 나타남, 개수에 따라 다음버튼 사라지기
  	$paginateRight.on("click",function(){
  		//console.log(rownum)
  		page = page+1;
  		console.log(reviewPageTotal);
  	  	getReviewList(period,name,score,display,reply,sort,rownum);
  	  	//console.log(reviewPageTotal);
  		if($("html .review-table-row").length==rownum*page){
  			
  		}
  		$(".review_menu.review_paginate.left").css("visibility","visible");
  		//console.log(page);
  		//console.log($("html .review-table-row").length)
  		if(reviewPageTotal<10){
  			$(".review_menu.review_paginate.right").css("visibility","hidden");
  		}//length if()
  		//console.log(page)
  	})
  	
  	//이전 버튼
  	$paginateLeft.on("click",function(){
  		page = page-1;
  		getReviewList(period,name,score,display,reply,sort,rownum);
  	})

</script>

</body>
</html>