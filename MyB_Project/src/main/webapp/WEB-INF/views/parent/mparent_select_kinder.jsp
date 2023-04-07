<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <title>Document</title>
	<link href="${pageContext.request.contextPath}/resources/css/mobile/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/mobile/mparent_select_kinder.css" rel="stylesheet">
</head>
<body>
<div class="border">
	<form action="<c:url value='/parent/mparent_select_kinder'/>" role="search" method="post">
	   
		<div class="headgrid">
			<div id="login_logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png"></div>	
			<div id="textlow1"><b>어린이집 등록</b></div>
		</div>
		
		
		<div id="selectkinder">
	        <div id="address">
	            <select name="kindergartenCity" id="kindergartenCity" style="background-color: #F8F8F8;" onChange="chnGu(this.value)" required>
	                <option value="">시 선택</option>
	                <option value="서울">서울특별시</option>
	                <option value="부산">부산광역시</option>
	                <option value="광주">광주광역시</option>
	            </select>
	            <select name="kindergartenGu" id="kindergartenGu" style="background-color: #F8F8F8;"  required>
	                <option value="">구 선택</option>
	            </select>
	        </div>
	
	        <div id="search">
	            <input type="text" name="kindergartenNameKeyword" placeholder="어린이집 명 입력" required>
	            <input type="submit" value="조회" style="margin-left: 7px;">
	        </div>
	        
	        <hr>
		</div>
		
		
		
	
	<div id="kinderlist">
		<c:forEach var="kindergarten" items="${kindergartenList}">
			<div id="kindergartenlist" onclick="location.href='./mparent_select_class/${kindergarten.kindergartenId}'">
				<div class="kindername">${kindergarten.kindergartenName}</div>
				<div class="listtext"><p>${kindergarten.kindergartenAddress}</p></div>
				<div class="listtext">${kindergarten.kindergartenPhone}</div>
			</div>
		</c:forEach>
		<c:if test="${fn:length(kindergartenList) == 0}">
			<div id="nosearh">조회결과가 없습니다.</div>
		</c:if>
	</div>
	
	
	
	</form>
	</div>
	
		
    
<script type="text/javascript">
	//시 >> 구 선택
	function chnGu(type, select) {
		$('#kindergartenGu').empty();
		
		if(type == '서울') {
			$('#kindergartenGu').append("<option value=''>- 구 선택</option>'");
			$('#kindergartenGu').append("<option value='강남구'>강남구</option>'");
			$('#kindergartenGu').append("<option value='강동구'>강동구</option>'");
			$('#kindergartenGu').append("<option value='강북구'>강북구</option>'");
			$('#kindergartenGu').append("<option value='강서구'>강서구</option>'");
			$('#kindergartenGu').append("<option value='관악구'>관악구</option>'");
			$('#kindergartenGu').append("<option value='광진구'>광진구</option>'");
			$('#kindergartenGu').append("<option value='구로구'>구로구</option>'");
			$('#kindergartenGu').append("<option value='금천구'>금천구</option>'");
			$('#kindergartenGu').append("<option value='노원구'>노원구</option>'");
			$('#kindergartenGu').append("<option value='도봉구'>도봉구</option>'");
			$('#kindergartenGu').append("<option value='동대문구'>동대문구</option>'");
			$('#kindergartenGu').append("<option value='동작구'>동작구</option>'");
			$('#kindergartenGu').append("<option value='마포구'>마포구</option>'");
			$('#kindergartenGu').append("<option value='서대문구'>서대문구</option>'");
			$('#kindergartenGu').append("<option value='서초구'>서초구</option>'");
			$('#kindergartenGu').append("<option value='성동구'>성동구</option>'");
			$('#kindergartenGu').append("<option value='성북구'>성북구</option>'");
			$('#kindergartenGu').append("<option value='송파구'>송파구</option>'");
			$('#kindergartenGu').append("<option value='양천구'>양천구</option>'");
			$('#kindergartenGu').append("<option value='영등포구'>영등포구</option>'");
			$('#kindergartenGu').append("<option value='용산구'>용산구</option>'");
			$('#kindergartenGu').append("<option value='은평구'>은평구</option>'");
			$('#kindergartenGu').append("<option value='종로구'>종로구</option>'");
			$('#kindergartenGu').append("<option value='중구'>중구</option>'");
			$('#kindergartenGu').append("<option value='중랑구'>중랑구</option>'");
		} else {
			$('#kindergartenGu').append("<option value=''>- 구 선택</option>'");
		}
		
		document.getElementById("kindergartenGu").style.display = "";
		
		if ($.trim(select) != "") {
		        $('#kindergartenCity').val(type);
		        $('#kindergartenGu').val(select);
		}
	}
	
	document.form.submit();
</script>
    
</body>
</html>