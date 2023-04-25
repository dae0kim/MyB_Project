<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <div class="card">
                <form class="form-horizontal">
                    <div class="card-body">
                        <h4 class="card-title">공지사항 정보</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-2 text-right control-label col-form-label">제목</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${noticeVO.noticeTitle}" readonly>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-2 text-right control-label col-form-label">작성일</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="noticeDate" name="noticeDate" value="<fmt:formatDate value="${noticeVO.noticeDate}" pattern="YYYY-MM-dd HH:mm:ss"/>" readonly />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="lname" class="col-sm-2 text-right control-label col-form-label">내용</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" id="noticeContent" name="noticeContent" style="height:20rem;" readonly>${noticeVO.noticeContent}</textarea>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="sname" class="col-sm-2 text-right control-label col-form-label">상단 고정 여부</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="noticeStat" value="${noticeVO.noticeStat}" readonly>
                            </div>
                        </div>
                        <input type="hidden" name="adminId" value="${loginUser.adminId}">
                        <input type="hidden" id="noticeId" value="${noticeVO.noticeId}">
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                            <button type="button" class="btn btn-success" onclick="location.href='<c:url value='/notice/update/${noticeVO.noticeId}'/>'">수정하기</button>
	                            <button type="button" class="btn btn-danger" onclick="deleteConfirm()">삭제하기</button>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/notice/list/${loginUser.adminId}'/>'">돌아가기</button>
	                        </div>
	                    </div>
                    </div>
                </form>
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
	
	var noticeId = $('#noticeId').val();		
	
	// 삭제 버튼 누를 때
	function deleteConfirm(){
		if(confirm("공지사항을 삭제하시겠습니까?") == true){
			alert("공지사항이 삭제되었습니다.");			
			location.href="../delete/"+noticeId;
		}else{			
			alert("취소되었습니다.");
		}
	}
	
</script>
</body>
</html>

