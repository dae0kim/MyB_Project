<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="../t_header.jsp" %>
<!DOCTYPE html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_join.css" rel="stylesheet">
</head>
<body>
    
    <div id="head_icon"><img src="../resources/images/logo.png"><b> 회원가입</b></div>


    <div class="join_wrap">
        <form id="login-form" action="<c:url value='/parent/mparent_join'/>" method="post">
            <input type="email" name="parentEmail" id="parentEmail" value="${parentVO.parentEmail}" placeholder="　Email" required>
            <input type="password" name="parentPw" id="parentPw" value="${parentVO.parentPw}" placeholder="　Password" required>
            <input type="password" name="parentPw_re" id="parentPw_re" placeholder="　Password2" required>
            <div id="joinstring">● 비밀번호는 8자 이상으로 해주세요<br>
            ● 영문, 숫자, 특수문자중 2가지 이상 혼합 해주세요.</div>
            
            <input type="text" name="parentName" id="parentName" value="${parentVO.parentName}" placeholder="　Name" required>
            <input type="text" name="parentPhone" id="parentPhone" value="${parentVO.parentPhone}" placeholder="　Phone" required>
            <!--  input type="text" name="parentRelation" id="parentRelation" value="" placeholder="　자녀와의 관계" disabled 
            style="width: 58%;
            height: 48px;
            box-sizing: border-box;
            margin-top: 20px;
            border-radius: 6px;
            background-color: #F8F8F8;"-->
            <select name="parentRelation" id="parentRelation" style="
            margin-top: 20px;
            height: 48px;
            width: 85%;
            border: 1px solid #999;
            font-family: inherit;
            background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;
            border-radius: 6px;" required>
                <option value="select">- 자녀와의 관계</option>
                <option value="엄마">엄마</option>
                <option value="아빠">아빠</option>
            </select>

            <div id="address">
               <select name="parentCity" id="parentCity" style="background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" required>
                   <option value="select">- 시 선택</option>
                   <option value="서울특별시">서울특별시</option>
                   <option value="부산광역시">부산광역시</option>
                   <option value="광주광역시">광주광역시</option>
               </select>
               <select name="parentGu" id="parentGu" style="background: url(../resources/images/arrow.jpg) no-repeat 95% 50%;" required>
                   <option value="select">- 구 선택</option>
                   <option value="동작구">동작구</option>
                   <option value="관악구">관악구</option>
                   <option value="강북구">강북구</option>
               </select>
           </div>

            <input type="submit" value="Join" onclick="joinCheck()">
        </form>
    </div>
</body>
</html>
<script>
function joinCheck() {
     alert("회원가입되었습니다");
}
</script>