<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL writingReview</title>
    <link rel="stylesheet" href="css/reset.css">
    <style>
        a:link {text-decoration: none;color:#27AE60;}
        a:visited{text-decoration: none;color:#27AE60;}
        #containerWritingReview{
            width:800px;
        }
        #writingReviewListBox{
            width: 750px;
            margin: auto;
        }
        .writing_review_columns{
            border-bottom: 1px solid #424242;
            position:relative;

        }
        #linkToWritableReviewPage{
            color:#27AE60;
            position: absolute;
            bottom:5px;
            right: 5px;
            text-decoration-color: #27AE60;
        }
        .writing_review_title{
            font-size: 20px;
            width: 150px;
        }
        .writing_review_arrival_date{
            margin: 20px 0px;
        }
        .writing_review_item_explain{
            position:relative;
        }
        .writing_review_item_image{
        }
        .writing_review_item_explain_text{
            position: absolute;
            top:0;
            left:150px;
            line-height: 50px;
        }
        .writing_review_item_count{
            margin: 0px 20px;
        }
        .writing_review_columns{
            padding: 20px;
        }
        .writing_review_main_text{
            position:relative;
            top:0px;
        }
        #writingReviewMainText{
            width: 500px;
            height:150px;
        }
        #writingReviewMainTextNum{
            text-align: right;
        }
        .horizon{
            display:inline-block;
            vertical-align: top;
        }
        #writingReviewUploadNoticeText{
            float:right;
            margin-right: 5px;
        }
        #writingReviewUploadImageList{
            width:330px;
            height: 130px;
            overflow: hidden;
        }
        .writing_review_upload_image{
            width:100px;
            height: 130px;
            margin:0px 5px;
            float:left;
        }
        .writing_review_upload_image_space{
            width: 98px;
            height: 98px;
            border: 1px solid #424242;
            background-size: cover;
            background-image: url("img/choco.png");
        }
        .writing_review_upload_image_delete_btn{
            width: 100px;
            height: 30px;
            line-height: 30px;
            text-align: center;
        }
        .writing_review_upload_image_delete_btn:hover{
            background-color: #27AE60;
            color:#fff;
        }
        #writingReviewSubmitBtnBox{
            text-align: center;
            padding: 20px;
        }
        #writingReviewSubmitBtn{
            border: none;
            background-color: #27AE60;
            color:#ffffff;
            outline: none;
            width: 100px;
            height: 30px;

        }
        #writingReviewSubmitBtn:hover{
            color:#27AE60;
            background-color: white;
            border: 1px solid #27AE60;
        }
        #writingReviewStarBox{
            width: 210px;
            height: 40px;
            overflow: hidden;
            position: absolute;
            top:10px;
            left:150px;
        }
        #writingReviewStarBox>div{
            float:left;
            width: 40px;
            height: 40px;
            background-image: url("img/starImage.png");
        }
        #writingReviewStarBox>div.star_on{
            background-position:0px 40px;
        }

        #writingReviewUploadImageCount{
            margin:0px 50px;
        }
        #writingReviewUploadImageInput{
            display:none;
        }
        #writingReviewUploadImageBtn{
            display: inline-block;
            padding: 10px 0px;
            background-color: #aaaaaa;
        }
    </style>
</head>
<body>
    <div id="containerWritingReview">
        <form method="post">
        <div id="writingReviewListBox">
            <ul id="writingReviewList">
                <li class="writing_review_columns">
                    <div class="writing_review_title">구매후기 쓰기</div>
                    <div id="linkToWritableReviewPage"><a href="">작성 가능 구매후기 보기</a></div>
                </li>
                <li class="writing_review_columns">
                    <div class="writing_review_arrival_date">2월14일 (일) 배송</div>
                    <div class="writing_review_item_explain">
                        <div class="writing_review_item_image">
                            <img src="img/choco.png" width="100" height="100">
                        </div>
                        <div class="writing_review_item_explain_text">
                            <div>[완충포장]페레로 로쉐 초콜릿 42개입 대용량 선물 코스트코</div>
                            <div><span class="writing_review_item_price">18,820원</span><span class="writing_review_item_count">2개</span></div>
                        </div>
                    </div>
                </li>
                <li class="writing_review_columns">
                    <div class="writing_review_title">
                        별점
                    </div>
                    <div id="writingReviewStarBox">
                        <input type="hidden" id="writingReviewStarPoint" name="starPoint" value="5"/>
                        <div class="writing_review_star_point star_on"></div>
                        <div class="writing_review_star_point star_on"></div>
                        <div class="writing_review_star_point star_on"></div>
                        <div class="writing_review_star_point star_on"></div>
                        <div class="writing_review_star_point star_on"></div>
                    </div>
                </li>
                <li class="writing_review_columns">
                    <div class="writing_review_title horizon">
                        구매후기
                    </div>
                    <div class="writing_review_main_text horizon">
                        <textarea id="writingReviewMainText" name="reviewText" placeholder="자세한 구매후기는 고객의 구매에 많은 도움이 됩니다."></textarea>
                        <p id="writingReviewMainTextNum">0</p>
                    </div>
                </li>
                <li class="writing_review_columns">
                    <div>
                        <div class="writing_review_title horizon">
                            사진첨부
                        </div>
                        <div class="horizon">
                            <input id="writingReviewUploadImageInput" name="uploadImage" type="file"/>
                            <label id="writingReviewUploadImageBtn" for="writingReviewUploadImageInput" >사진 첨부하기</label>
                            <span id="writingReviewUploadImageCount"> 0/3 </span>
                            <div id="writingReviewUploadNoticeText" >
                                <p>사진의 용량 20MB 이하로 JPG,PNG 형식</p>
                                <p>3개까지 등록 가능합니다</p>
                            </div>
                        </div>
                        <div id="writingReviewUploadImageListBox">
                            <ul id="writingReviewUploadImageList">

                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
            <input type="hidden" name="reviewImgArr"/>
            <div id="writingReviewSubmitBtnBox">
                <button id="writingReviewSubmitBtn">등록하기</button>
            </div>
        </div>
        </form>
    </div>
