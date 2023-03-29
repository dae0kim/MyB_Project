<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="title_wrap">
		<div id="title_name" style="font-weight: 700;">요청사항 상세</div>
	</div>
	
	<div>${getCheckDetail}</div>
	<div>요청 id ${getCheckDetail.requestId}</div>
	<div>요청 1 ${getCheckDetail.requestContent1}</div>
	<div>요청 2 ${getCheckDetail.requestContent2}</div>
	<div>요청 3 ${getCheckDetail.requestContent3}</div>
	<div>요청 4 ${getCheckDetail.requestContent4}</div>
	<div>요청 5 ${getCheckDetail.requestContent5}</div>

	

	
	

</body>

</html>