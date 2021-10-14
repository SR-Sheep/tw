<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>마이 쿠폰</title>
</head>
<link href="css/reset.css" rel="stylesheet">
<style>

    li{
        width: 200px;
        float: left;
        top: 50px;
        cursor: pointer;
        border: 1px solid #e0e0e0;
        text-align: center;
        position: relative;
    }
    li.active{
        border-bottom: none;
    }
    .tab{
        display: none;
    }
    .tab.active{
        top: 100px;
        display: block;
        width: 800px;
        position: absolute;

    }

</style>
<body>
<form action="">
    <span>COUPON 등록</span> <input /> <button>쿠폰등록</button>
</form>
<ul>
    <li class="active">사용 가능한 쿠폰 N장</li>
    <li>종료된 쿠폰</li>
</ul>
<!-- 사용가능한 쿠폰 tap -->
    <div class="tab active">
        <img src="img/coupon.PNG">
    </div>
    <!-- //사용 가능한 쿠폰 tap end-->

    <!-- 종료된 쿠폰 tap -->
    <div class="tab">
        <img src="img/coupon2.PNG">
    </div>
    <!-- //종료된 쿠폰 tap end-->

</body>
<script src="js/jquery.js"></script>
<script>

    let idx = 0;
    $("li").on("click", function () {

        $(".active").removeClass("active");

        // 2) 클릭한 그 li요소에 on 클래스를 더한다.
        $(this).addClass("active");

        idx = $(this).index();

        $(".tab").eq(idx).addClass("active");
    })

</script>
</html>