<script type="text/template" id="reviewUploadImageTmpl">
    <li class="writing_review_upload_image">
        <input class="writing_review_upload_image_url" name="imageUrl" type="hidden" value="<@=url@>"/>
        <div class="writing_review_upload_image_space">
            <img src="img/<@=url@>" width="98" height="98"/>
        </div>
        <div class="writing_review_upload_image_delete_btn">삭제</div>
    </li>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>
const $writingReviewStarBox = $("#writingReviewStarBox");
const $writing_review_star_point=$(".writing_review_star_point");
const $writingReviewStarPoint=$("#writingReviewStarPoint");
const $star_on=$(".star_on");
const $writingReviewUploadImageBtn = $("#writingReviewUploadImageBtn");
const $writingReviewUploadImageCount = $("#writingReviewUploadImageCount");
const $writing_review_upload_image_delete_btn = $(".writing_review_upload_image_delete_btn");

const $writingReviewUploadImageList=$("#writingReviewUploadImageList");
const $writing_review_upload_image=$(".writing_review_upload_image");
const $writingReviewUploadImageInput = $("#writingReviewUploadImageInput");
const reviewUploadImageTmpl = _.template($("#reviewUploadImageTmpl").html());

function imgCount(){
    let count=$(".writing_review_upload_image").length;
    if(count<3){
        $writingReviewUploadImageInput.removeAttr("disabled");
    }else{
        $writingReviewUploadImageInput.attr("disabled","disabled");
    }
    $writingReviewUploadImageCount.text(count+"/3");
}
//같은 이름 네임 모으기 함수들
function collectReviewImg() {
    let reviewImgLen = $("input[name=imageUrl]").length;
    //배열 생성
    let reviewImgArr = new Array(reviewImgLen);
    //배열에 값 주입
    for(let i=0; i<reviewImgLen; i++){
        reviewImgArr[i] = $("input[name=imageUrl]").eq(i).val();
    }
    $("input[name=reviewImgArr]").val(reviewImgArr);
}


$writing_review_star_point.on("click",function () {
    let idx=$(this).index();
    $star_on.removeClass("star_on");
    $writingReviewStarPoint.val(idx);
    for (i=0; i< idx; i++){
        $writing_review_star_point.eq(i).addClass("star_on");
    }
})

$(document).on('keyup', '#writingReviewMainText', function(){
   let textareaVal = $(this).val();
   let textareaLength= textareaVal.length;
   console.log(textareaLength);
    $("#writingReviewMainTextNum").text(textareaLength);
});



$writingReviewUploadImageInput.on("change",function () {
    const file = this.files[0];
    console.log(file);
    //image/ 로 시작하는
    if (/^image\//.test(file.type)) {
        //alert("여기에 오면 파일이 있고 사진임");
        //multipart/form-data에 필요함
        const formData = new FormData();
        formData.append("uploadImg", file, file.name);
        formData.append("type", "B");//B는 board의 줄임말
        //여기서 ajax로 파일 업로드 수행
        $.ajax({
            url:"ajax/uploadImage.json",
            processData : false,//multipart/form-data
            contentType : false,//multipart/form-data
            data : formData,//multipart/form-data
            type : 'POST',//multipart/form-data
            dataType : "json",
            error : function(xhr, error, code) {
                alert("에러:" + code);
            },
            success:function(json) {
                console.log(json.url);
                $writingReviewUploadImageList.append(reviewUploadImageTmpl({url:json.url}));
                imgCount();
            }
        });
    } else {
        alert("이미지를 선택해주세요!");
    }
});

$(document).on("click",".writing_review_upload_image_delete_btn",function () {
   $(this).parents(".writing_review_upload_image").remove();
   imgCount();
});
</script>
</body>
</html>