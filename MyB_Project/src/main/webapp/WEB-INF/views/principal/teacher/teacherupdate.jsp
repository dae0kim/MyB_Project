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
            <div class="card" style="margin:10% 15% 10% 15%;">
                <form id="join-form" class="form-horizontal" action="<c:url value='/teacher/update'/>" method="post">
                    <div class="card-body">
                        <h4 class="card-title">교사 정보 수정</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-3 text-right control-label col-form-label">이름</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="teacherName" name="teacherName" value="${teacherInfo.teacherName}" required>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-3 text-right control-label col-form-label">이메일</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="teacherEmail" name="teacherEmail" value="${teacherInfo.teacherEmail}" readonly />
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">비밀번호</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="teacherPw" name="teacherPw" value="${teacherInfo.teacherPw}" required/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cname" class="col-sm-3 text-right control-label col-form-label">연락처</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="teacherPhone" name="teacherPhone" value="${teacherInfo.teacherPhone}" placeholder="　('-'없이 번호만 입력)" oninput="autoHyphen(this)" maxlength="13" autofocus required/>
                            </div>
                            <div class="web_join_warning_text">
	                            <span class="phone_already">해당 번호가 이미 존재합니다.</span>
                            </div> 
                        </div>

                        <div class="form-group row">
                            <label for="dname" class="col-sm-3 text-right control-label col-form-label">담당교실</label>
                            <div class="col-sm-5">
                            	<select name="classroomId" class="select2 form-control custom-select" style="width: 40%; height:36px;">
									<c:forEach items="${classroomList}" var="classroomList">
										<option value="${classroomList.classroomId}">${classroomList.classroomName}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        <input type="hidden" name="teacherId" value="${teacherId}">
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                        	<button type="button" id="join_btn" class="btn btn-success">저장하기</button>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/teacher/info/${teacherInfo.teacherId}'/>'">돌아가기</button>
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
	
	// 유효성 검사 체크
	var phoneokCheck = false;
	
	$(document).ready(function() {	
		$("#join_btn").click(function() {
			
			if(phoneokCheck) {
				$("#join-form").attr("action", "../update");
				$("#join-form").submit();
				alert("교사 정보 수정이 완료되었습니다.");
			}else{
				alert("기입하신 정보를 확인해주세요.");				
			}
			return false;
		});
	});
	
	// 휴대폰 번호 하이픈 자동추가
	const autoHyphen = (target) => {
		 target.value = target.value
		 .replace(/[^0-9]/g, '')
		 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 기존 연락처
	var nowPhone = $('#teacherPhone').val();
	
	// 휴대폰 번호 중복검사
	$('#teacherPhone').on("focusout", function() {
		var phone = $('#teacherPhone').val(); // parentEmail_input에 입력되는 값
		var data = {phone : phone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
				
		if(nowPhone != phone){
			$.ajax({
				type : "post",
				url : "<c:url value='/device/userPhoneChk'/>",
				data : data,
				success : function(result) {
					if(result != 'fail') {
						$('.phone_already').css("display", "none");
						phoneokCheck = true;
					} else {
						$('.phone_already').css("display", "inline-block");
						phoneokCheck = false;
					}
				}
			});			
		}else{
			phoneokCheck = true;
		}
	});
	
	
	// 공백제거
	function noSpace(obj) {
	    var str_space = /\s/; //공백 체크
	    if(str_space.exec(obj.value)) { 
	        obj.focus();
	        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
	        return false;
    	}
	}
	
</script>
</body>
</html>

