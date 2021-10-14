<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
int rowNo = 1;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>선:MALL 주문배송</title>
<link rel="stylesheet" href="/css/all.min.css">
<link rel="stylesheet" href="/css/notosanskr.css">
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/paginate.css">
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
	user-select: none;
}

#wrap {
	width: 1100px;
	margin: auto;
	overflow: hidden;
}

#content h2 {
	font-size: 25px;
	font-weight: 700;
	margin-top: 40px;
	margin-left: 30px;
}
/*
        #content span{
            display: inline-block;
            margin-left: 30px;
            margin-top: 40px;
        }
        */
.btn {
	width: 30px;
	height: 30px;
	border: none;
	background-color: #424242;
	color: #fff;
	cursor: pointer;
}

#preBtn {
	margin-left: 30px;
}

#nextBtn {
	margin-left: 10px;
}

#countFilter {
	font-family: "Noto Sans KR", sans-serif;
	width: 120px;
	height: 30px;
	border: 1px solid #bebebe;
	border-radius: 5px;
	margin-left: 820px;
}

#tableWrap table {
	width: 930px;
	margin-top: 20px;
	margin-left: 20px;
}

#tableWrap th {
	border-top: 1px solid #424242;
	height: 50px;
	line-height: 50px;
}

#tableWrap td {
	text-align: center;
	background-color: #fff;
	vertical-align: middle;
}

tr {
	border-bottom: 1px solid #424242;
}

.waybill {
	width: 80px;
}

.profile_img img {
	border-radius: 50%;
}

td button {
	background-color: #fff;
	margin-left: 5px;
	cursor: pointer;
	border: 1px solid #bebebe;
	border-radius: 5px;
}

.state_w {
	margin-right: 13px;
}

#content {
	width: 930px;
	float: left;
}
/*관리자 헤더*/
.admin_header {
	position: relative;
	border-bottom: 1px solid #424242;
}

.admin_header ul {
	position: absolute;
	right: 0;
	bottom: 0;
	margin-bottom: 10px;
}

.admin_header_nav_item {
	float: right;
	margin-right: 15px;
}

.admin_header_nav_item a {
	font-size: 20px;
}

.admin_logo {
	/*width: 170px;*/
	font-size: 40px;
	font-weight: bold;
	text-align: center;
	width: 170px;
	height: 50px;
	line-height: 50px;
}

/*관리자사이드바*/
.admin_side_bar {
	width: 130px;
	/*position: absolute;*/
	height: 1100px;
	background-color: #196439;
	float: left;
}

.admin_side_bar_list {
	list-style: none;
	font-size: 20px;
	font-weight: bold;
	margin: 25px 0 0 20px;
}

.admin_side_bar_list a {
	color: #fff;
}

.admin_side_bar_list a, .admin_header a {
	text-decoration: none;
}

.admin_header a {
	color: #424242;
}

.total_order_count {
	position: relative;
	left: 30px;
	top: 25px;
	font-size: 18px;
}

.delivery_filter {
	float: right;
	margin-right: 10px;
}

