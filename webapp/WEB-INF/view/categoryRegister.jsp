<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>카테고리 등록</title>
    <link rel="stylesheet" href="/css/reset.css">
    <style>
        #wrap{
            width: 1100px;
            margin: auto;
        }
        body{
            font-family: "Noto Sans KR", sans-serif;
        }
        #wrap h1{
            font-weight: bold;
            font-size: 25px;
            margin-top: 75px;
            margin-bottom: 30px;
        }

        #imgFIle{
            width:150px;
            height:150px;
            outline: none;
            border:1px solid #424242;
        }
        #imgUpload{
            width:144px;
            height:144px;
            border-radius: 10px;
            font-size: 100px;
            text-align: center;
            line-height: 140px;
            cursor: pointer;
            float:left;
        }

        .imgBox{
            width:150px;
            height:150px;
            border-radius: 10px;
            margin-right: 30px;
            float:left;
            cursor: pointer;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2), 0 0 20px 0 rgba(0, 0, 0, 0.19);
        }
        .imgBox:hover{
            transform: scale(1.1);
        }
        .imgBox img{
            width:150px;
            height:150px;
        }
        .imgBoxList{
            display: inline-block;
        }
        #wrap h2{
            font-weight: bold;
            font-size: 20px;
            margin-top: 35px;
            margin-bottom: 10px;
        }
        #wrap #submit{
            width: 120px;
            height: 50px;
            margin-top: 35px;
            border: none;
            border-radius: 5px;
            background-color: #27AE60;
            color: #fff;
            font-family: "Noto Sans KR", sans-serif;
        }
        #categoryName{
            width: 400px;
            height: 40px;
            border-radius: 5px;
            border:1px solid #bebebe;

        }



    </style>
</head>
<body>
    <div id="wrap">
        <h1>카테고리 등록</h1>
        <ul class="imgBoxList">
            <li class="imgBox registerBtn">
                <input type="file" id="imgFIle" style="display:none;"/>
                <input  form="addContents" type="hidden" name="image" id="imageName"/>
                <label for="imgFIle" id="imgUpload">+</label>
            </li>
        </ul>

        <h2>카테고리 명</h2>
        <input id="categoryName" placeholder="내용을 입력해주세요" name="name"  form="addContents">
        <div>
            <button id="submit" form="addContents">제출</button>
        </div>
    </div>
    
<form id="addContents" action="/admin/category" method="post">
</form>

<script src="/js/jquery.js"></script>
<script>
    //이미지 파일 업로드
    $('#imgFIle').on("change",function() {

        const file = this.files[0];

        if (/^image\//.test(file.type)) {

            //multipart/form-data에 필요함
            const formData = new FormData();

            formData.append("image", file, file.name);
            formData.append("type", "B");//B는 board의 줄임말

            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url:"/ajax/uploadImage",
                processData : false,//multipart/form-data
                contentType : false,//multipart/form-data
                data : formData,//multipart/form-data
                type : 'POST',//multipart/form-data
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                	console.log(json);
                    $('#imgFIle').val("");
                    $(".imgBoxList label").css("display","none");
                    $("<img src='/img/"+json.image+"' />").insertBefore(".imgBoxList label");
                    $("#imageName").val(json.image);
                    console.log($("#imageName").val(json.image));
                    
                    //json.url;

                }
            });//$.ajax end

        } else {
            alert("이미지를 선택해주세요!");
        }
    });//#imgFile change() end

    $("html").on("click",".imgBoxList img",function () {
        $(".imgBoxList label").css("display","block");
        $(this).remove();
    });

</script>

</body>
</html>