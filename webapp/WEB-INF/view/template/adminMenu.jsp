<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 헤더</title>
</head>
<body>
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
</body>
</html>