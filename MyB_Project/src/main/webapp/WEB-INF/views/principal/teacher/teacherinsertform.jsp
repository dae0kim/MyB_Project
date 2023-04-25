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
                <form id="join-form" class="form-horizontal" action="<c:url value='/teacher/insert'/>" method="post">
                    <div class="card-body">
                        <h4 class="card-title">교사 정보 등록</h4>
                        
                        <div class="form-group row">
                            <label for="fname" class="col-sm-2 text-right control-label col-form-label">이름</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherName" name="teacherName" required>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="bname" class="col-sm-2 text-right control-label col-form-label">이메일</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherEmail" name="teacherEmail" onkeyup="noSpace(this);" onchange="noSpace(this);" required />
                            </div>
                            <div class="web_join_warning_text">
	                   	        <!-- email 중복 체크 -->
								<span class="email_already">해당 이메일이 이미 존재합니다.</span>
								<!-- email 정규식 체크 -->
								<span class="email_validation">이메일 형식대로 입력해주세요.</span>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="cname" class="col-sm-2 text-right control-label col-form-label">비밀번호</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherPw" name="teacherPw" required/>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="cname" class="col-sm-2 text-right control-label col-form-label">연락처</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="teacherPhone" name="teacherPhone" placeholder="　('-'없이 번호만 입력)" oninput="autoHyphen(this)" maxlength="13" required/>
                            </div>
                            <div class="web_join_warning_text">
	                            <span class="phone_already">해당 번호가 이미 존재합니다.</span>
                            </div> 
                        </div>

                        <div class="form-group row">
                            <label for="dname" class="col-sm-2 text-right control-label col-form-label">담당교실</label>
                            <div class="col-sm-6">
                            	<select name="classroomId" class="select2 form-control custom-select" style="width: 40%; height:36px;">
									<c:forEach items="${classroomList}" var="classroomList">
										<option value="${classroomList.classroomId}">${classroomList.classroomName}</option>
									</c:forEach>
								</select>
                            </div>
                        </div>
                        <input type="hidden" name="adminId" value="${loginUser.adminId}">
                        <input type="hidden" name="kindergartenId" value="${kindergartenId}">
                        
	                    <div class="border-top">
	                        <div class="card-body">
	                        	<button type="button" id="join_btn" class="btn btn-success">등록하기</button>
	                            <button type="button" class="btn btn-secondary" onclick="location.href='<c:url value='/teacher/list/${loginUser.adminId}'/>'">돌아가기</button>
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
	var emailokCheck = false;
	var emailvalCheck =false;
	var phoneokCheck = false;
	
	$(document).ready(function() {	
		$("#join_btn").click(function() {
			
			if(emailokCheck&&phoneokCheck) {
				$("#join-form").attr("action", "./insert");
				$("#join-form").submit();
				alert("교사 정보 등록이 완료되었습니다.");
			}else{
				alert("기입하신 정보를 확인해주세요.");				
			}
			return false;
		});
	});
	
	// 이메일 중복검사
	$('#teacherEmail').on("focusout", function() {
		var email = $('#teacherEmail').val(); // teacherEmail에 입력되는 값
		var data = {email : email} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
		$.ajax({
			type : "post",
			url : "<c:url value='/device/userEmailChk'/>",
			data : data,
			success : function(result) {
				if(result != 'fail') {
					$('.email_ok').css("display", "inline-block");
					$('.email_already').css("display", "none");
					emailokCheck = true;
				} else {
					$('.email_already').css("display", "inline-block");
					$('.email_ok').css("display", "none");
					emailokCheck = false;
				}
			}
		});
	});
	
	// 이메일 정규식 검사
	$('#teacherEmail').on("propertychange change keyup paste input", function() {
		var email = $('#teacherEmail').val();
		var reg = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]$/i;
		
		if(email.match(reg) == null) { // 조건 불충족
			$('.email_validation').css('display', 'block');
			emailvalCheck = false;
		} else {
			$('.email_validation').css('display', 'none');
			emailvalCheck = true;
		}
	});
	
	// 휴대폰 번호 하이픈 자동추가
	const autoHyphen = (target) => {
		 target.value = target.value
		 .replace(/[^0-9]/g, '')
		 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
	// 휴대폰 번호 중복검사
	$('#teacherPhone').on("focusout", function() {
		var phone = $('#teacherPhone').val(); // parentEmail_input에 입력되는 값
		var data = {phone : phone} // 컨트롤에 넘길 데이터 이름 : 데이터(입력값)
		
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

