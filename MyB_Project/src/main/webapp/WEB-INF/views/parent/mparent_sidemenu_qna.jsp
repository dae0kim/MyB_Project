<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../p_header2.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sidemenuqna</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mobile/mparent_sidemenu_qna.css">    
</head>
<body>
<div class="wrap">
    <div class="title_wrap">
		<div id="title_name" style="font-weight : 700;">1:1 문의</div>
		<input type="button" value="글 쓰기" onClick="location.href='${pageContext.request.contextPath}/parent/mparent_sidemenu_qnawrite'">	
	</div>
        	
	

   <div class="qna_wrap">
	        <table class="qna_table">
	                <tr>
	                    <th scope="cols" style="width:65%;">제목</th>
						<th scope="cols" style="width:25%;">날짜</th>	
						<th scope="cols" style="width:10%;">확인여부</th>	
	                </tr>
	            		<c:forEach var="complain" items="${complainList}">
		                <tr>
		                    <td scope="row">
		                    <a href="${pageContext.request.contextPath}/mparent_sidemenu_qnadetail/${complain.complainId}">${complain.complainTitle}</a>
		                    </td>
		                    <td scope="row"><fmt:formatDate  pattern="MM'월' dd'일'" value="${complain.complainDate}"/></td>
		                    <td scope="row">${complain.complainStat}</td>
		                </tr>
		         </c:forEach>   
	        </table>
    	</div>
    	
    </div>
    </div>
</body>
</html>

<%@include file="../p_footer.jsp"%>