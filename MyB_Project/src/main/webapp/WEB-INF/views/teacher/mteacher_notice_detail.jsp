<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../t_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
     <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/css/mobile/mteacher_notice_detail.css" rel="stylesheet">
</head>

<body>
		<div class="noticedetailtitle_wrap">
        <div id="noticedetail_title" style="font-weight : 700;">공지사항</div>
        <div id="noticedetail_btn">
            <button type="button"><a href='<c:url value="./mteacher_web_main" />'>돌아가기</a></button>
        </div>
        </div>

    <div class="noticedetailcontent_wrap">
    	<div>
              <div id="notice_box">
                <table>
                    <thead>
                        <tr>
                            <td scope="col">제목</td>
                            <td scope="col">날짜</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td scope="row">제목입니다</td>
                            <td scope="row">230317</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
    </div>
</body>



</html>