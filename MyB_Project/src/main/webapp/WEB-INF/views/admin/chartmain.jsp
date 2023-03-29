<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <%@include file="staticFiles.jsp" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <%@include file="header.jsp" %>
	<div id="jb-content">
		<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
	</div>
	<h1>${gu}123</h1>
  <%@include file="footer.jsp" %>
  
  
<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  
    	  var jsonData = $.ajax({
              url: "http://localhost:8080/MyB_Project/diseaselog/chart/json/${gu}",
              dataType:"json",
              async: false
              }).responseText;

    	  var data = new google.visualization.DataTable(jsonData);
    	  console.log("데이터 테이블 :" +data);
    	  
        var options = {
          title: '질병별 환자 수',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
</script>
</body>
</html>

