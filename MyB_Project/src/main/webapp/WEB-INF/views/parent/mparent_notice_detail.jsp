<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/all_notice_detail.css" rel="stylesheet">
</head>

<body>
<div class="wrap">
		<div class="title_wrap">
        <div id="title_name" style="font-weight : 700;">공지사항</div>
        <div id="noticedetail_btn">
            <button type="button" onClick="location.href='javascript:history.back();'">돌아가기</button>
        </div>
        </div>

    <div class="noticedetailcontent_wrap">
                <table class="notice_table">
                	<thead>
					<tr>
						<th scope="cols">글번호</th>
						<th scope="cols">날짜</th>						
						<th scope="cols">제목</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="noticelist" items="${noticelist}">
					
					<tr>
						<td class="noticeId">${noticelist.noticeId}</td>
						<td class="noticeDate"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticelist.noticeDate}"/></td>
						<td><a class="noticeTitle" href="<c:url value="/teacher/notice/${noticelist.noticeId}"/>">${noticelist.noticeTitle}</a></td>
					</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
            </div>
            </div>
</body>
</html>

<%@include file="../p_footer.jsp"%>