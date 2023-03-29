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
        <input type="text" name="complainTitle" value="${complainVO.complainTitle}" readonly />

		<div class="join_form_text">
         <span>작성일</span>
        </div>
		<input type="text" name="complainDate" value="<fmt:formatDate value="${complainVO.complainDate}" pattern="YYYY-MM-dd HH:mm:ss"/>" readonly />

		<div class="join_form_text">
         <span>작성자</span>
        </div>
        <input type="text" name="parentName" value="${complainDetailVO.parentName}" readonly />

		<div class="join_form_text">
         <span>작성자 연락처</span>
        </div>
        <input type="text" name="parentPhone" value="${complainDetailVO.parentPhone}" readonly />

		<div class="join_form_text">
         <span>자녀</span>
        </div>
        <input type="text" name="childName" value="${complainDetailVO.childName}" readonly />

		<div class="join_form_text">
         <span>자녀 교실</span>
        </div>
        <input type="text" name="classroomName" value="${complainDetailVO.classroomName}" readonly />
  		
		<div class="join_form_text">
         <span>내용</span>
        </div>
        <textarea name="complainContent" readonly>${complainVO.complainContent}</textarea>
		
		<div class="join_form_text">
         <span>처리상태</span>
        </div>
        <input type="text" name="complainStat" value="${complainVO.complainStat}" readonly/>
        
		<input type="hidden" name="adminId" value="${loginUser.adminId}"/>
        
        <br>
        <button class="web_btn_small" type="button" onclick="location.href='<c:url value='/complain/update/${complainVO.complainId}'/>'">
		    요청확인
		</button>
        <button class="web_btn_small" type="button" onclick="location.href='<c:url value='/complain/list/${loginUser.adminId}'/>'">
		    돌아가기
		</button>

<%@include file="../footer.jsp" %>
</body>
</html>