<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%@include file="../header.jsp" %>
		<div class="join_form_text">
         <span>제목</span>
        </div>
        <input type="text" name="noticeTitle" value="${noticeVO.noticeTitle}" readonly />

		<div class="join_form_text">
         <span>작성일</span>
        </div>
		<input type="text" name="noticeDate" value="<fmt:formatDate value="${noticeVO.noticeDate}" pattern="YYYY-MM-dd HH:mm:ss"/>" readonly />
		
		<div class="join_form_text">
         <span>내용</span>
        </div>
        <textarea name="noticeContent" readonly>${noticeVO.noticeContent}</textarea>
		
		<div class="join_form_text">
         <span>상단 고정 여부</span>
        </div>
        <input type="text" name="noticeStat" value="${noticeVO.noticeStat}" readonly/>
        
		<input type="hidden" name="adminId" value="${loginUser.adminId}"/>
        
        <br>
        <button class="web_btn_small" type="button" onclick="location.href='<c:url value='/notice/update/${noticeVO.noticeId}'/>'">
		    수정하기
		</button>
		<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/notice/delete/${noticeVO.noticeId}'/>'">
		    삭제하기
		</button>
		<button class="web_btn_small" type="button" onclick="location.href='<c:url value='/notice/list/${loginUser.adminId}'/>'">
		    돌아가기
		</button>

<%@include file="../footer.jsp" %>
</body>
</html>