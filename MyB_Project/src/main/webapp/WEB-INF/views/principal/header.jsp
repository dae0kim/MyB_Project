<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
 
<div id="nav_wrap">  
<nav class="navbar navbar-default navbar-fixed-top">
 <div class="container">
   <div class="navbar-header">
     <button
       type="button"
       class="navbar-toggle"
       data-toggle="collapse"
       data-target="#myNavbar"
     >
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
     </button>
     <a class="navbar-brand" href="<c:url value='/principal/home'/>">MyB</a>
   </div>
   <div class="collapse navbar-collapse" id="myNavbar">
     <ul class="nav navbar-nav navbar-right">
       <li><a href="<c:url value='/logout' />">LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav>
</div>

<div id="jb-container">
      <div id="jb-sidebar">
      <div id="sidebar_user">
      	<i id="sidebar_icon" class="fa-regular fa-user"></i>
        <h2>${loginUser.adminName} 원장님</h2>      
      </div>
      <div id="sidebar_menu_list">      
        <ul>
          <li><a href="<c:url value='/kindergarten/check' />">어린이집 등록</a></li>
          <li><a href="<c:url value='/classroom/namelist/${loginUser.adminId}' />">반 관리</a></li>
          <li><a href="<c:url value='/teacher/list/${loginUser.adminId}' />">교사 관리</a></li>
          <li><a href="<c:url value='/complain/list/${loginUser.adminId}' />">컴플레인 게시판</a></li>
          <li><a href="<c:url value='/notice/list/${loginUser.adminId}' />">공지사항</a></li>
          <li><a href="<c:url value='#' />">출결 통계</a></li>
          <li><a href="<c:url value='#' />">질병 통계</a></li>
        </ul>
      </div>
      </div>
