<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
      
    <div id="wrap">
        <div id="header">
            <div id="headerLogoBox">
                <a href="/"><img id="headerLogo" src="/img/sun_logo.png"></a>
            </div>
            <div id="headerSearchBox">
                <div id="headerItemSearchBox">
                    <input id="headerItemSearch" name="itemSearchKeyword" placeholder="찾고 싶은 상품을 검색해 보세요">
                    <button id="headerItemSearchBtn"><i class="fas fa-search"></i></button>
                </div>
            </div>
            <div id="headerKeywordBox">
                <div id="headerShowingKeyword">
                    <span id="headerCurrentShowingRank">1</span>
                    <span id="headerCurrentShowingKeyword">레고꽃다발</span>
                    <span id="headerMoreKeywordDownBtn" class="active"><i class="fas fa-chevron-circle-down"></i></span>
                    <span id="headerMoreKeywordUpBtn"><i class="fas fa-chevron-circle-up"></i></span>
                </div>
            </div>
            <c:choose>
				<c:when test="${loginMember!=null}">
	            <div id="headerUserName">
	                <a href=""><strong>${loginMember.name}님</strong></a>
	            </div>
	            <div id="headerLogout">
	                <button form="logoutForm">로그아웃</button>
	            </div>
	            <form action="/log" method="post" id="logoutForm">
					<input type="hidden" name="_method" value="DELETE"> 
				</form>
	            <div id="headerPoint">
	                <strong>P</strong>
	                <span><fmt:formatNumber pattern="#,###">${loginMember.point}</fmt:formatNumber>p</span>
	            </div>
	            <div id="headerMyCart">
	                <a href=""><i class="fas fa-shopping-cart"></i></a>
	            </div>
				</c:when>
            
				<c:otherwise>
	            <div id="signUpBtn">
	                <a href="/join"><i class="fas fa-user-plus"></i>회원가입</a>
	            </div>
	            <div id="loginBtn">
	                <a href="/log"><i class="fas fa-sign-in-alt"></i>로그인</a>
	            </div>
				</c:otherwise>
			</c:choose>
            <!-- //오세훈 작성 -->
            <div id="headerMoreKeywordListBox">
                <ul id="headerMoreKeywordList">
                    <li>

                    </li>
                </ul>
            </div><!-- //keywordList   -->
        </div><!-- //header   -->
    </div><!-- //wrap   -->

