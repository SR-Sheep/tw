<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>상품정보</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
<style>
#product_wrap {
	width: 1000px;
	margin: auto;
}

#product_header {
	position: relative;
	height: 500px;
	margin: 30px 0;
}

.prodcut_img_wrap {
	width: 450px;
	float: left;
}

.product_img img {
	width: 400px;
	margin: 25px 25px 10px 25px;
}

.product_img_thumb_wrap {
	text-align: center;
}

.product_img_thumb {
	display: inline-block;
	border: 3px solid transparent;
}

.product_img_thumb img {
	width: 50px;
}

.mouse_on {
	border: 3px solid #27AE60;
}

.product_info_wrap {
	float: left;
	width: 550px;
}

#product_container {
	clear: both;
}

.product_info {
	font-size: 20px;
	padding: 20px 0;
	border-bottom: 2px solid #f3f3f3;
}

.product_title {
	height: 130px;
}

.product_title .reservation_ok {
	font-size: 15px;
	font-weight: 700;
	color: #27AE60;
	border: 2px solid #27AE60;
	border-radius: 10px;
	padding: 5px;
}

.product_title h2 {
	font-size: 30px;
	font-weight: 700;
	line-height: 40px;
	margin-bottom: 20px;
}

.product_delivery {
	font-size: 15px;
}

.product_delivery .free {
	font-weight: 700;
}

.product_delivery .delivery_charge {
	margin: 5px 0;
}

.product_choice span {
	font-weight: 700;
}

.product_choice select {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 15px;
	font-weight: 500;
	margin-left: 20px;
	height: 50px;
	width: 400px;
}

.product_choice option {
	margin-left: 5px;
}

.discount {
	color: orangered;
}

.before_price {
	text-decoration-line: line-through;
	color: #cccccc;
}

.price {
	margin-top: 10px;
	font-size: 30px;
	font-weight: 500;
}

.product_detail {
	text-align: center;
}

.cut_img {
	height: 500px;
	overflow: hidden;
}

.product_tab_wrap {
	height: 100px;
	margin: auto;
}

.product_tab {
	position: relative;
	background-color: white;
}

.product_tab input {
	display: none;
}

.product_tab label {
	display: inline-block;
	height: 50px;
	width: 495px;
	margin: 10px 0;
	text-align: center;
	font-size: 20px;
	line-height: 50px;
	color: #424242;
	background-color: #f3f3f3;
	transition: .5s ease;
}

input[type="radio"]:checked+label {
	color: #AD443D;
	font-weight: 700;
	background-color: #fff;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.num {
	width: 80px;
	height: 44px;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 20px;
	text-align: center;
}

.btn_wrap {
	display: inline-block;
	font-size: 20px;
	width: 30px;
	position: relative;
	user-select: none;
}

.btn_wrap .btn {
	position: relative;
	top: 10px;
}

.btn_wrap .btn:hover {
	font-weight: 700;
	color: #27AE60;
}

.btn_wrap .btn:active {
	font-weight: 700;
	transform: scale(1.3);
}

.product_decide {
	padding: 10px 0;
	bottom: 0;
}

.product_decide button, .product_decide a {
	display : inline-block;
	text-align:center;
	line-height : 50px;
	width: 190px;
	user-select: none;
	font-size: 20px;
	background-color: #fff;
	color: #27AE60;
	border: 2px solid #27AE60;
	cursor: pointer;
	text-decoration: none;
}

.product_decide #basket {
	
}

.product_decide .purchase {
	background-color: #27AE60;
	color: white;
}

.fixedd {
	width: 1000px;
	position: fixed;
	top: 0;
}

.more {
	font-size: 20px;
	font-weight: 700;
	line-height: 50px;
	height: 50px;
	background-color: #f3f3f3;
	text-align: center;
}

.hidden {
	display: none;
}

.product_review {
	padding: 20px 0;
	border-bottom: 2px solid #cccccc;
}

.profile_img, .user_info, .star_box_wrap {
	display: inline-block;
	position: relative;
}

.profile_img img {
	height: 50px;
	width: 50px;
	background-color: red;
	border-radius: 100px;
}

.star_box_wrap {
	transform: scale(1.3);
	margin-left: 10px;
}

.star_box {
	margin: 10px 0;
	height: 15px;
}

.grad_star {
	width: 88px;
	background-position: 0 -220px;
	background-image: url("/img/ico_newsview_200522.png");
}

.inner_star {
	width: 0;
	background-position: 0 -240px;
	background-image: url("/img/ico_newsview_200522.png");
}

.user_info h4 {
	font-size: 13px;
	font-weight: 700;
}

.review_date {
	position: absolute;
	top: 30px;
	margin-left: 15px;
	font-size: 12px;
	color: #9e9e9e;
}

