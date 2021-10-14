<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품 리스트</title>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/notosanskr.css"/>
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <style>
        #productListTable {
            border-collapse: collapse;
            width:800px;
            margin:50px;
            font:14px;
        }
        #contentsTitle{
        	font-size: 24px;
        	margin: 20px 40px;
        }
        #productSearchBox{
        	vertical-align: middle;
        }
        #productSearchInput{
        	width: 300px;
        	height:30px;
        	margin-bottom:50px;
        	border-radius: 5px;
        	outline:none;
        }
        #productListTable th,#productListTable td {
            padding: 8px 12px;
            font-size:14px;
            border:1px solid #424242;
        }
        #productListTable tbody td{
        	border: none;
        	vertical-align: middle;
        	text-align:center;
        }
        #productListTable tbody tr{
        	border-bottom:1px solid #424242;
        }
        #filterBox{
        	width:800px;
        	text-align: center;
        	margin:auto 50px;
        	background-color: red;
        	margin-bottom:50px;
        }
        #dueBtnBox{
        	margin-bottom:30px;
        }
        
        
        
        #producteleteBtn{
        	width:60px;
        	height:30px;
        	border-radius:5px;
        	outline:none;
        	background-color:#fff;
        	border:1px solid #27AE60;
        	color: #27AE60;
        }
        #productSearchBtn, .deleteBtn:hover{
       		background-color:#27AE60;
        	color:#fff;
        }
        /*라디오인풋+라벨 CSS */
        input[type=radio]{
        	display:none;
        }
        /* +: 다음요소 선택자*/
        input[type=radio] + label {
            display:inline-block;
            width: 50px;
            height: 20px;
            cursor:pointer;
            user-select:none;
            text-align: center;
            border-radius: 4px;
            line-height: 20px;
            background-color: #cccccc;
            color: grey;
            font-weight:700;
            margin: 5px;
        }
        input[type=radio] + label:hover{
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        input[type=radio]:checked + label{
            color: #27AE60;
            background-color: #27AE60;
            color: white;
        }
        
         img.ui-datepicker-trigger {
                margin-left:5px; vertical-align:middle; cursor:pointer;
                display:none;
		}



    </style>

</head>
<body>
	<div id="contentsBox">
		<h1 id="contentsTitle">상품 리스트</h1>
	    <div id="filterBox">
	    	<div id="productSearchBox">
	    		<input id="productSearchInput" name="keyword" placeholder="상품을 검색해주세요"> <button  id="productSearchBtn" type=button><i class="fas fa-search"></i></button>
	    	</div>
		    <div id="dueBtnBox">
			    <input id="week" type="radio" name="due"  checked="checked">
			    <label for="week" class="due_tmpl"  data-no="7">1주일</label>
			    <input id="month" type="radio" name="due" >
			    <label for="month" class="due_tmpl" data-no="30" >1개월</label>
			    <input id="threeMonth" type="radio" name="due" >
			    <label for="threeMonth" class="due_tmpl"  data-no="90">3개월</label>
			    <input id="sixMonth" type="radio" name="due" value="180">
			    <label for="sixMonth" class="due_tmpl" data-no="180">6개월</label>
			    <input id="year" type="radio" name="due" value="365">
			    <label for="year" class="due_tmpl" data-no="365" >1년</label>
			    <label for="fromDate"></label>
		        <input type="text" name="fromDate" id="fromDate">
		          ~
		        <label for="toDate"></label>
		        <input type="text" name="toDate" id="toDate">
		    </div>
	    </div>
	    <table id="productListTable" border="1">
	        <thead>
	            <tr>
	                <td>번호</td>
	                <td>상품명</td>
	                <td>상품이미지</td>
	                <td>판매가</td>
	                <td>재고 수량</td>
	                <td>구매 건수</td>
	                <td>상태변경</td>
	            </tr>
	        </thead>
	        <tbody>
	        <tr>
	            <td colspan="7">상품명을 검색하세요.</td>
	        </tr>
	        <tr>
	        	<td>1</td>
	        	<td>상품명</td>
	        	<td><img src="/img/choco.jpg" width="100" height="100"/></td>
	        	<td>40000원</td>
	        	<td>100</td>
	        	<td>50</td>
	        	<td><button class="deleteBtn">삭제</button></td>
	        </tr>
	        </tbody>
	    </table>
	</div>
<script type="text/template" id="productTmpl">
        <@_.each(products,function(product){@>
            <tr>
	        	<td><@=product.no @></td>
	        	<td><@=product.name @></td>
	        	<td><img src="/img/<@=product.representImg @>" width="100" height="100"/></td>
	        	<td><@=product.price @>원</td>
	        	<td><@=product.stock @></td>
	        	<td><@=product.saleCount @></td>
	        	<td><button class="deleteBtn" data-no="<@=product.no @>">삭제</button></td>
	        </tr>
        <@})@>
</script>    

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src=/js/moment-with-locales.js/>
<!-- datepicker 한국어로 -->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
let today = moment();
let defaultDay = moment().subtract(7, 'days'); 
const $due_tmlp = $(".due_tmpl");
const $getBtn = $("#getBtn");
const $productSearchInput=$("#productSearchInput");

const $productTmpl= _.template($("#productTmpl").html());
const $fromDate =$("#fromDate");
const $toDate =$("#toDate");
$fromDate.val(defaultDay.format('YYYY-MM-DD'));
$toDate.val(today.format('YYYY-MM-DD'));


$(function() {
    
    //오늘 날짜를 출력
    $("#today").text(new Date().toLocaleDateString());

    //datepicker 한국어로 사용하기 위한 언어설정
    $.datepicker.setDefaults($.datepicker.regional['ko']); 
    
    // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
    // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

    //시작일.
    $('#fromDate').datepicker({
        showOn: "both",                     // 달력을 표시할 타이밍 (both: focus or button)
        buttonImage: "", // 버튼 이미지
        buttonImageOnly : true,             // 버튼 이미지만 표시할지 여부
        buttonText: "날짜선택",             // 버튼의 대체 텍스트
        dateFormat: "yy-mm-dd",             // 날짜의 형식
        changeMonth: true,                  // 월을 이동하기 위한 선택상자 표시여부
        //minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
        onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#toDate").datepicker( "option", "minDate", selectedDate );
        }                
    });

    //종료일
    $('#toDate').datepicker({
        showOn: "both", 
        buttonImage: "", 
        buttonImageOnly : true,
        buttonText: "날짜선택",
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        //minDate: 0, // 오늘 이전 날짜 선택 불가
        onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#fromDate").datepicker( "option", "maxDate", selectedDate );
        }                
    });
});

	$due_tmlp.on("click",function(){
		let due=$(this).data("no");
		console.log(moment().subtract(due, 'days').format('YYYY-MM-DD'));
		$('#fromDate').val(moment().subtract(due, 'days').format('YYYY-MM-DD'));
		console.log(today.format('YYYY-MM-DD'));
		 $('#toDate').val(today.format('YYYY-MM-DD'));
	});


    $("#productSearchBtn").click(function () {
    	let data;
		let keyword = $productSearchInput.val().replace(/\s{2,}/g," ");
	    let keywords=keyword.split(" ");
		let fromDate= $('#fromDate').val();
        let toDate=$('#toDate').val();
        console.log(keywords);
        console.log(fromDate);
        if(fromDate!=""){
        	data={
    				"keywords":keywords,
    				"fromDate":fromDate,
    				"toDate":toDate
    		}
			
	        $.ajax({
	            url:"/admin/gift",
	            data:data,
				dataType : "json",
	            error:function(){
	                alert("서버 점검중!");
	            },
	            success:function (json) {
					console.log(json)
	                //tr전부 비우기
	                $("#productListTable tbody").empty();
					$("#productListTable tbody").append($productTmpl({products:json.products}));
	
	            }//success end
	        });//$.ajax() end
        }
    });//#getBtn click() end
</script>
</body>
</html>