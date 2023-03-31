<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/all_notice_detail.css" rel="stylesheet">
</head>

<body>
		<div class="noticedetailtitle_wrap">
        <div id="noticedetail_title" style="font-weight : 700;">공지사항</div>
        <div id="noticedetail_btn">
            <button type="button" onClick="location.href='javascript:history.back();'">돌아가기</button>
        </div>
        </div>

    <div class="noticedetailcontent_wrap">
    	<div>
              <div id="notice_box">
                <table class="notice_table">
					<tr>
						<th>글번호</th>
						<th>날짜</th>						
						<th>제목</th>
					</tr>
						<c:forEach var="noticelist" items="${noticelist}">
					<tr>
						<td class="noticeId">${noticelist.noticeId}</td>
						<td class="noticeDate"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticelist.noticeDate}"/></td>
						<td><a class="noticeTitle" href="<c:url value="/parent/notice/${noticelist.noticeId}"/>">${noticelist.noticeTitle}</a></td>
					</tr>
				</c:forEach>
				</table>
            </div>
            </div>
    </div>
</body>



</html>