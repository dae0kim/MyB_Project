<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Alarm List</title>
</head>
<body>
	<h1>Alarm List</h1>
	<table>
		<thead>
			<tr>
				<th>Alarm ID</th>
				<th>Parent Id</th>
				<th>Message</th>
				<th>Send Date</th>
				<th>Checked</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${alarms}" var="alarm">
				<tr>
					<td>${alarm.alarmId}</td>
					<td>${alarm.parentId}</td>
					<td>${alarm.alarmMessage}</td>
					<td>${alarm.alarmDate}</td>
					<td>${alarm.alarmChecked}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onClick="location.href='javascript:history.back();'">돌아가기</button>


</body>
</html>
