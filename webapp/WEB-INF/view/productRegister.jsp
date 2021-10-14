<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>선:MALL productRegister</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/all.min.css">
<link rel="stylesheet" href="/css/tui-date-picker.min.css" />
<style>
#productRegisterContainerTitle {
	font-size: 24px;
	margin: 10px 0px;
}

#productRegisterContainer {
	width: 800px;
	/*border: 1px solid #424242;*/
	margin: 0px 50px;
}

#productRegisterCategoryListBox {
	width: 600px;
	min-height: 200px;
	margin-left: 100px;
}

.product_register_columns {
	/*background-color: lavender;*/
	position: relative;
}

.product_register_columns_large_title {
	width: 200px;
	font-size: 24px;
	font-weight: bold;
	height: 60px;
	line-height: 60px;
}

.essential_expression {
	color: #AD443D;
	line-height: 60px;
	font-size: 15px;
	/*background-color: #27AE60;*/
}

.title_inline {
	display: inline-block;
}

.border {
	width: 600px;
	height: 1px;
	background-color: #424242;
}

.toggle_box, .toggle_title {
	position: relative;
	/*background-color: red;*/
	display: inline-block;
}

.product_register_columns_title {
	width: 200px;
	font-size: 18px;
	font-weight: bold;
	line-height: 60px;
	margin-left: 10px;
}

.toggle {
	vertical-align: middle;
}

.toggle input {
	display: none;
}

.toggle span {
	display: inline-block;
	width: 200px;
	height: 40px;
	border-radius: 4px;
	background-color: #bbb;
	cursor: pointer;
	transition: .2s ease;
}

.toggle span::after {
	content: "설정함";
	display: inline-block;
	width: 100px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	position: absolute;
	top: 0;
	left: 100px;
	transition: .05s ease;
}

.toggle input:checked+span::after {
	content: "설정안함";
	left: 0;
}

.toggle span::before {
	content: "설정안함";
	color: #fff;
	display: block;
	width: 100px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	border-radius: 4px;
	background-color: #27AE60;
	transition: .2s ease;
}

.toggle input:checked+span::before {
	content: "설정함";
	transform: translateX(100px);
}

.toggle #deliveryToggle::after {
	content: "예약배송";
}

.toggle input:checked+#deliveryToggle::after {
	content: "즉시배송";
}

.toggle #deliveryToggle::before {
	content: "즉시배송";
}

.toggle input:checked+#deliveryToggle::before {
	content: "예약배송";
}

#productRegisterName, #productRegisterPrice,
	#productRegisterDiscountRate {
	width: 250px;
	height: 30px;
	line-height: 30px;
	font-size: 18px;
}

#productRegisterDiscountRate+span {
	font-size: 20px;
	line-height: 30px;
}

#representImgBtn, #productRegisterAddImgBtn,
	#productRegisterDetailImgBtn {
	width: 100px;
	height: 100px;
	font-size: 30px;
	line-height: 100px;
	text-align: center; background-color : #aaaaaa;
	margin: 5px;
	background-image: url("/img/plusImg.png");
	background-size: cover;
	background-position: center;
	display: inline-block;
	background-color: #aaaaaa;
}

#productRegisterDetailImgBox {
	width: 598px;
	height: 298px;
	border: 1px solid #424242;
	overflow-y: auto;
	margin: 5px;
}

#productRegisterCategoryList {
	width: 600px;
}

input[type=checkbox] {
	display: none;
}
/*라디오인풋+라벨 CSS */
/* +: 다음요소 선택자*/
input[type=checkbox]+label {
	display: inline-block;
	width: 120px;
	height: 40px;
	cursor: pointer;
	user-select: none;
	text-align: center;
	border-radius: 4px;
	line-height: 40px;
	background-color: #cccccc;
	color: grey;
	font-weight: 700;
	margin: 10px;
}

