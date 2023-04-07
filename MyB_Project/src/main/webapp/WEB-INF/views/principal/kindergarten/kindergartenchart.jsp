<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../staticFiles.jsp" %>
<body>
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
		<%@include file="../header.jsp" %>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
            	<input type="hidden" id="kindergartenId" value="${kindergartenId}">
				<div id="web_classroom_chart_title_container">
				  	<div id="web_classroom_chart_title">
				  		어린이집 출결 현황
				  	</div>
				  	<div id="web_classroom_chart_subtitle">
				  		[금일 데이터를 제공합니다]
				  	</div>
			  	</div>
				
				<div id="columnchart_material"></div>
				<div id="web_classroom_select">
					<select id="classroomDropBox" class="select2 form-control custom-select" style="width: 10%; height:36px;">
						<c:forEach items="${classroomNameList}" var="classroomNameList">
							<option value="${classroomNameList.classroomId}">${classroomNameList.classroomName}</option>
						</c:forEach>
					</select>
					<button type="button" class="btn btn-success" onclick="classroomChk()">조회</button>
				</div>
				<div id="web_classroom_chart_container">
					<div id="web_classroom_chart_title_container">
					  	<div id="web_classroom_chart_title">
					  		질병별 환자 수
					  	</div>
					  	<div id="web_classroom_chart_subtitle">
					  		[부제목]
					  	</div>
				  	</div>
				  	<div id="piechart2_3d"></div>
				</div>
            </div>    
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        	<%@include file="../footer.jsp" %>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- All Required js -->
	<!-- ============================================================== -->
	<script src="${pageContext.request.contextPath}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/custom.min.js"></script>
	<script>
	$('[data-toggle="tooltip"]').tooltip();
	$(".preloader").fadeOut();
	</script>
	<script type="text/javascript">

		// 차트 그리기
		google.charts.load('current', {'packages':['bar']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
		  var kindergartenId = $('#kindergartenId').val();
		  
		  var jsonData = $.ajax({
		      url: "http://localhost:8080/MyB_Project/kindergarten/chart/json/"+kindergartenId,
		      dataType:"json",
		      async: false
		      }).responseText;
		  
		  var data = new google.visualization.DataTable(jsonData);
		
		  console.log(data);
		  
		  
		  var options = {
		    chart: {
		      title: '',
		      subtitle: '',
		      fontSize: 20,
		    }
		  };
		
		  var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
		
		  chart.draw(data, google.charts.Bar.convertOptions(options));
		}	
		
		//각 반별 차트
		var classroomId=0;
		
		function classroomChk(){
			classroomId = $("#classroomDropBox option:selected").val();
			console.log(classroomId);
			
			redraw(classroomId);
			getShow();
		}
		
		function redraw(classroomId){
		    google.charts.load("current", {packages:["corechart"]});
		    google.charts.setOnLoadCallback(drawChart2);
		    function drawChart2() {
		  	  
		  	  var jsonData2 = $.ajax({
		            url: "http://localhost:8080/MyB_Project/kindergarten/classroom/chart/json/"+classroomId,
		            dataType:"json",
		            async: false
		            }).responseText;
		
		  	  var data2 = new google.visualization.DataTable(jsonData2);
		  	  console.log("데이터 테이블2 :" +data2);
		  	  
		      var options = {
		    	legend: 'right',		
		        fontSize: 20,
		        is3D: true,
		      };
		
		      var chart = new google.visualization.PieChart(document.getElementById('piechart2_3d'));
		      chart.draw(data2, options);
		    } 	  
		}
		
		function getShow(){
		 document.getElementById("web_classroom_chart_container").style.display = "block";
		}
	</script>	
</body>
</html>

