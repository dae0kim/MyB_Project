<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">Dashboard</h4>
                    </div>
                </div>
             </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Sales Cards  -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/classroom/namelist/${loginUser.adminId}' />">
                            <div class="box bg-cyan text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-chalkboard"></i></h1>
                                <h6 class="text-white">반 관리</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/teacher/list/${loginUser.adminId}' />">
                            <div class="box bg-success text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-chalkboard-user"></i></h1>
                                <h6 class="text-white">교사 관리</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                     <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                            <a href="<c:url value='/complain/list/${loginUser.adminId}' />">
                            <div class="box bg-warning text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-comments"></i></h1>
                                <h6 class="text-white">1:1문의</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/notice/list/${loginUser.adminId}' />">
                            <div class="box bg-danger text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-clipboard-list"></i></h1>
                                <h6 class="text-white">공지사항</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                            <a href="<c:url value='/kindergarten/chart/${loginUser.adminId}' />">
                            <div class="box bg-info text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-person-circle-question"></i></h1>
                                <h6 class="text-white">출결 통계</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                    <!-- Column -->
                    <div class="col-md-6 col-lg-2 col-xlg-3">
                        <div class="card card-hover">
                        	<a href="<c:url value='/diseaselog/check' />">
                            <div class="box bg-danger text-center">
                                <h1 class="font-light text-white"><i class="fa-solid fa-virus-covid"></i></h1>
                                <h6 class="text-white">질병 통계</h6>
                            </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- accoridan part -->
                <div class="accordion" id="accordionExample">
                <div class="page-breadcrumb" style="padding-left: 0px; padding-bottom: 17px;">
	                <div class="row">
	                    <div class="col-12 d-flex no-block align-items-center">
	                        <h4 class="page-title">서비스 이용 메뉴얼</h4>
	                    </div>
	                </div>
	            </div>
                    <div class="card m-b-0" style="margin-bottom:0px;">
                        <div class="card-header" id="headingOne">
                          <h5 class="mb-0">
                            <a  data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="m-r-5 fa fa-circle-info" aria-hidden="true"></i>
                                <span>반 관리 & 교사 관리</span>
                            </a>
                          </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                          <div class="card-body">
                          	<p>
                          		[반 관리]<br>
                          		어린이집의 반을 등록할 수 있습니다. 
                          		원장님이 등록하신 반은 부모님이 자녀 정보를 기입할 때 반 선택 목록에서 보여지게 됩니다.
                          	</p>
                          	<p>
                          		[교사 관리]<br>
                          		어린이집에 소속된 교사 정보를 조회,등록,수정,삭제할 수 있습니다. 
                          		교사 등록시 앱 사용을 위한 계정을 만들어줄 수 있습니다.
                          	</p>
                          </div>
                        </div>
                    </div>
                    
                    <div class="card m-b-0 border-top" style="margin-bottom:0px;">
                        <div class="card-header" id="headingTwo">
                          <h5 class="mb-0">
                            <a class="collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <i class="m-r-5 fa fa-circle-info" aria-hidden="true"></i>
                                <span>1:1문의 & 공지사항</span>
                            </a>
                          </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                          <div class="card-body">
                          	<p>
                          		[1:1문의]<br>
                          		학부모가 등록한 1:1문의 게시물을 확인할 수 있습니다. 
                          		처리상태를 변경하여 확인한 게시물임을 알 수 있습니다.
                          	</p>
                          	<p>
                          		[공지사항]<br>
                          		어린이집의 공지사항을 조회,등록,수정,삭제할 수 있습니다.
                          		상단 고정 여부를 선택하여 공지사항 목록의 최상단에 특정 공지사항을 보여줄 수 있습니다.
                          	</p>
                          </div>
                        </div>
                    </div> 
                    <div class="card m-b-0 border-top">
                        <div class="card-header" id="headingThree">
                          <h5 class="mb-0">
                            <a class="collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="m-r-5 fa fa-circle-info" aria-hidden="true"></i>
                                <span>출결통계 & 질병통계</span>
                            </a>
                          </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                          <div class="card-body">
                          	<p>
                          		[출결통계]<br>
                          		어린이집 원생들의 출결상태를 그래프로 확인할 수 있습니다.
                          		모든 반의 총원,결석인원,출석인원을 볼 수 있습니다.
                          		반을 선택하여 조회하면 해당 반 원생들이 어떤 질병으로 인해 결석했는지 확인할 수 있습니다. 
                          	</p>
                          	<p>
                          		[질병통계]<br>
                          		서울시 각 구별 어린이들의 질병 발생 현황을 확인할 수 있습니다.
                          		조회를 원하는 구를 지도에서 클릭하면 해당 구에서 어떤 질병이 유행중인지 확인할 수 있습니다.
                          	</p>
                          </div>
                        </div>
                    </div>
                </div>
            	<!-- card new -->
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title m-b-0">서비스 이용시 주의사항</h4>
                    </div>
                    <ul class="list-style-none">
                        <li class="card-body">
                            <a class="m-b-0 p-0">
                                <div class="d-flex no-block">
                                    <i class="fa fa-1 w-30px m-t-5"></i>
                                    <div>
                                        <span class="font-bold">모든 메뉴</span>는 <span class="font-bold"> 어린이집 등록 이후</span>
                                        <span>사용이 가능합니다.</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="card-body border-top">
                            <a class="m-b-0 p-0">
                                <div class="d-flex no-block">
                                    <i class="fa fa-2 w-30px m-t-5"></i>
                                    <div>
                                        <span class="font-bold">어린이집 등록 승인</span>은   
                                        <span>3~5일이 소요됩니다.</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="card-body border-top">
                            <a class="m-b-0 p-0">
                                <div class="d-flex no-block">
                                    <i class="fa fa-3 w-30px m-t-5"></i>
                                    <div>
                                        <span class="font-bold">등록 거절</span>은 별도의 알림 없이 이루어 집니다. 
                                        <span>제출하신 서류와 기입한 내용을 다시 한 번 확인하여 재신청 해주세요.</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="card-body border-top">
                            <a class="m-b-0 p-0">
                                <div class="d-flex no-block">
                                    <i class="fa fa-4 w-30px m-t-5"></i>
                                    <div>
                                        <span class="font-bold">교사 등록 전에</span> 반 등록이
                                        <span>선행되어야 합니다.</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="card-body border-top">
                            <a class="m-b-0 p-0">
                                <div class="d-flex no-block">
                                    <i class="fa fa-5 w-30px m-t-5"></i>
                                    <div>
                                        <span class="font-bold"> 불편사항 </span>발생 시 
                                        <span>페이지 하단을 통해 관리자에게 문의하세요.</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
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
    <!-- All Jquery -->
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
    <!--This page JavaScript -->
</body>
</html>

