<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">>
    <title>sidemenuqna</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qna.css">    
</head>
<body>
    <div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">1:1 문의</div>
		<input type="button" value="문의하기" onClick="location.href='./mparent_sidemenu_qnawrite'">	
	</div>
	<div id="sidemenuqna_subtitle">어린이집에 대한 문의 및 불편사항을 적어주세요.</div>
	
    <div class="sidemenuqna_wrap">
    	<div class="sidemenuqnacontent_wrap">
	        <table>
	            <thead>
	                <tr>
	                    <td scope="col" style="padding-left:50px; padding-right:3px;">제목</td>
	                    <td scope="col" style="padding-left:50px; padding-right:3px;">날짜</td>
	                    <td scope="col" style="padding-left:50px; padding-right:3px;">상태</td>
	                </tr>
	            </thead>
	            <c:forEach var="complain" items="${complainList}">
		            <tbody>
		                <tr>
		                    <td scope="row" style="padding-left:10px; padding-right:3px; white-space:nowrap; text-overflow:ellipsis; overflow:hidden;">
		                    	<a href="./mparent_sidemenu_qnadetail/${complain.complainId}">${complain.complainTitle}</a>
		                    </td>
		                    <td scope="row" style="padding-left:10px; padding-right:3px;">${complain.complainDate}</td>
		                    <td scope="row" style="padding-left:10px; padding-right:3px;">${complain.complainStat}</td>
		                </tr>
		            </tbody>
		         </c:forEach>   
	        </table>
    	</div>
    	
    </div>
    
</body>
</html>