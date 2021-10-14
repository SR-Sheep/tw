<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 검색 결과 페이지</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/all.min.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/notosanskr.css">
    <%--<link rel="stylesheet" href="/css/paginate.css"> --%>
    <style>
        body{
            font-family: "Noto Sans KR", sans-serif;
            user-select: none;
        }
        #content{
            overflow: hidden;
            /*background-color: grey;*/
        }
        #itemList{
            /*background-color: grey;*/
            width: 800px;
            float: left;
            margin: 40px 0 0 140px;
        }
        /* sidebarWrap 기준 고정하기 위해*/
        #sidebarWrap{
            position: fixed;
            width: 1100px;
        }
        .sidebar{
            /*background-color: blue;*/
            width: 100px;
            height: 500px;
            margin-left: 50px;
            margin-top: 40px;
            position: absolute;
            right: 0;
        }
        #footer{
            clear: both;
            margin-top: 150px;
        }
        .order_filter_box{
            height: 50px;
            position: relative;
            top: 40px;
            right: 20px;
            margin: 10px 0 20px 0;
        }
        .order_filter{
            float: right;
            margin-left: 20px;
            cursor: pointer;
        }
        .order_filter:hover{
            color: #27AE60;
        }
        .itemCardBox{
            /*background-color: red;*/
            width: 348px;
            height: 348px;
            float: left;
            margin: 0 0 50px 40px;
            border: 1px solid #eee;
            position: relative;
        }
        .itemCardBox:hover{
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }
        .itemCardBox a{
            text-decoration: none;
            color: #424242;
        }
        .item_img{
            margin: 10px 0 0 75px;
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
        /*사이드 바*/
        .side_item_list_wrap{
            overflow: hidden;
        }
        .side_item_list{
            text-align: center;
            height: 332px;
            position: relative;
        }
        .side_item_box img{
            border: 1px solid #eee;
            cursor: pointer;
        }
        .side_arrow{
            text-align: center;
            cursor: pointer;
        }
        .side_up_arrow{
            margin-bottom: 20px;
            margin-top: 10px;
        }
        .side_down_arrow {
            margin-top: 20px;
        }
        .dib_list, .recent_list{
            text-align: center;
            cursor: pointer;
            background-color: #eee;
            border: 1px solid #bebebe;
            padding: 2px;
        }
        .dib_list{
            margin-bottom: 1px;
        }
        .recent_list{
        }
        .dib_list:hover, .recent_list:hover{
            color: #27AE60;
        }
        /*평점 관련*/
        .review_box {
            background-image: url("img/ico_newsview_200522.png");
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
        hr{
            width: 900px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <div id="header">
            <div id="headerLogoBox">
                <a href="/"><img id="headerLogo" src="img/logo.png"></a>
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
        </div><!-- //header   -->
        <div id="content">
            <div id="categoryBox">
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
            </div>
            <hr>
            <div class="order_filter_box">
                <ul>
                    <li class="order_filter" data-filter="l">최신순</li>
                    <li class="order_filter" data-filter="s">판매량순</li>
                    <li class="order_filter" data-filter="r">리뷰순</li>
                    <li class="order_filter" data-filter="hp">높은 가격순</li>
                    <li class="order_filter" data-filter="lp">낮은 가격순</li>
                </ul>
            </div>
            <div id="itemList">
                

                </ul>
            </div>
            <div id="sidebarWrap">
                <div class="sidebar">
                    <div class="dib_list">찜 목록 <i class="fas fa-caret-right dib"></i></div>
                    <div class="recent_list">최근본상품 <i class="fas fa-caret-right recent"></i></div>
                    <div class="side_arrow side_up_arrow"><i class="fas fa-angle-up"></i></div>
                        <div class="side_item_list_wrap">
                            <ul class="side_item_list">

                            </ul>
                        </div>
                    <div class="side_arrow side_down_arrow"><i class="fas fa-angle-down"></i></div>
                </div>
            </div>
        </div>
        <!--푸터-->
        <div id="footer">
            <!--푸터 로고-->
            <h1 id="fLogo">
                <img src="img/logo.png" alt="로고" width="100px" height="50px">
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
        </div><!--//푸터-->
    </div><!-- //wrap   -->
    
     
    
<script type="text/template" id="searchListTmpl">
<ul id="searchList">
    <@ _.each(giftList,function(list){ @>
    <li class="itemCardBox">
        <a href="/gift/<@=list.no@>">
            <span class="heart_icon"><i class="far fa-heart empty_heart"></i><i class="fas fa-heart full_heart" style="color:red"></i></span>
            <img class="item_img" src="/img/<@=list.representImg@>" alt="<@=list.name@>" width="200" height="200" />
            <div class="item_information">
                <h3><@=list.name@></h3>				
                <div class="sale_percent">
				<@if(list.discountRate!=0){@>
					<strong><@=list.discountRate@>%</strong>
				</div>
                <span class="before_sale_price" style="text-decoration: line-through"><@=list.price@>원 </span>                
				<@} @><%--if end --%>
				<span class="sale_price"> <@=list.finalPrice@>원</span>			
                <div class="item_review_score">
                    <div class="grade_star review_box">
                        <div class="inner_star review_box" style="width:100%"></div>
                    </div> <span class="review_count">(<@=list.reviewCount@>)</span>
                </div>
            </div>
        </a>
    </li>
    <@})@>
</ul>
<@=paginate@>
</script>
<script type="text/template" id="sideList">
    <@ _.each(sideList,function(list){ @>
    <li class="side_item_box"><img src="img/<@=list.image@>" alt="" width="80" height="80"></li>
    <@})@>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //상품리스트 템플릿
    const searchListTmpl = _.template($("#searchListTmpl").html());
    //상품리스트
    const $searchList = $("#searchList");
    const $itemList = $("#itemList");
    //사이드바 찜목록
    const $dibList = $(".dib_list");
    //사이드바 최근목록
    const $recentList = $(".recent_list");
    //찜목록 화살표
    const $dibArrow = $(".fa-caret-right.dib");
    //최근목록 화살표
    const $recentArrow = $(".fa-caret-right.recent");
    //사이드 이미지 리스트
    const $sideItemList = $(".side_item_list");
    //사이드리스트 템플릿
    const sideListTmpl = _.template($("#sideList").html());
    //사이드 리스트 위치
    let listTop = 0;
    const $sidwDownBtn = $(".fa-angle-down");
    //사이드 위 버튼
    const $sidwUpBtn = $(".fa-angle-up");
    //사이드 이미지리스트 길이
    const sideImgListHeight = $(".side_item_box").length*83;
    console.log(sideImgListHeight)
    
    //필터
    const $orderFilter=$(".order_filter");
    
    //첫 페이지를 1로 설정
    let page = 1;
    
    //처음 필터는 최신순으로 설정;
    let filter="l";
    
 	//숫자형식(#,###)에 대한 추가
    Number.prototype.format = function(){
        if(this==0) return 0;
        var reg = /(^[+-]?\d+)(\d{3})/;
        var n = (this + '');
        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
        return n;
    };

    //숫자의 문자형식에 대해서도 (#,###)로 출력되도록 기능 추가
    String.prototype.format = function(){
        var num = parseFloat(this);
        if( isNaN(num) ) return "0"; 
        return num.format();
    };

    function getSearchList(){
        $.ajax({
            url:"ajax/searchList",
            dataType:"json",
            data:{"page":page, "filter":filter},
            Type:"GET",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
            	//최종가 계산하여 json에 저장하기
            	const abc=json.giftList[0];            	
            	//console.log(abc);
            	//console.log(abc.finalPrice=(100-abc.discountRate)*abc.price/100);            	
            	
            	//console.log("변경 전 : "+json.giftList[0].price);
            	//json.giftList[0].price=json.giftList[0].price.format();
            	//console.log("변경 후 : "+json.giftList[0].price);
            	
            	
            			if(abc.score>6){
            				console.log("누가입력했냐 점수 높아서 보정 : "+abc.score/20);
            			}else{
            				console.log("평점 : "+abc.score);
            			};  
            	const list=json.giftList;		
            			
            	
            	//21-03-05 06:11 양성룡 json 일부 데이터 변경을 위한 for문
            	for(idx in list){
            		//최종가 계산하여 finalPrice로 저장하기
            		list[idx].finalPrice=(100-list[idx].discountRate)*list[idx].price/100
            		
            		//가격 형식을 #,###으로 변환하여 다시 저장
            		list[idx].price=list[idx].price.format();
            		list[idx].finalPrice=list[idx].finalPrice.format();
            	}
            	
            	
            	
            	console.log(json);
            	
            	
                $itemList.html(searchListTmpl(json));
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
    //sidebar 화살표 표시
    function showSideBtn(){
        if(sideImgListHeight<332){
            $sidwDownBtn.css("visibility","hidden");
            $sidwUpBtn.css("visibility","hidden");
        } else{
            $sidwDownBtn.css("visibility","visible");
            $sidwUpBtn.css("visibility","hidden");
        }
    }
    showSideBtn();

    //사이드바 찜 목록 눌렀을 때(찜 리스트, 화살표 회전)
    $dibList.on("click",function(){
        $dibArrow.css({
            "transform":"rotate(90deg)",
            "transaction":".2s ease"
        });
        $recentArrow.css({
            "transform":"rotate(0)",
            "transaction":".2s ease"
        })
        $.ajax({
            url:"ajax/sideList.json",
            dataType:"json",
            Type:"GET",
            async:false,
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                console.log(json)
                $sideItemList.html(sideListTmpl({"sideList":json}));
            }
        })//ajax() end
        //사이드 아래 버튼 다시 선언 및 초기화
        const $sidwDownBtn = $(".fa-angle-down");
        //사이드 위 버튼 다시 선언 및 초기화
        const $sidwUpBtn = $(".fa-angle-up");
        //사이드 이미지리스트 길이 다시 선언 및 초기화
        const sideImgListHeight = $(".side_item_box").length*83;
        console.log(sideImgListHeight)
        if(sideImgListHeight<332){
            $sidwDownBtn.css("visibility","hidden");
            $sidwUpBtn.css("visibility","hidden");
        } else{
            $sidwDownBtn.css("visibility","visible");
            $sidwUpBtn.css("visibility","hidden");
        }
    })

    //최근 본 목록(리스트, 화살표 방향 회전)
    $recentList.on("click",function(){
        $dibArrow.css({
            "transform":"rotate(0)",
            "transaction":".2s ease"
        });
        $recentArrow.css({
            "transform":"rotate(90deg)",
            "transaction":".2s ease"
        })
        $.ajax({
            url:"ajax/sideListRecent.json",
            dataType:"json",
            Type:"GET",
            async:false,
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                $sideItemList.html(sideListTmpl({"sideList":json}));
            }
        })//ajax() end
        //사이드 아래 버튼 다시 선언 및 초기화
        const $sidwDownBtn = $(".fa-angle-down");
        //사이드 위 버튼 다시 선언 및 초기화
        const $sidwUpBtn = $(".fa-angle-up");
        //사이드 이미지리스트 길이 다시 선언 및 초기화
        const sideImgListHeight = $(".side_item_box").length*83;
        if(sideImgListHeight<332){
            $sidwDownBtn.css("visibility","hidden");
            $sidwUpBtn.css("visibility","hidden");
        } else{
            $sidwDownBtn.css("visibility","visible");
            $sidwUpBtn.css("visibility","hidden");
        }
    })

    //사이드 아래화살표 클릭 시
    $sidwDownBtn.on("click",function () {
        $sidwUpBtn.css("visibility","visible");
        listTop -= 83;
        $sideItemList.css("top",listTop);
        if(sideImgListHeight+listTop==332){
            $sidwDownBtn.css("visibility","hidden");
        }
        //console.log(sideImgListHeight+listTop)
    })
    //사이드 위 화살표 클릭 시
    $sidwUpBtn.on("click",function () {
        $sidwDownBtn.css("visibility","visible");
        listTop += 83;
        $sideItemList.css("top",listTop);
        //console.log(sideImgListHeight-listTop==sideImgListHeight)
        if(sideImgListHeight-listTop==sideImgListHeight){
            $sidwUpBtn.css("visibility","hidden");
        }
    })
    
    
    //필터를 누르면 filter 값을 가져옴
    $orderFilter.on("click",function(){
    	//alert("클릭");
    	//console.log($(this).data("filter"));    	
		filter=$(this).data("filter");
    	//ajax 다시 불러오기
    	getSearchList();
    
    })
    
    
    
</script>
</body>
</html>