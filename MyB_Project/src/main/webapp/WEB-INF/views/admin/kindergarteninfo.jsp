<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<%@include file="staticFiles.jsp" %>
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
		<%@include file="header.jsp" %>
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
            <div class="card" style="margin:10% 15% 10% 15%;">
                <form class="form-horizontal">
                    <div class="card-body">
                        <h4 class="card-title">요청사항 정보</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label">글 번호</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="kindergartenId" name="kindergartenId" value="${kindergartenVO.kindergartenId}" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-3 text-right control-label col-form-label">어린이집 이름</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="kindergartenName" name="kindergartenName" value="${kindergartenVO.kindergartenName}" readonly />
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">어린이집 전화번호</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="kindergartenPhone" name="kindergartenPhone" value="${kindergartenVO.kindergartenPhone}"  readonly/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">주소</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="kindergartenAddress" name="kindergartenAddress" value="${kindergartenVO.kindergartenAddress}"  readonly/>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="sname" class="col-sm-3 text-right control-label col-form-label">처리상태</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="kindergartenStat" value="${kindergartenVO.kindergartenStat}" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="sname" class="col-sm-3 text-right control-label col-form-label">증명서류</label>
                            <div class="col-sm-5">
                                <c:set var="len" value="${fn:length(kindergartenVO.fileName)}"/>
								<c:set var="filetype" value="${fn:toUpperCase(fn:substring(kindergartenVO.fileName, len-4, len))}"/>
								<a href='<c:url value="/file/${kindergartenVO.fileId}"/>'>${kindergartenVO.fileName} (<fmt:formatNumber>${kindergartenVO.fileSize}</fmt:formatNumber>byte)</a>
                            </div>
                        </div>
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                        	<c:choose>
									<c:when test="${kindergartenVO.kindergartenStat eq 'N'}">
										<input type="hidden" id="kindergartenId" value="${kindergartenVO.kindergartenId}">
			                            <button type="button" class="btn btn-success" onclick="approveConfirm()">등록승인</button>
			                            <button type="button" class="btn btn-danger" onclick="disapproveConfirm()">등록거부</button>
									</c:when>
								</c:choose>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/kindergarten/request/list'/>'">돌아가기</button>
	                        </div>
	                    </div>
                    </div>
                </form>
            </div>
            </div>    
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        	<%@include file="footer.jsp" %>
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
	
	var kindergartenId = $('#kindergartenId').val();		

	// 승인 버튼 누를 때
	function approveConfirm(){
		if(confirm("어린이집 등록을 승인하시겠습니까?") == true){
			alert("승인이 완료되었습니다.");			
			location.href="../approve/"+kindergartenId;
		}else{			
			alert("취소되었습니다.");
		}
	}
	// 거부 버튼 누를 때
	function disapproveConfirm(){
		if(confirm("어린이집 등록을 거부하시겠습니까?") == true){
			alert("거부가 완료되었습니다.");
			location.href="../disapprove/"+kindergartenId;
		}else{
			alert("취소되었습니다.");
		}
	}
	
</script>
</body>
</html>

