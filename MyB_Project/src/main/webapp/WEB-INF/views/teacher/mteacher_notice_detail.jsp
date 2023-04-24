<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../t_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice.css" rel="stylesheet">
</head>

<body style="font-family: Nanum Gothic">
<div class="wrap">
		<div class="title_wrap">
        <div id="title_name" style="font-weight : 700;">공지사항</div>
        <div id="noticedetail_btn">
            <button type="button" onclick = "location.href = '${pageContext.request.contextPath}/teacher/mteacher_web_main' ">돌아가기</button>
        </div>
        </div>
    <div class="noticedetailcontent_wrap">
                <table class="notice_table">
					<tr>
						<th scope="cols" style="width:73%;">제목</th>
						<th scope="cols" style="width:27%;">날짜</th>							
					</tr>
						<c:forEach var="noticelist" items="${noticelist}">
					<tr>
						<td><a class="noticeTitle" href="<c:url value="/teacher/notice/${noticelist.noticeId}"/>">${noticelist.noticeTitle}</a></td>
						<td class="noticeDate"> <fmt:formatDate pattern="YY'.'MM'.'dd" value="${noticelist.noticeDate}"/></td>
					</tr>
						</c:forEach>
				</table>
				
				
            </div>
            </div>
</body>
</html>

<%@include file="../t_footer.jsp"%>