.review_content_wrap, .review_content {
	margin-top: 10px;
}

.review_img{
	margin-bottom:20px;
}

.review_img img{
	width: 100px;
	height: 100px;
	object-fit:cover;
}

.option_name {
	font-size: 13px;
	font-weight: 700;
	color: #27AE60;
}

.review_content {
	width: 1000px;
}

.reply {
	margin: 10px;
}

.reply i {
	color: #196439;
	margin: 0 10px;
}

.over_count{
	color : red;
}

#noReview{
	height: 100px;
	text-align: center;
	line-height: 100px;
}


</style>
</head>
<body>
	<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
	<!--21-02-23 17:03 양성룡 상품 디테일-->
	<div id="product_wrap">
		<div id="product_header">
			<div class="prodcut_img_wrap">
				<div class="product_img">
					<img src="/img/${product.representImg}" />
				</div><%--.product_img end --%>
				<div class="product_img_thumb_wrap">
					<div class="product_img_thumb mouse_on">
						<img src="/img/${product.representImg}" />
					</div><%--.product_img_thumb end --%>
					<c:if test="${subs!=null}">
						<c:forEach var="sub" items="${subs}">
							<div class="product_img_thumb">
								<img src="/img/${sub.name}" />
							</div><%--.product_img_thumb end --%>
						</c:forEach>
					</c:if>
				</div> <%--.product_img_thumb_wrap end --%>
			</div><%--#product_header end --%>
			
			<div class="product_info_wrap">
				<div class="product_title product_info">
					<h2>${product.name}</h2>
					<c:if test="${product.deliveryType=='R'}">
						<span class="reservation_ok">예약배송</span>
					</c:if>
				</div><%--.product_title end --%>
				
				<div class="product_price product_info">
					<%--21-03-03 17:26 양성룡 할인내역이 있으면 할인 보여줌 --%>
						<c:if test="${discount.discountRate!=null}">
							<span class="discount">${discount.discountRate}%</span>
							<span class="before_price">${product.price}원</span>
							<h4 class="price">
						</c:if>
					<h4 class="price">
						<fmt:formatNumber
						 value="${product.price*(1-(discount.discountRate/100))}"
						 pattern="#,###" />원
					</h4>
				</div><%--.product_price end --%>
				
				<div class="product_delivery product_info">
					<span class="free">무료배송</span>
					<span class="free_condition">
					<c:if test="${(delivery.deliveryOption*delivery.deliveryPrice)!=0}">
       					(<fmt:formatNumber value="${delivery.deliveryOption}" pattern="#,###" />원 이상 구매시)
					</span>
					<span class="delivery_charge"> | 그 외 배송비 
						<fmt:formatNumber value="${delivery.deliveryPrice}" pattern="#,###" />원
					</c:if>
					</span>
				</div><%--.product_delivery end --%>
				
				<form id="giftForm">
					<c:if test="${options!='[]'}">
						<div class="product_choice product_info">
							<input type="hidden" name="no" value="${product.no}" />
							<span>상품 선택</span> 
							<select id="select" name="option">
								<c:forEach var="option" items="${options}">
									<option data-count="${option.stock}" value="${option.no}">
									${option.name}ㆍ<fmt:formatNumber value="${option.stock}" pattern="#,###" />개
									</option>
								</c:forEach>
							</select>
						</div><%--.product_choice end --%>
					</c:if>
					
					<div class="product_decide">
						<input id="productNum" class="num" value="1" max="6"
							autocomplete="off" name="count" pattern="[0-9]+" />
						<div class="btn_wrap">
							<i class="far up_btn btn fa-caret-square-up"></i> <i
								class="far down_btn btn fa-caret-square-down"></i>
						</div><%--.btn_wrap end --%>
						<c:choose>
							<c:when test="${loginMember!=null}">
								<button id="basket" type="button" >장바구니</button>
								<button formaction="/order" formmethod="post" class="purchase">구매하기</button>
							</c:when>
							<c:otherwise>
								<a href='/log' >장바구니</a>
								<a class="purchase" href='/log'>구매하기</a>
							</c:otherwise>
						</c:choose>
					</div><%--.product_decide end --%>
					<div class="over_count hidden">
						<span>선택가능한 수량은</span>
						<span class="count"></span>
						<span>개 입니다</span>
					</div><%--.over_count end --%>
				</form>
			</div> <%--.product_info_wrap--%>
		</div><%--.product_header end --%>
		
		<div id="product_container">
			<%--탭 클릭시 이동을 위한 공간 --%>
			<div class="move"></div>
			<div class="product_tab_wrap">
				<div class="product_tab">
					<input type="radio" id="detail" name="product_tab" value="detail">
					<label for="detail" data-scroll="detail">상품 상세</label>
					<input type="radio" id="review" name="product_tab" value="review">
					<label for="review" data-scroll="review">상품 후기
						(${product.reviewCount})</label>
				</div><%--.product_tab end--%>
			</div><%--.product_tab_wrap end --%>
			
			<div class="product_detail cut_img">
				<c:forEach items="${details}" var="detail">
					<img class="hidden" src="/img/${detail.name}">
				</c:forEach>
			</div><%--.product_detail end --%>
			
			<div class="more">
				더보기<i class="fas fa-caret-down"></i>
			</div><%--.more end --%>
			
			<div class="product_review_wrap">
			<c:choose>
				<c:when test="${reviews!='[]'}">
					<c:forEach items="${reviews}" var="review">
						<div class="product_review">
							<div class="review_user">
								<div class="review_img">
								<c:forEach items="${review.reviewImages}" var="reviewImage">
									<img src="/img/${reviewImage.name}" width="100px" />
								</c:forEach>
								</div><%--.review_img end --%>
								<div class="user_info_wrap">
									<div class="profile_img">
										<img src="/img/${review.profile}" />
									</div><%--.profile_img end --%>
									<div class="user_info">
										<h4>${review.name}</h4>
										<div class="star_box_wrap">
											<div class="grad_star star_box">
												<div class="inner_star star_box"
													style="width: ${review.score/5*100}%">
												</div>
											</div>
										</div><%--.star_box_wrap end --%>
										<%--.star_box_wrap end--%>
										<span class="review_date">
										<fmt:formatDate value="${review.regdate}" pattern="yyyy.MM.dd" />
										</span>
									</div><%--.user_info end --%>
								</div><%--.user_info_wrap end --%>
							</div><%--.review_user end --%>
							
							<div class="review_content_wrap">
								<div class="option_name">
									<h2>${review.optionName}</h2>
								</div><%--.option_name end --%>
								<div class="review_content">
									${review.content}
								</div><%--.review_content end --%>
								<c:if test="${review.replyContents!=null}">
								<div class="reply">
									<i class="fas fa-bullhorn"></i>${review.replyContents}
								</div><%--.reply end --%>
								</c:if>
							</div><%--.review_content_wrap end --%>
						</div><%--.product_review end --%>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div id="noReview">
						<span>작성된 리뷰가 없습니다.</span>
					</div><%--#noReview end --%>
				</c:otherwise>
				</c:choose>
			</div><%--.product_review_wrap end --%>
		</div><%--.product_container end --%>
	</div><%--.product_wrap end --%>

	<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>

 
	<script>
	//탭 영역 위치
    const $productTabOffset=$(".product_tab_wrap").offset();
	//탭 디테일 영역 위치
    const $detailOffset=$(".move").offset();
	//리뷰 영역 위치, 더보기 클릭 시 변경 됨
    let $reviewOffset=$(".product_review_wrap").offset();
	//스크롤 바텀, 0이 될시 리뷰 탭 활성화를 위함
	let $scrollBottom;
	//탭 디테일 부분
    const $detail=$("#detail");
	//탭 리뷰 부분
    const $review=$("#review");
	//탭 리뷰 부분
    const $product_tab=$(".product_tab");
	//더보기 버튼
    const $more=$(".more");
	//height를 설정하여 이미지 크기 조정
    const $cut_img=$(".cut_img");
	
	//구매 수량 위 버튼
    const $up_btn=$(".up_btn");
	//구매 수량 아래 버튼
    const $down_btn=$(".down_btn");
	//구매 수량
    const $productNum=$("#productNum");
	//선택한 옵션
    const $product_choice=$(".product_choice option:selected");
	//구매 수량 변환을 위한 변수
    let productNum=1;
	//상품 서브 이미지
    const $product_img_thumb = $(".product_img_thumb");
	//상품 대형 이미지
    const $product_img=$(".product_img img")
	//상품 설명 이미지
    const $product_detail=$(".product_detail");
	//장바구니
    const $basket=$("#basket");

	//해당 영역으로 이동하는 함수
    function move(offset){
        $("html, body").animate({scrollTop : offset.top},400);
    }

	//상품 탭 레벨 클릭 시
    $(".product_tab label").on("click",function (){
       //상품 상세 클릭시 상품 상세로 이동
    	if($(this).data("scroll")=="detail"){
           move($detailOffset);
       //리뷰 클릭시 리뷰로 이동
       }else if($(this).data("scroll")=="review"){
           move($reviewOffset);
       }
    });
    
	//스크롤 시
    $(window).scroll(function(){ 
    	//상품 설명보다 아래일 때 메뉴바 fixed로 변경
        if($(document).scrollTop()>=$productTabOffset.top){
            $product_tab.addClass("fixedd");
            //스크롤 바텀 설정
	    	$scrollBottom=$(document).height() - $(window).height() - $(window).scrollTop();
            //스크롤 바텀이 0이거나 리뷰 보다 아래있을 때 리뷰 탭 체크
            if($scrollBottom==0||$reviewOffset.top<=$(document).scrollTop()){
            	$review.prop("checked",true);
           	//디테일 보다 아래있을 때 디테일 체크
            }else if($detailOffset.top<=$(document).scrollTop()){
            	$detail.prop("checked",true);
            }
    	//상품 설명 위일 때 메뉴바 fixed 제거
        }else {
            $product_tab.removeClass("fixedd");
           	$detail.prop("checked",false);
        }
    })
    
    //상품 상세 이미지 중 첫 이미지는 공개
    $product_detail.children().first().removeClass("hidden");
	
	//더보기 클릭 시 상세 내용 표시
    $more.on("click",function (){
    	//상품 상세 hidden 클래스 제거
    	$product_detail.children().removeClass("hidden");
    	//첫번째 이미지 제한된 높이 해제
        $cut_img.removeClass("cut_img");
    	//more 단추 숨기기
        $more.addClass("hidden");
        //리뷰 위치 재조정
        $reviewOffset=$(".product_review_wrap").offset();
    })
    
	//수량 위 버튼 누르면 수량 변경
    $up_btn.on("click",function (){
    	//최대 수량 가져오기
    	const $count=$("#select option:selected").data("count");
    	//상품 수량 설정 값
        productNum=parseInt($productNum.val());
    	//상품 수량이 최대 수량보다 작거나 정해져있지 않으면 상품 수량+1
        if(productNum<$count||$count==undefined){
	       	$productNum.val(productNum+1);
        	$(".over_count").addClass("hidden");	
    	//상품 수량이 최대 수량보다 크면 최대 수량으로 재설정하고 경고 문구 보여주기
        }else if(productNum>=$count){
        	$productNum.val($count);
        	$(".count").text($count);
    		$(".over_count").removeClass("hidden");
    	}
    })
    
	//수량 아래 버튼 누르면 수량 변경
    $down_btn.on("click",function (){
    	//상품 수량 설정 값
        productNum=parseInt($productNum.val());
    	//상품 수량 -1로 설정
        $productNum.val(productNum-1);
    	//상품 수량이 1보다 작으면 1로 변경
        if(parseInt($productNum.val())<1){
            $productNum.val(1);
    	//그 외일경우 경고문구 숨기기
        }else{
        	$(".over_count").addClass("hidden");
        }
    })
    
    //input을 통한 수량 변경 시, 최대 수량을 넘으면 최대 수량으로 변경
    $productNum.on("propertychange change keyup paste input",function(){
    	//최대 수량 가져오기
    	const $count=$("#select option:selected").data("count");
    	//상품 수량 값 중 숫자가 아닌 값을 제거
    	$(this).val($(this).val().replace(/[^0-9.]/g, ''));
    	//상품 수량이 0이면 1로 변경
    	if($(this).val()==0) $(this).val('1');
    	//상품 수량이 최대 수량보다 크면 최대 수량으로 변경 후 경고 문구 보여주기
	    if($productNum.val()>$count){
	        	$(".count").text($count);
	    		$(".over_count").removeClass("hidden");
	        	$(this).val($count);
    	//상품 수량이 최대 수량보다 작으면 경고 문구 숨기기
	    }else if($productNum.val()<$count){
	        	$(".over_count").addClass("hidden");
	    }
    })
    
    //썸네일 이미지 클릭 시 메인 사진 해당사진으로 변경
    $product_img_thumb.on("click",function (){
        $(this).parent().children().removeClass("mouse_on");
        $(this).addClass("mouse_on");
        $product_img.attr("src",$(this).children('img').attr("src"));
    })
    
	
	//로그인 시
	<c:if test="${loginMember!=null}">
	//ajax로 장바구니에 해당 데이터 삽입
	$basket.on("click",function (){
		
    	//상품 수량 설정 값
        productNum=parseInt($productNum.val());
    	const $option
    	=$("#select option:selected").val()!=undefined
    	?$("#select option:selected").val():-1;
    	
		 $.ajax({
            url:"/ajax/addCart",
            type:"post",
            dataType:"json",
            data:{memberNo : ${loginMember.no}
            	 ,productNo : ${product.no}
            	 ,optionNo : $option
            	 ,count : productNum},
            success:function (isAdding){
            	//장바구니에 추가 성공시
            	if(isAdding){
            		alert("장바구니에 추가됨");
            	//이미 장바구니에 존재
            	}else{
            		alert("장바구니에 이미 있음");
            	}
            },
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            }
        })//ajax() end
	});
	</c:if>

</script>
</body>
</html>