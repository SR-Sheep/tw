<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:mall</title>
</head>
<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
	a{
        text-decoration: none;
	}
    #categoryBox{
        width: 1000px;
        height: 600px;
        margin: auto;
    }
    .category{
        width: 200px;
        height: 200px;
        margin: 25px;
        float: left;
    }
    .category img{
        border-radius: 200px;
        margin: 0 25px;
    }
    .category_title{
        width: 200px;
        height: 50px;
        text-align: center;
        line-height: 50px;
        color : #000;
    }
    #rankingBox{
        width: 1000px;
        height: 50px;
        position: relative;
        margin: auto;
    }
    #rankingBox>span{
        text-align: center;
        line-height: 50px;
    }
    #toggleBox{
        position: absolute;
        top: 0;
        right: 0;
    }
    #toggleBox>span{
        text-align: center;
        line-height: 50px;
    }
    .toggle span{
        display: inline-block;
        width: 63px;
        height: 36px;
        border-radius: 18px;
        background-color: #e0e0e0;
        cursor: pointer;
        transition: .2s ease;
    }
    .toggle>span{
        margin: 7px 0;
    }
    .toggle input{
        display: none;
    }
    .toggle input:checked+span{
        background-color: #43A047;
    }
    .toggle span::before{
        content: "";
        display: block;
        width: 28px;
        height: 28px;
        border-radius: 14px;
        background-color: #fff;
        margin: 4px;
        transition: .2s ease;
    }
    .toggle input:checked+span::before{
        transform: translate(26px);
    }
    #tabBox{
        margin: auto;
        width: 1000px;
    }
    .tab{
        float: left;
        width: 250px;
        height: 30px;
        text-align: center;
        line-height: 30px;
        background-color: #43A047;
        cursor: pointer;
    }
    .tab.active{
        background-color: #3eb39d;
        color: #e0e0e0;
    }
    
    .tmp{
    	font-size: 50px;
    }

</style>
<body>
<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
<div id="categoryBox">
    <div class="category"><a href=""><img src="/img/birth.jpg" width="150px" height="150px" alt="생일"/><div class="category_title">생일</div></a></div>
    <div class="category"><a href=""><img src="/img/merry.jpg" width="150px" height="150px" alt="결혼/기념일"/><div class="category_title">결혼/기념일</div></a></div>
    <div class="category"><a href=""><img src="/img/luxury.jpg" width="150px" height="150px" alt="명품선물"/><div class="category_title">명품선물</div></a></div>
    <div class="category"><a href=""><img src="/img/adult.jpg" width="150px" height="150px" alt="어른선물"/><div class="category_title">어른선물</div></a></div>
    <div class="category"><a href=""><img src="/img/graduation.jpg" width="150px" height="150px" alt="졸업선물"/><div class="category_title">졸업선물</div></a></div>
    <div class="category"><a href=""><img src="/img/healthy.jpg" width="150px" height="150px" alt="건강선물"/><div class="category_title">건강선물</div></a></div>
    <div class="category"><a href=""><img src="/img/baby.jpg" width="150px" height="150px" alt="출산/백일돌"/><div class="category_title">출산/백일돌</div></a></div>
    <div class="category"><a href=""><img src="/img/household.jpg" width="150px" height="150px" alt="생활용품"/><div class="category_title">생활용품</div></a></div>
</div>
<div id="rankingBox">
    <span>선물감동랭킹</span>
    <div id="toggleBox">
    <span>여자</span>
    <label class="toggle">
        <input type="checkbox">
        <span></span>
    </label>
    <span>남자</span>
    </div>

</div>
<div id="tabBox">
<ul>
    <li class="tab active">1만원 미만</li>
    <li class="tab">1~2만원대</li>
    <li class="tab">3~4만원대</li>
    <li class="tab">5만원 이상</li>
</ul>
</div>
</body>
<script src="js/jquery.js"></script>
<script>

    $("#tabBox li").on("click",function () {
        console.log("클릭");
        $(".active").removeClass("active");
        $(this).addClass("active");
    })
</script>
</html>