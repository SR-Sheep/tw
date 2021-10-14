<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 컨텐츠 등록</title>
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
            float: right;
        }
        #content h2{
            font-size: 30px;
            position: relative;
            top: 20px;
            left: 50px;
        }
        .input_box{
            margin-top: 30px;
            margin-left: 70px;
        }
        #contentstitle{
            width: 308px;
            padding: 5px;
        }
        #contentsText{
            width: 300px;
            height: 100px;
            resize: none;
            padding: 10px;
        }
        /*버튼 css*/
        .contents_btn_box{
            width: 930px;
            text-align: center;
        }
        .contents_btn{
            font-family: "Noto Sans KR", sans-serif;
            background-color: #ddd;
            border: 1px solid #ddd;
            font-size: 15px;
            cursor: pointer;
            outline: none;
            border-radius: 5px;
        }
        #content .contents_btn:hover{
            background-color: #27AE60;
            color: #fff;
        }
        #contentsRegisterBtn, #contentsUpdateBtn{
            width: 200px;
            margin: 50px auto 50px auto;
            padding: 10px;
        }
        #contentsDeleteBtn{
            width: 100px;
            float: right;
            padding: 5px 0;
        }
        /* //버튼 css */
        /*사진등록*/
        #imageRegisterWrap{
            height: 200px;
            margin-top: 60px;
            margin-left: 70px;
        }
        #imageBoxList{
            width: 1500px;
            height: 170px;
        }
        .imgBox{
            width:300px;
            height:150px;
            border-radius: 10px;
            /*margin-right: 30px;*/
            float:left;
            cursor: pointer;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2), 0 0 20px 0 rgba(0, 0, 0, 0.19);
            margin: 10px 10px 10px 11px;
            text-indent: 0;
        }
        .imgBox img{
            width:300px;
            height:150px;
            border-radius: 10px;
        }
        .imgBox i{
            position: relative;
            font-size: 30px;
            color: red;
            top: -140px;
            left: 260px;
            color: white;
            text-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2), 0 0 20px 0 rgba(0, 0, 0, 0.19);
        }
        .imgBox:hover{
            transform: scale(1.1);
        }
        #imgFile{
            width:150px;
            height:150px;
            outline: none;
            border:1px solid #424242;
        }
        #imgUpload{
            width:150px;
            height:150px;
            float: left;
            border:1px solid #BEBEBE;
            border-radius: 10px;
            font-size: 100px;
            text-align: center;
            line-height: 140px;
            cursor: pointer;
            left: 0;
            margin: 10px 5px;
            color: #BEBEBE;
            text-indent: 0;
        }
        #imgUpload:hover{
            transform: scale(1.01);
        }
        /* //사진등록 */
        .input_label{
            display: block;
            margin-bottom: 5px;
            cursor: pointer;
        }
        /*검색관련*/
        #searchBox{
            text-align: right;
            height: 50px;
            margin-top: 20px;
        }
        .fa-search{
            font-size: 15px;
            border-top: 1px solid #bebebe;
            border-right: 1px solid #bebebe;
            border-bottom: 1px solid #bebebe;
            position: relative;
            color: #424242;
            padding: 7px 5px 7px 5px;
            /*margin: 10px 0 0 0;*/
        }
        #content input, #content textarea{
            border: 1px solid #bebebe;
            font-family: "Noto Sans KR", sans-serif;
            outline: none;
        }
        #searchInput{
            padding: 5px;
        }
        .search_input_label{
            cursor: pointer;
        }
        /* //검색관련 */
        /*테이블 관련 css*/
        .item_list_table{
            /*border: 1px solid #424242;*/
            width: 800px;
            text-align: center;
            margin: 30px auto;
            /*margin-right: auto;*/
            /*margin-left: auto;*/
        }
        .item_list_table.choice{
            margin-top: 120px;
        }
        .item_list{
            width: 870px;
        }
        .item_list_table th{
            padding: 15px 20px;
        }
        .item_list_table td{
            padding: 15px;
        }
        .item_list_table th, .item_list_table tr {
            border: 1px solid #424242;
        }
        /*테이블 링크 이동*/
        .item_list_table tbody tr:hover {
            background-color: #27AE60;
        }
        .item_list_table td:hover {
            cursor: pointer;
        }
        /*테이블 이미지 요소 크기*/
        .item_list_table td img {
            width: 80px;
            height: 60px;
        }
        .remove_btn, .add_btn{
            font-family: "Noto Sans KR", sans-serif;
            background-color: #ddd;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
            padding: 5px 10px;
        }
        .table_name{
            font-size: 18px;
            position: relative;
            top: -10px;
            left: -330px;
        }
        .table_name.choice{
            left: -290px;
        }
        .td_text_name{
            width: 220px;
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
                <li class="admin_header_nav_item"> <a href="/"> 컨텐츠등록 </a></li>
                <li class="admin_header_nav_item"> <a href="/"> 카테고리등록 </a></li>
            </ul>
        </div><!--adminHeader end-->
        <!--관리자 사이드바-->
        <div class="admin_side_bar">
            <ul>
                <li class="admin_side_bar_list"> <a href="/"> 상품관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/"> 유저관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/"> 컨텐츠관리 </a></li>
                <li class="admin_side_bar_list"> <a href="/"> 배송관리 </a></li>
            </ul>
        </div><!--sideBar end-->
        <div id="content"><!--#content-->
            <h2>컨텐츠 등록</h2>
            <form action="" method="post">
                <button id="contentsDeleteBtn" class="contents_btn">컨텐츠 삭제</button>
                <div id="imageRegisterWrap">  &nbsp; &nbsp; 컨텐츠 이미지 등록 <br>
                    <ul id="imageBoxList">
                        <li>
                            <input type="file" id="imgFile" style="display:none;">
                            <label for="imgFile" id="imgUpload">+</label>
                        </li>
                    </ul>
                </div>
                <div class="input_box title">
                    <label class="input_label" for="contentstitle">제목</label>
                    <input id="contentstitle" name="" value="" placeholder="제목을 입력해주세요" />
                </div>
                <div class="input_box text">
                    <label class="input_label" for="contentsText">한 줄 소개</label>
                    <textarea id="contentsText" name="" value="" placeholder="내용을 입력해주세요"></textarea>
                </div>
                <div id="searchBox">
                    <input id="searchInput" name="" value="" placeholder="검색어를 입력하세요"><!--
                    --><label class="search_input_label" for="searchInput"><i class="fas fa-search"></i></label>
                </div>
                <div class="item_list_table">
                    <span class="table_name">전체 상품리스트</span>
                    <table class="item_list" border="1">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품명</th>
                                <th>상품이미지</th>
                                <th>판매가</th>
                                <th>재고 수량</th>
                                <th>구매 건수</th>
                                <th>상태변경</th>
                            </tr>
                        </thead>
                        <tbody id="basicItemList">

                        </tbody>
                    </table>
                </div><!-- //#basicItemListTable end -->
                <div class="item_list_table choice">
                    <span class="table_name choice">컨텐츠에 등록할 상품리스트</span>
                    <table class="item_list" border="1">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상품명</th>
                                <th>상품이미지</th>
                                <th>판매가</th>
                                <th>재고 수량</th>
                                <th>구매 건수</th>
                                <th>상태변경</th>
                            </tr>
                        </thead>
                        <tbody id="chooseItemList">

                        </tbody>
                    </table>
                </div>
                <div class="contents_btn_box">
                <button id="contentsRegisterBtn" class="contents_btn">등록하기</button>
                <button id="contentsUpdateBtn" class="contents_btn">수정하기</button>
                </div>
            </form>
        </div><!--//#content-->
    </div><!--//#wrap-->
<script type="text/template" id="itemListTmpl">
    <@ let i = 0;
        _.each(itemList,function(list){
        i++;
    @>
    <tr class="tr<@=i@>" data-no="<@=list.no@>">
        <td><span class="td_text td_text_no">1</span></td>
        <td><span class="td_text td_text_name"><@=list.name@></span></td>
        <td class="td_img">
            <img src="/img/<@=list.image@>">
        </td>
        <td><span class="td_text">40,000원</span></td>
        <td><span class="td_text">100</span></td>
        <td><span class="td_text">50</span></td>
        <td>
            <button type="button" data-no="<@=list.no@>" class="add_btn">추가</button>
        </td>
    </tr>

    <@
    })
    @>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    //전체 상품 템플릿
    const basicItemListTmpl = _.template($("#itemListTmpl").html());
    //이미지 input 요소
    const $imgFile = $("#imgFile");
    //이미지 업로드 라벨
    const $imgUpload = $("#imgUpload");
    //검색 input 요소
    const $searchInput = $("#searchInput");
    //전체 상품 리스트(템플릿 붙이는 곳)
    const $basicItemList = $("#basicItemList");
    //선택된 상품 리스트를 붙이는 tbody
    const $chooseItemList = $("#chooseItemList");

    
    
    //선택된 상품 리스트 만들기
    /*
    21.03.04 18:25 김기현 수정
    */
    $("html").on("click","#basicItemList tr .add_btn",function () {
        let jsonList = null;
        $.ajax({
            url:"/ajax/itemList.json",
            dataType:"json",
            Type:"GET",
            async:false,
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                jsonList = json;
            }
        })//ajax() end
        //console.log(jsonList);
        //console.log(jsonList[2].no);
        //전체 상품 리스트의 번호 선언(json에서 해당 번호 대입해주기 위해)
        let listIndex = 0;
        //추가할 상품 리스트 번호(전체에서 추가버튼 누른 번호)
        const chooseNo = $(this).attr("data-no");
        $(jsonList).each(function (idx) {
            if(chooseNo==jsonList[idx].no){
                //console.log(jsonList[idx])
                listIndex = idx;
            }
        });
        //console.log(listNo);
        //json의 값을 가져오기 위해 index 지정
        //console.log($(this).attr("data-no"));
        //console.log($(this).parent().parent())
        //console.log($("#chooseItemList").length)
        //console.log(jsonList[itemListIdx].image)
        const chooseItemListSize = $("#chooseItemList").find(".td_text_name").length;
        //선택된 아이템 리스트들의 임의 번호(데이터베이스의 no 아님 -> 순서대로 설정)
        let chooseItemListNo = 0;
        //console.log($("#chooseItemList"));
        for (let i = 0;chooseItemListSize>i;i++){
            if($("#chooseItemList .td_text_no").eq(i).text()==chooseNo){
                chooseItemListNo = -1;
                alert("해당상품이 이미 등록되었습니다.");
                break;
            }
            chooseItemListNo = 1;
        }
        //console.log(chooseItemListNo);
        if(chooseItemListNo!=-1){
        const chooseItemList = $("#chooseItemList .td_text_no").eq(0).text();
            //전체상품리스트json의 데이터를 넣어서 tr 만들어서 붙이기
            $chooseItemList.append($("<tr data-no="+chooseNo+"><td><span class='td_text td_text_no'>"+chooseNo+"</span></td>\n" +
                "        <td><span class=\"td_text td_text_name\">"+jsonList[listIndex].name+"</span></td>\n" +
                "        <td class=\"td_img\">\n" +
                "            <img src=\"/img/"+jsonList[listIndex].image+"\">\n" +
                "        </td>\n" +
                "        <td><span class=\"td_text\">40,000원</span></td>\n" +
                "        <td><span class=\"td_text\">100</span></td>\n" +
                "        <td><span class=\"td_text\">50</span></td>\n" +
                "        <td>\n" +
                "            <button type=\"button\" data-no=\"<@=list.no@>\" class=\"remove_btn\">제거</button>\n" +
                "        </td>\n" +
                "    </tr>"))
        }//if end
    })
    //선택 된 상품리스트에서 제거하기
    $("html").on("click",".remove_btn",function () {
        $(this).parent().parent().remove();
    })
    //전체 상품리스트 ajax
    function getBasicItemList(){
        $.ajax({
            url:"/ajax/itemList.json",
            dataType:"json",
            Type:"GET",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
                $basicItemList.html(basicItemListTmpl({"itemList":json}));
            }
        })//ajax() end
    }//getSearchList() end
    getBasicItemList();

    //이미지 업로드 ajax
    $imgFile.on("change",function() {

        const file = this.files[0];

        if (/^image\//.test(file.type)) {

            //alert("여기에 오면 파일이 있고 사진임");

            //multipart/form-data에 필요함
            const formData = new FormData();

            formData.append("uploadImg", file, file.name);
            formData.append("type", "B");//B는 board의 줄임말

            //여기서 ajax로 파일 업로드 수행
            $.ajax({
                url:"/ajax/uploadImage.json",
                processData : false,//multipart/form-data
                contentType : false,//multipart/form-data
                data : formData,//multipart/form-data
                type : 'POST',//multipart/form-data
                dataType : "json",
                error : function(xhr, error, code) {
                    alert("에러:" + code);
                },
                success:function(json) {
                    $("<li class='imgBox'><img src='"+json.url+"' /><i class=\"fas fa-times\"></i></li>").insertBefore("#imageBoxList li:last");
                    //json.url;
                    //$("#imgUpload").css("margin","10px 30px")
                    //이미지 업로드 1개 하면 업로드 버튼 안보이도록
                    // const $imgFIle = $(this).parent().find("#imgFIle");
                    // let imgListNum = $imgFIle.length;
                    let imgBoxNum = $(".imgBox").length;
                    console.log(imgBoxNum)
                    if(imgBoxNum>=1) {
                        $imgUpload.css("display","none");
                    }//if end
                    //선택한 이미지 삭제하도록
                    $(".imgBox").click(function () {
                        $(this).remove();
                        $(".imgBox").val("");
                        if (imgBoxNum<6) {
                            $imgUpload.css("display", "block");
                        }//if end
                    })//.imgbox.click end
                }//success end
            });//ajax end
        }//if end
    });//change end

    //상품 검색하기
    $searchInput.on("keyup",function () {
        //검색어 얻어오기
        let searchText = $(this).val();
        //console.log(searchText)
        const listSize = $("html").find(".td_text_name").length;
        //console.log($("html").find(".td_text_name").attr("data-no"));
        //console.log($("html").find(".td_text_name").text().indexOf(searchText))

        if(searchText!=null){
            for(let i=0 ; listSize>i ; i++) {
                //console.log($(".td_text_name").eq(i).text().indexOf(searchText))
                //검색어 얻어온 게 각 상품명에 없으면 display none, 있으면 원래대로
                if($(".td_text_name").eq(i).text().indexOf(searchText)==-1){
                    $(".tr"+(i+1)+"").css("display","none");
                } else{
                    $(".tr"+(i+1)+"").css("display","revert");	
                }
            }
        } else{
            $(".tr").css("display","revert")
        }

        //console.log(searchText);
    })
</script>
</body>
</html>