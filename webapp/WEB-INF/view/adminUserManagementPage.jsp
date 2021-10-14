<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>선:MALL 유저관리</title>
    <link rel="stylesheet" href="/css/all.min.css"/>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/notosanskr.css"/>
    <link rel="stylesheet" href="/css/paginate.css"/>
    <style>
        body{
            font-family: "Noto Sans KR", sans-serif;
        }
        #wrap{
            width: 1100px;
            /*background-color: red;*/
            margin: auto;
        }
        /*admin header */
        #header{
            height: 100px;
            /*background-color: blue;*/
            position: relative;
            border-bottom: 1px solid #424242;
        }

        /*admin sideMenu*/
        #sideMenuWrap{
            width: 150px;
            /*min-height: 1000px;*/

            background-color: #196439;

            /*21-03-01 15:15 수정*/
            float: left;
            min-height: 1300px;
        }
        #sideMenu{
            width: 150px;
            background-color: #196439;
            position: fixed;
        }
        #content{
            background-color: yellow;
        }
        #logo{
            position: absolute;
            left: 25px;
            top: 30px;
        }
        .headerBtn{
            float: right;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 70px;
        }
        .headerBtn a{
            text-decoration: none;
            color: #424242;
        }
        .sideMenuBtn{
            margin: 0 auto 50px auto;
            text-align: center;
            position: relative;
            top: 50px;
        }
        .sideMenuBtn a{
            text-decoration: none;
            color: #fff;
            font-size: 20px;
        }

        /*21-03-01 16:04 수정*/
        #userManagementWrap {
            width: 950px;
            float: right;
            height: 100%;
        }

        #userManagementWrap h1 {
            font-size: 36px;
            font-weight: bold;
            margin: 30px 50px;
        }

        #userManagementWrap h2 {
            font-size: 24px;
            font-weight: bold;
            margin: 30px 50px;
        }

        .user_current_status {

        }

        #userListTable {
            width: 930px;
            text-align: center;
            margin: 30px 10px;
            
        }

        #userListTable th{
            /*padding: 15px 20px;*/
            height: 50px;
            vertical-align: middle;
        }
        #userListTable td {
           vertical-align: middle;
           height:75px;
        }
        #userListTable th, #userListTable tr {
            border: 1px solid #424242;
        }

        .user_count {
            display: inline-block;
        }

        .user_count p {
            text-align: center;
        }
        td img{
        	border-radius: 50%;
        }
        .admin_user_management{
        	margin-top:10px;
         	margin-left: 20px;
        }
        .admin_user_management #user_manage{
        	color:#27AE60;
        }
    </style>
</head>
<body>
<div id="wrap">
    <div id="header">
        <h1 id="logo"><a href=""><img src="img/logo.png" width="100" height="40" alt="로고"></a></h1>
        <div class="headerBtn"><a href="">로그아웃</a></div>
        <div class="headerBtn"><a href="">상품 등록</a></div>
        <div class="headerBtn"><a href="">컨텐츠 등록</a></div>
    </div><!-- //#header end -->
    <div id="sideMenuWrap">
        <div id="sideMenu">
            <div class="sideMenuBtn "><a href="">상품 관리</a></div>
            <div class="sideMenuBtn "><a href="">리뷰 관리</a></div>
            <div class="sideMenuBtn "><a href="">유저 관리</a></div>
            <div class="sideMenuBtn "><a href="">컨텐츠 관리</a></div>
        </div><!-- //#sideMenu end -->
    </div><!-- //#sideMenuWrap end -->
    <div id="content">
        <div id="userManagementWrap">
            <h1>TODAY</h1>
            
       
            <div class="admin_user_management">
                <span>ADMIN</span><span> > </span><span id="user_manage">유저관리</span>
            </div><!-- //.admin_user_management -->

            <div class="admin_user_management">${memberCount}건</div>

            <table id="userListTable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>사진</th>
                        <th>e-mail</th>
                        <th>가입일</th>
                        <th>구매건</th>
                        <th>예약건</th>
                        <th>리뷰건</th>
                        <th>BAN횟수</th>
                        <th>BAN</th>
                        <th>BAN취소</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${members}" var="member">
                    <tr>
                        <td>${member.no}</td>
                        <td>${member.id}</td>
                        <td><img width="50" height="50" src="/img/${member.profile}"></td>
                        <td>${member.email}</td>
                        <td><fmt:formatDate value="${member.regdate}" pattern="YYYY.MM.dd"/></td>
                        <td>${member.saleCount}</td>
                        <td>${member.reservationCount}</td>
                        <td>${member.reviewCount}</td>
                        <td>${member.banCount}</td>
                        <td><button data-no="${member.no}" class="ban_btn">Ban</button></td>
                        <td><button data-no="${member.no}" class="cancel_btn" <c:if test="${member.banState == 'N' }">disabled</c:if>>취소</button></td>
                    </tr>
                	</c:forEach>
                	
                    
                </tbody>
            </table><!-- //#userListTable end -->
        </div><!-- //#userManagementWrap end -->
    </div><!-- //#content end -->
		${paginate}
</div><!-- //#wrap end -->
<script src="/js/jquery.js"></script>
<script>
	const $ban = $(".ban_btn");
	const $cancel = $(".cancel_btn");
	
	$ban.on("click",function(){
		const no =$(this).attr("data-no");
		const $this =$(this);
		$.ajax({
            url:"/ajax/ban/"+no,
            dataType:"json",
            data:{
            	"no":no
            },
            type:"POST",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
            	console.log(json.result);
            	$this.parent().prev().text(json.result);
            	$this.parent().next().children().attr("disabled",false);
            }
        })//ajax() end
		
	});//ban click end
	
	$cancel.on("click",function(){
		const no =$(this).attr("data-no");
		const $this =$(this);
		$.ajax({
            url:"/ajax/noBan/"+no,
            dataType:"json",
            data:{
            	"no":no
            },
            type:"DELETE",
            error:function (xhr, error) {
                alert("점검중");
                console.log(error);
            },
            success:function (json){
            	$this.attr("disabled",true);
            }
        })//ajax() end
		
	});//ban click end
	
	
</script>
</body>
</html>