.del_filter_nav {
	position: static;
	left: 300px; width : 300px;
	height: 50px;
	background-color: #424242;
	width: 300px;
}
</style>
</head>
<body>
	<div id="wrap">
		<!--관리자 헤더-->
		<div class="admin_header">
			<h1 class="admin_logo">
				<a href="adminMain.html"> ADMIN </a>
			</h1>
			<ul>
				<li class="admin_header_nav_item"><a href="/"> 로그아웃 </a></li>
				<li class="admin_header_nav_item"><a href="/"> 상품등록 </a></li>
				<li class="admin_header_nav_item"><a href="/"> 컨텐츠등록 </a></li>
				<li class="admin_header_nav_item"><a href="/"> 카테고리등록 </a></li>
			</ul>
		</div>
		<!--adminHeader end-->
		<!--관리자 사이드바-->
		<div class="admin_side_bar">
			<ul>
				<li class="admin_side_bar_list"><a href="/"> 상품관리 </a></li>
				<li class="admin_side_bar_list"><a href="/"> 유저관리 </a></li>
				<li class="admin_side_bar_list"><a href="/"> 컨텐츠관리 </a></li>
				<li class="admin_side_bar_list"><a href="/admin/delivery/page/1?rownum=5"> 배송관리 </a></li>
			</ul>
		</div>
		<!--sideBar end-->

		<div id="content">
			<div id="contentHeader">
				<h2>주문 배송</h2>
				<!-- <span>2월 16일</span> -->
				<!-- 
            <button id="preBtn" class="btn"><</button>
            <button id="nextBtn" class="btn">></button>
             -->
				<span class="total_order_count">${listTotalCount }건</span>
				<!-- 
				<div class="del_filter_nav">
					<ul>
						<li class="delivery_filter">배송완료</li>
						<li class="delivery_filter">배송중</li>
						<li class="delivery_filter">주문완료</li>
					</ul>
				</div>
				 -->
				<select id="countFilter">
					<option value=5 <c:if test="${rownum == 5 }">selected</c:if>>5개씩
						보기</option>
					<option value=10
						<c:if test="${rownum == 10 }">selected</c:if>>10개씩
						보기</option>
				</select>
			</div>
			<div id="tableWrap">
				<table>
					<thead>
						<tr>
							<th style="width: 10%">상품사진</th>
							<th style="width: 15%">이름</th>
							<th style="width: 30%">주소</th>
							<th style="width: 15%">물품</th>
							<th style="width: 15%">진행상</th>
							<th style="width: 15%">운송장번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="delivery" items="${orderProdList}">

							<tr>
								<td class="profile_img"><img
									src="/img/${delivery.prodImg }" width="75" height="75"></td>
								<td>${delivery.receiver}</td>
								<td><p>${delivery.address}</p>
									<p>${delivery.addressDetail}</p></td>
								<td>${delivery.prodName}(${delivery.prodOptName})</td>
								<td>
									<p>
										<input type="radio" name="radio<%= rowNo %>"
											id="o<%= rowNo %>"
											<c:if test="${delivery.delState == 'O'}"> checked</c:if>
											<c:if test="${delivery.delState == 'C'}"> disabled</c:if>>
										<label for="radio<%=rowNo%>">주문완료</label>
									</p>
									<p class="state_w">
										<input type="radio" name="radio<%= rowNo %>"
											id="w<%= rowNo %>"
											<c:if test="${delivery.delState == 'W'}"> checked</c:if>
											<c:if test="${delivery.delState != 'W'}"> disabled</c:if>>
										<label for="radio<%=rowNo%>">배송중</label>
									</p>
									<p>
										<input type="radio" name="radio<%= rowNo %>"
											id="c<%= rowNo %>"
											<c:if test="${delivery.delState == 'C'}"> checked</c:if>>
										<label for="radio<%=rowNo%>">배송완료</label>
									</p>
								</td>
								<td><input class="waybill" type="text"
									<c:if test="${delivery.delState == 'C' || delivery.delState == 'W'}"> placeholder="${ delivery.waybill}" </c:if>
									<c:if test="${delivery.delState == 'C'}"> placeholder="${ delivery.waybill}" disabled </c:if>>
									<button class="confirm_btn" data-no="${delivery.no}" data-waybill="${ delivery.waybill}" data-del-state="${delivery.delState}">확인</button></td>
							</tr>
							<%rowNo++;%>
						</c:forEach>
<!-- 
						<form id="updateForm" action="/admin/delivery/page" method="post">
						</form> -->


					</tbody>
				</table>
				<span>${paginate} </span>
			</div>
		</div>
	</div>


	<script src="/js/jquery.js"></script>
	<script>
		const $confirmBtn = $(".confirm_btn");
		const $countFilter = $("#countFilter");
		let rownum = '';

		$confirmBtn.on("click", function() {
			console.log(this.dataset.no);
			console.log(this.dataset.waybill);
			console.log(this.dataset.delState);
			console.log($(this).prev().val());
			
			
			changeDelState(this.dataset.no, this.dataset.waybill, this.dataset.delState);
		});

		$countFilter.on("change", function() {
			rownum = $(this).val();
			location.href = "/admin/delivery/row/"+rownum+"/page/${page}";
		})
		
		
	//배송상태 변경하기 ajax
    function changeDelState(no, waybill, delState){
        $.ajax({
            //연결 시킬 서블릿
            url:"/ajax/admin/delivery",
            //넘겨주는 방식
            type:"put",
            //넘겨주는 데이터 형식
            dataType:"json",
            //서블릿으로 넘겨줄 데이터
            data:{
                no : no,
                waybill :waybill,
                delState : delState
                },
            error:function(xhr,error){
                alert(error);
            },
            success:function(json){
            	console.log(json);

                
            }
        })
    }
		
		
		
	</script>

</body>
</html>