#productRegisterAddCategoryBtn {
	width: 120px;
	height: 40px;
	cursor: pointer;
	user-select: none;
	text-align: center;
	border-radius: 4px;
	line-height: 40px;
	background-color: #aaaaaa;
	margin: 10px;
}

#productRegisterAddCategoryBtn:hover {
	background-color: #27AE60;
	color: #fff;
}

input[type=checkbox]+label:hover {
	box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

input[type=checkbox]:checked+label {
	color: #27AE60;
	background-color: #27AE60;
	color: white;
}

#productRegisterDeliveryBtnBox {
	margin-left: 200px;
}

#productRegisterOptionList {
	width: 500px;
	min-height: 100px;
	border: 1px solid #424242;
}

#discountDetailBox.active {
	display: block;
}

#discountDetailBox {
	display: none;
}

#productRegisterNameLen {
	margin-left: 20px;
}

#reloadBtn:hover {
	color: #27AE60;
}

.inactive {
	display: none;
}

#productRegisterAddImgBtn.inactive, #productRegisterDetailImgBtn.inactive
	{
	display: none;
}

.add_image, .detail_image {
	width: 100px;
	height: 100px;
	margin: 5px;
	display: inline-block;
	background-size: cover;
	background-position: center;
}

#productRegisterSubmitBtnBox {
	width: 100%;
	text-align: center;
}

#productRegisterSubmitBtn {
	width: 40%;
	height: 40px;
	background-color: #cccccc;
	color: grey;
	font-size: 24px;
	margin: 5px;
}

#productRegisterSubmitBtn:hover {
	background-color: #27AE60;
	color: white;
}

.option_text, .option_count {
	width: 200px;
}

.product_register_option {
	width: 450px;
	margin: 5px;
}

.datepicker_box {
	position: relative;
	width: 551px;
	height: 353px;
	margin-left: 200px;
	/*margin:-171.5px 0 0 -274px;*/
}

.start_datepicker_box {
	width: 274px;
	height: 353px;
	float: left;
}

.end_datepicker_box {
	width: 274px;
	height: 353px;
	float: right;
}

#startpicker-input {
	display: none;
}

#startpicker-container {
	display: block;
}

#endpicker-input {
	display: none;
}

#endpicker-container {
	display: block;
}

.tui-datepicker {
	border: none;
}

.tui-has-focus {
	width: 0;
	height: 0;
}

.tui-datepicker-input {
	position: relative;
	width: 0;
	height: 0;
}

.tui-datepicker-input>input {
	display: none;
}

