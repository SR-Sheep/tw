<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선:Mall 내가 작성한 리뷰</title>
</head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/datepicker.min.css">
<style>
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
<div id="content2">
<div id="date">
    <ul>
        <li class="active">오늘</li>
        <li>1개월</li>
        <li>3개월</li>
        <li>6개월</li>
        <li>1년</li>
        <li>3년</li>
    </ul>
</div>
    <input type="text" id="datepickerStart">~<input type="text" id="datepickerEnd">
<div id="myReviewBox">
    <h2>내가 작성한 리뷰</h2>
        <ul id="myReview">

        </ul>
    <!-- 템플릿 작동되나 확인하는 버튼, 나중에 지우세요~-->
    <button id="add"></button>
    <!-- 템플릿 작동되나 확인하는 버튼, 나중에 지우세요  end-->
</div>
</div>

<!-- 템플릿 시작 -->
<script type="text/template" id="myReviewTmpl">
    <li>
        <!-- 썸내일 박스 -->
        <div id="thumbnailBox">
            <img alt="상품이미지" width="50px" height="50px" src="img/chocolate.jpg"/>
            <span>[완충포장]페레로 로쉐 초콜릿 42개입 대용량 선물 코스트코 2개</span>
        </div>
        <!-- //썸네일 박스 end -->

        <!-- 리뷰 내용 start -->
        <div id="reviewBox">
            <div class="grad_star star_box">
                <div class="inner_star star_box" style="width: 20%"></div>
            </div>
            <div id="review">
                <p>
                    맛이없어서 한입먹고 버렸습니다. 이런걸 음식이라고 파는것인가요?
                    매번 구매하는데이번엔 정말 실망입니다!!
                </p>
                <p>2021.02.14</p>
            </div>
            <div id="btnBox">
                <img class="uploadImg"  width="100px" height="100px" src="img/chocolate.jpg"/>
                <button class="update btn">수정</button>
                <button class="delete btn">삭제</button>
            </div>
        </div>
        <!-- // 리뷰 내용 end-->
    </li>
</script>
<!-- //템플릿 종료 -->
</body>
<script src="js/jquery.js"></script>
<script src="js/datepicker.min.js"></script>
<script src="js/datepicker.ko.js"></script>
<script src="js/underscore-min.js"></script>
<script>

    const myReviewTmpl=_.template($("#myReviewTmpl").html());
    const $myReview = $("#myReview");

    //템플릿 작동되나 확인하는 코드 추후에 지우시면 됩니다.
    $("#add").on("click",function () {

        $myReview.append(myReviewTmpl());
    });//button click end
    //템플릿 작동되나 확인하는 코드 추후에 지우시면 됩니다. end

        $("#datepickerStart, #datepickerEnd").datepicker({
            dateFormat: 'yyyy-mm-dd',
            language: 'ko',
            autoClose: true
        });

    let idx = 0;
    $("#date li").on("click", function () {

        $(".active").removeClass("active");

        // 2) 클릭한 그 li요소에 on 클래스를 더한다.
        $(this).addClass("active");

        idx = $(this).index();

        $(".tab").eq(idx).addClass("active");
    })

</script>
</html>