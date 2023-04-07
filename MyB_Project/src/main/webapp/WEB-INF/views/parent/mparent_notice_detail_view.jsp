<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/all_notice_detail.css" rel="stylesheet">
</head>

<body>
	<div class="wrap">
		<div class="title_wrap">
        <div id="title_name" style="font-weight : 700;">공지사항</div>
        <div id="noticedetail_btn">
            <button type="button" onclick = "location.href = '${pageContext.request.contextPath}/parent/mparent_web_main' ">돌아가기</button>
        </div>
        </div>


    <div class="noticedetailcontent_wrap">
    	<div>
              <div id="notice_box">
                <table class="notice_table">
					<tr>
						<td class="noticeId">${noticeview.noticeId}</td>
					</tr>
					<tr>
						<td class="noticeDate"> <fmt:formatDate pattern="yyyy-MM-dd" value="${noticeview.noticeDate}"/></td>
					</tr>
					<tr>
						<td class="noticeTitle">${noticeview.noticeTitle}</td>
					</tr>
					<tr>
						<th class="noticeContent">${noticeview.noticeContent}</th>
					</tr>
				</table>
            </div>
            </div>
    </div>
    </div>
</body>
</html>


<%@include file="../p_footer.jsp"%>