.tui-ico-date {
	display: none;
}
</style>
</head>
<body>
	<div id="productRegisterContainer">
		<div class="product_register_columns">
			<h2 id="productRegisterContainerTitle"
				class="product_register_columns_large_title title_inline">
				상품등록<span class="essential_expression"><i
					class="fas fa-circle"></i>필수항목</span>
			</h2>
		</div>
		<div id="productRegisterFormBox">
			<form method="post" action="/admin/product">
				<div class="product_register_columns">
					<div class="product_register_columns_large_title title_inline">
						카테고리 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<span id="reloadBtn"><i class="fas fa-sync-alt"></i></span>
				</div>
				<div id="productRegisterCategoryListBox">
					<ul id="productRegisterCategoryList">
						<c:forEach items="${categories }" var="category">
							<li class="product_register_category title_inline">
								<input id="category${category.no }" type="checkbox" name="category" class="product_register_category_input" /> 
								<label class="product_register_category_text" for="category${category.no }">${category.name}</label>
								<input type="hidden" name="categoryNo" value="${category.no }"/>
							</li>
						</c:forEach>
						<li id="productRegisterAddCategoryBtn" class="title_inline"><a
							href="/admin/category">카테고리 추가</a></li>
					</ul>
				</div>
				<div>
					<div class="product_register_columns_large_title title_inline">
						상품명 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<input name="name" placeholder="내용을 입력해주세요"
						id="productRegisterName" oninvalid="상품명을 입력해주세요" required/><span id="productRegisterNameLen">0/30</span>
				</div>
				<div class="product_register_columns_large_title">
					판매가 <span class="essential_expression"><i
						class="fas fa-circle"></i></span>
				</div>
				<div class="border"></div>
				<div>
					<div class="product_register_columns_title title_inline">
						판매가 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<input name="price" placeholder="내용을 입력해주세요"
						id="productRegisterPrice" oninvalid="가격을 입력해주세요" required/>
				</div>
				<div class="discount_toggle">
					<div class="product_register_columns">
						<div class="product_register_columns_title toggle_title">할인</div>
						<div class="toggle_box">
							<label class="toggle"> 
							<%-- 토클버튼 --%> 
							<input id="productRegisterDiscountInput" type="checkbox" name="open">
								<span id="discountToggle"></span></input> 
							<%-- 토글버튼 end --%>
							</label>
						</div>
					</div>
					<div id="discountDetailBox" class="product_register_columns off">

						<%-- 할인율 및 기간 설정하는 tmpl들어오는곳 --%>

						<%-- --%>

					</div>
				</div>
				<div>
					<div class="product_register_columns_large_title">
						상품이미지 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<div class="product_register_columns_title">
						대표이미지 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<input type="file" class="inactive" id="productRegisterRepresentInput" name="representImg"> 
					<input type="hidden" id="productRegisterRepresentImg">
					<div id="representImgBtn"></div>
					<div class="product_register_columns_title">추가이미지</div>
					<input type="file" id="productRegisterAddInput" class="inactive">
					<div id="productRegisterAddImgBox">
						<ul id="productRegisterAddImgList">
							<li id="productRegisterAddImgBtn"></li>
						</ul>
					</div>
					<div class="product_register_columns_large_title">
						상세설명 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<input type="file" id="productRegisterDetailInput" class="inactive">
					<div id="productRegisterDetailImgBox">
						<ul id="productRegisterDetailImgList">
							<li id="productRegisterDetailImgBtn"></li>
						</ul>
					</div>
				</div>
				<div>
					<div class="product_register_columns_large_title">
						재고옵션 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<div>
						<input name="stock" required/> 개
					</div>
				</div>
				<div>
					<div class="product_register_columns_title">옵션</div>
					<div>
						<input id="numberOfOption" />
						<button id="productRegisterOptionSetting" type="button">설정</button>
					</div>
					<div>
						<ul id="productRegisterOptionList">
							<li class="product_register_option"></li>
						</ul>
					</div>
				</div>
				<div>
					<div class="product_register_columns_large_title">
						배송 <span class="essential_expression"><i
							class="fas fa-circle"></i></span>
					</div>
					<div class="product_register_columns">
						<div class="product_register_columns_title toggle_title">
							배송속성 <span class="essential_expression"><i class="fas fa-circle"></i></span>
						</div>
						<div class="toggle_box">
							<label class="toggle"> 
								<input type="checkbox" id="deliveryToggleChk"> 
								<span id="deliveryToggle"></span>
								<input type="hidden" name="deliveryType" id="deliveryType" value="B"> 
							</label>
						</div>
					</div>
					<div>
						<div class="product_register_columns_title title_inline">
							배송비 <span class="essential_expression"><i
								class="fas fa-circle"></i></span>
						</div>
						<input id="productRegisterDeliveryPrice" name="deliveryPrice" value="0"/>
					</div>
					<div id="productRegisterDeliveryBtnBox">
						<button type="button" class="delivery_price_option">10000</button>
						<button type="button" class="delivery_price_option">20000</button>
						<button type="button" class="delivery_price_option">50000</button>
					</div>
					<div>
						<div class="product_register_columns_title title_inline">배송옵션</div>
						<input id="deliveryOption" name="deliveryOption" value="0"/>
					</div>
				</div>
				<div id="productRegisterSubmitBtnBox">
					<button id="productRegisterSubmitBtn">등록</button>
				</div>
				<input name="saleCount" type="hidden" value="0" /> 
				<input name="categoryArr" type="hidden" /> 
				<input name="addImgArr" type="hidden" /> <input name="detailImgArr" type="hidden" /> 
				<input name="optionTextArr" type="hidden" /> 
				<input name="optionCountArr" type="hidden" />
			</form>
		</div>
	</div>
	
	<script type="text/template" id="discountDetailBoxTmpl">
	<%-- 템플릿으로 뽑아놓고 버튼클릭시 삽입 해제하면 remove시키기 --%>
	<div class="product_register_columns_title title_inline">할인율</div>
		<input name="discountRate" placeholder="내용을 입력해주세요" id="productRegisterDiscountRate"/><span>%</span>
			<div class="datepicker_box">
				<div class="start_datepicker_box">
					<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
					<input id="startpicker-input" name="startDate" type="text" aria-label="Date">
					<span class="tui-ico-date"></span>
					<div id="startpicker-container"></div>
					</div>
				</div>
				<div class="end_datepicker_box"></div>
				<div class="tui-datepicker-input tui-datetime-input tui-has-focus">
				<input id="endpicker-input" name="endDate" type="text" aria-label="Date">
				<span class="tui-ico-date"></span>
			<div id="endpicker-container"></div>
		</div>
	</div>
	<%-- //할인율 템플릿 end --%>    
    </script>
	
	<script type="text/template" id="categoryTmpl">
        <@_.each(categories,function(category){@>
            <li class="product_register_category title_inline">
                <input id="category<@=category.no @>" type="checkbox" name="category" class="product_register_category_input" />
                <label class="product_register_category_text" for="category<@=category.no @>"><@=category.name @></label>
            </li>
        <@})@>
    </script>
	<script type="text/template" id="optionTmpl">
        <li class="product_register_option">
            <input class="option_text" name="optionText" placeholder="옵션 이름을 입력해주세요"/> <input class="option_count" name="optionCount" placeholder="옵션 개수를 입력해주세요"/> 개
        </li>
    </script>

	<script src="/js/jquery.js"></script>
	<script src="/js/tui-date-picker.min.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
		let today = new Date();
		let nextMonth = new Date();
		nextMonth.setMonth(today.getMonth(), 1);
		let picker = null;
	 
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
		//배송가격옵션템플릿 요소
		const $delivery_price_option = $(".delivery_price_option");
		// 배송 가격 인풋
		const $productRegisterDeliveryPrice = $("#productRegisterDeliveryPrice");
		//할인 여부 체크박스
		const $productRegisterDiscountInput = $("#productRegisterDiscountInput");
		//할인 상세 박스
		const $discountDetailBox = $("#discountDetailBox");
		//상품명 input
		const $productRegisterName = $("#productRegisterName");
		//상품명 이름 길이 표기 text
		const $productRegisterNameLen = $("#productRegisterNameLen");
		//카테고리 리로드 버튼
		const $reloadBtn = $("#reloadBtn");
		//카테고리 리스트
		const $productRegisterCategoryList = $("#productRegisterCategoryList");
		//대표 이미지 인풋
		const $productRegisterRepresentImg = $("#productRegisterRepresentImg");
		//추가 이미지 리스트
		const $productRegisterAddImgList = $("#productRegisterAddImgList");
		//대표 이미지 파일 업로드
		const $productRegisterRepresentInput = $("#productRegisterRepresentInput");
		//추가 이미지 파일 업로드
		const $productRegisterAddInput = $("#productRegisterAddInput");
		//상세 설명 이미지 업로드
		const $productRegisterDetailInput = $("#productRegisterDetailInput");
		//대표 이미지 업로드 버튼
		const $representImgBtn = $("#representImgBtn");
		//추가이미지 업로드 버튼
		const $productRegisterAddImgBtn = $("#productRegisterAddImgBtn");
		//상세 설명 이미지 버튼
		const $productRegisterDetailImgBtn = $("#productRegisterDetailImgBtn");
		//카테고리 템플릿
		const $categoryTmpl = _.template($("#categoryTmpl").html());
		//옵션 템플릿
		const $optionTmpl = _.template($("#optionTmpl").html());
		//옵션 세팅 버튼
		const $productRegisterOptionSetting = $("#productRegisterOptionSetting");
		//옵션 숫자
		const $numberOfOption = $("#numberOfOption");
		//옵션 리스트
		const $productRegisterOptionList = $("#productRegisterOptionList");
		// 숫자 정규식
		const regexp = /^[0-9]*$/;

		const $deliveryToggleChk = $("#deliveryToggleChk");
		const $deliveryType = $("#deliveryType");
		const $deliveryToggle = $("#deliveryToggle");

		//할인여부 템플릿
		const $discountDetailBoxTmpl = _.template($("#discountDetailBoxTmpl").html());

		$("#discountToggle").click(function(){
			$("#discountDetailBox").append($discountDetailBoxTmpl());
			createDatepicker();
			//$("#discountDetailBox").remove();
			
		});
		
		//예약배송인지 일반배송인지
		$deliveryToggle.click(function() {

			const value = $deliveryToggleChk.prop("checked");
			console.log(value);

			if (value) {
				$deliveryType.val("R");
			} else {
				$deliveryType.val("B");
			}

			console.log($deliveryType.val());

		});

		//추가이미지 개수 따른 버튼 감춤/들어내기 함수
		function addImgCheck() {
			let len = $("#productRegisterAddImgList li").length;
			if (len == "5") {
				$productRegisterAddImgBtn.addClass("inactive");
			} else {
				$productRegisterAddImgBtn.removeClass("inactive");
			}
		}
		//상세설명 이미지 개수 따른 버튼 감춤/들어내기 함수
		function detailImgCheck() {
			let len = $("#productRegisterDetailImgList li").length;
			if (len == "21") {
				$productRegisterDetailImgBtn.addClass("inactive");
			} else {
				$productRegisterDetailImgBtn.removeClass("inactive");
			}
		}
		//같은 이름 네임 모으기 함수들
		function collectCategory() {
			let categoryLen = $("input[name=category]").length;
			//배열 생성
			let categoryArr = new Array(categoryLen);
			//배열에 값 주입
			for (let i = 0; i < categoryLen; i++) {
				categoryArr[i] = $("input[name=category]").eq(i).val();
			}
			$("input[name=categoryArr]").val(categoryArr);
		}
		function collectAddImg() {
			let addImgLen = $("input[name=AddImg]").length;
			//배열 생성
			let addImgArr = new Array(addImgLen);
			//배열에 값 주입
			for (let i = 0; i < addImgLen; i++) {
				addImgArr[i] = $("input[name=AddImg]").eq(i).val();
			}
			$("input[name=addImgArr]").val(addImgArr);
		}
		function collectDetailImg() {
			let detailImgLen = $("input[name=detailImg]").length;
			//배열 생성
			let detailImgArr = new Array(detailImgLen);
			//배열에 값 주입
			for (let i = 0; i < detailImgLen; i++) {
				detailImgArr[i] = $("input[name=detailImg]").eq(i).val();
			}
			$("input[name=detailImgArr]").val(detailImgArr);
		}
		function collectOption() {
			let optionTextLen = $("input[name=optionText]").length;
			//배열 생성
			let optionTextArr = new Array(optionTextLen);
			let optionCountArr = new Array(optionTextLen);
			//배열에 값 주입
			for (let i = 0; i < optionTextLen; i++) {
				optionTextArr[i] = $("input[name=optionText]").eq(i).val();
				optionCountArr[i] = $("input[name=optionCount]").eq(i).val();
			}
			$("input[name=optionTextArr]").val(optionTextArr);
			$("input[name=optionCountArr]").val(optionCountArr);
		}

		//옵션 개수 설정
		$productRegisterOptionSetting.click(function() {
			$productRegisterOptionList.empty();
			let n = $numberOfOption.val();
			if (regexp.test(n)) {
				for (i = 0; i < n; i++) {
					$productRegisterOptionList.append($optionTmpl());
				}
			} else {
				alert("숫자를 입력해주세요!");
				$numberOfOption.val('');
				$numberOfOption.focus();
			}
		});
		//배송가격 template으로 입력
		$delivery_price_option.on("click", function() {
			$productRegisterDeliveryPrice.val($(this).text());
		});
		//reload 버튼클릭시 카테고리 리로드
		$reloadBtn.on("click", function() {
			$.ajax({
				url : "/ajax/category",
				type : 'GET',
				dataType : "json",
				error : function(xhr, error, code) {
					alert("에러:" + code);
				},
				success : function(json) {
					//이전 카테고리 요소 삭제
					$(".product_register_category").remove();
					$productRegisterCategoryList.prepend($categoryTmpl({
						categories : json
					}));
				}
			});
		});
		
		//대표 이미지 업로드 이벤트
		$productRegisterRepresentInput.on("change", function() {
			const file = this.files[0];
			//1) 파일의 크기가 0이상
			if(file.size==0) {
				alert("파일사이즈가 0입니다.");
				return;
			}//if end
			
			//alert("여기까지왔으면?");
			
			//2) 파일의 종류가 image
			if(!file.type.includes("image/")) {
				//파일이 image가 아닐때
				alert("이미지를 올려주세요");
				return;
			}//if end
			
			
			console.log(file);
			
					//multipart/form-data에 필요함
				const formData = new FormData();
				formData.append("representImg", file, file.name);
				formData.append("type", "B");//B는 board의 줄임말
				
				//여기서 ajax로 파일 업로드 수행
				$.ajax({
					url : "/ajax/reImg",
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : formData,//multipart/form-data
					type : 'POST',//multipart/form-data
					dataType : "json",
					error : function(xhr, error, code) {
						alert("에러:" + code);
					},
					success : function(json) {
						console.log(json.name);
						//버튼 이미지 바꿈
						$("#representImgBtn").css("backgroundImage", "url('/img/"+json.name+"')");
						//업로드 값 등록
						$productRegisterRepresentImg.val(json.name);
						
						$("#productRegisterRepresentImg").val(json.name);
					}
				});
				
			});
			
			
		//추가 이미지 업로드 이벤트
		$productRegisterAddInput.on("change", function() {
			const file = this.files[0];
			//1) 파일의 크기가 0이상
			if(file.size==0) {
				alert("파일사이즈가 0입니다.");
				return;
			}//if end
			
			//alert("여기까지왔으면?");
			
			//2) 파일의 종류가 image
			if(!file.type.includes("image/")) {
				//파일이 image가 아닐때
				alert("이미지를 올려주세요");
				return;
			}//if end
				const formData = new FormData();
				formData.append("uploadImg", file, file.name);
				formData.append("type", "B");//B는 board의 줄임말
				//여기서 ajax로 파일 업로드 수행
				$.ajax({
					url : "ajax/addImg.json",
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : formData,//multipart/form-data
					type : 'POST',//multipart/form-data
					dataType : "json",
					error : function(xhr, error, code) {
						alert("에러:" + code);
					},
					success : function(json) {
						let addInput = $('<input>').attr({
							"type" : "hidden",
							"name" : "AddImg",
							"value" : json.name
						});
						let newLi = $('<li>');
						addInput.appendTo(newLi);
						newLi.css("backgroundImage",
								"url(img/" + json.name + ")").addClass(
								"deleteable_add_img add_image");
						$productRegisterAddImgBtn.before(newLi);
						//이미지 개수 체크
						addImgCheck();
					}
				});
		});
		
		
		

		//상세 설명 이미지 업로드 이벤트
		$productRegisterDetailInput.on("change", function() {
			const file = this.files[0];
			//1) 파일의 크기가 0이상
			if(file.size==0) {
				alert("파일사이즈가 0입니다.");
				return;
			}//if end
			
			//alert("여기까지왔으면?");
			
			//2) 파일의 종류가 image
			if(!file.type.includes("image/")) {
				//파일이 image가 아닐때
				alert("이미지를 올려주세요");
				return;
			}//if end
				const formData = new FormData();
				formData.append("uploadImg", file, file.name);
				formData.append("type", "B");//B는 board의 줄임말
				//여기서 ajax로 파일 업로드 수행
				$.ajax({
					url : "ajax/detailImg.json",
					processData : false,//multipart/form-data
					contentType : false,//multipart/form-data
					data : formData,//multipart/form-data
					type : 'POST',//multipart/form-data
					dataType : "json",
					error : function(xhr, error, code) {
						alert("에러:" + code);
					},
					success : function(json) {
						console.log(json)
						let detailInput = $('<input>').attr({
							"type" : "hidden",
							"name" : "detailImg",
							"value" : json.name
						});
						let newLi = $('<li>');
						detailInput.appendTo(newLi);
						newLi.css("backgroundImage",
								"url(img/" + json.name + ")").addClass(
								"deleteable_detail_img detail_image");
						$productRegisterDetailImgBtn.before(newLi);
						//이미지 개수 체크
						detailImgCheck();
					}
				});
		});

		//대표이미지 버튼 클릭 이벤트
		$representImgBtn.on("click", function() {
			$productRegisterRepresentInput.click();
		});
		//추가 이미지 버튼 클릭 이벤트
		$productRegisterAddImgBtn.on("click", function() {
			$productRegisterAddInput.click();
		});
		//상세 설명이미지 버튼 클릭 이벤트
		$productRegisterDetailImgBtn.on("click", function() {
			$productRegisterDetailInput.click();
		});

		//할인 체크
		$productRegisterDiscountInput.on("change", function() {
			if ($productRegisterDiscountInput.is(":checked")) {
				$discountDetailBox.addClass("active");
			} else {
				$discountDetailBox.removeClass("active");
			}
		});
		//상품명 기입시 글자수 표기
		$productRegisterName.on("keyup", function() {
			let suffix = "/30";
			let wordLen = $productRegisterName.val().length;
			$productRegisterNameLen.text(wordLen + suffix);
		})
		//img 삭제
		$(document).on("click", ".deleteable_add_img", function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				$(this).remove();
				addImgCheck();
			}
		});
		$(document).on("click", ".deleteable_detail_img", function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				$(this).remove();
				detailImgCheck();
			}
		});
		
		
		<%-- datepicker 생성하는  함수  --%>
		
		function createDatepicker() {
			
			picker = tui.DatePicker.createRangePicker({
				language : 'ko',
				startpicker : {
					date : today,
					input : '#startpicker-input',
					container : '#startpicker-container',
					showAlways : true
				},
				endpicker : {
					date : nextMonth,
					input : '#endpicker-input',
					container : '#endpicker-container',
					showAlways : true
				},
				selectableRanges : [ [
						today,
						new Date(today.getFullYear() + 1, today.getMonth(), today
								.getDate()) ] ]
			});
			const $tuiDatepickerInput = $('.tui-datepicker-input');
			//$tuiDatepickerInput.addClass('tui-hidden');

			const $rangePicker_container = $('.tui-rangepicker');
			$rangePicker_container.removeClass('tui-hidden');
			$rangePicker_container.on("click", function() {
				if ($rangePicker_container.hasClass('tui-hidden')) {
					$rangePicker_container.removeClass('tui-hidden');
				}
			});
			
		}
		
		
		
	</script>
</body>
</html>