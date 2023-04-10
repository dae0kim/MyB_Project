<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>MyB</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/webicons/favicon.png">
    
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    
    <link href='https://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/web/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <script src="https://kit.fontawesome.com/a566e7b2bd.js" crossorigin="anonymous"></script>
  </head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button
            type="button"
            class="navbar-toggle"
            data-toggle="collapse"
            data-target="#myNavbar"
          >
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#myPage">
          	<img alt="index_logo" id="web_index_logo" src="${pageContext.request.contextPath}/resources/images/webicons/favicon.png">
          	<span id="index_logo_text">MyB</span>
          </a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#about"><span class="index_nav_text">ABOUT</span></a></li>
            <li><a href="#services"><span class="index_nav_text">SERVICES</span></a></li>
            <li><a href="<c:url value='/login' />"><span class="index_nav_text">LOGIN</span></a></li>
            <li><a href="<c:url value='/principal/joinform' />"><span class="index_nav_text">JOIN</span></a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="jumbotron text-center">
    	<div id="web_main_title" class="web_main_top">
	      <p>사랑하는 내 아이를 위한 서비스</p>    	
	      <h1>MyB</h1>
    	</div>
    	<div id="web_main_image" class="web_main_top">
    		<img id="web_main_webp" alt="main image" src="<c:url value='/resources/images/web/visual_main.webp' />">
    	</div>
    </div>

    <div id="about" class="container-fluid">
      <div class="row">
        <div class="col-sm-8">
          <h2>원과 가정을 연결하는 소통 파트너</h2>
          <br />
          <h4>
            아이를 위한 부모님의 마음도, 선생님의 진심도 마이비는 다 아니까.
			두 마음을 이어주는 올바른 소통방법, MyB
          </h4>
          <br />
          <br />
        </div>
        <div class="col-sm-4">
          <i id="check_icon" class="fa-solid fa-list-check slideanim"></i>
        </div>
      </div>
    </div>

    <div class="container-fluid bg-grey">
      <div class="row">
        <div class="col-sm-4">
          <i id="bell_icon" class="fa-solid fa-bell slideanim"></i>
        </div>
        <div class="col-sm-8">
          <h2>아이를 위한 질병 알림 서비스를 받아보세요</h2>
          <br />
          <h4>
            같은 구 단위 내에 여러 어린이집으로부터 각종 질병에 걸린 원생들의 데이터를 수집하고,이를 활용하여
            현재 어떤 질병이 유행중인지 파악합니다.<br>
            이 정보는 알림 서비스를 통해 지역 사용자들에게 전달됩니다.
          </h4>
          <br />
        </div>
      </div>
    </div>

    <div id="services" class="container-fluid text-center">
      <h2>서비스</h2>
      <h4>왜 마이비를 사용해야 할까요?</h4>
      <br />
      <div class="row slideanim">
        <div class="col-sm-4">
          <i class="fa-solid fa-list logo-small"></i>
          <h4>요청사항</h4>
          <p>자녀 관리에 필요한 요청사항을 간편하게 공유합니다</p>
        </div>
        <div class="col-sm-4">
          <i class="fa-solid fa-virus-slash logo-small"></i>
          <h4>질병 알림</h4>
          <p>같은 지역 내 유행성 질병을 파악할 수 있습니다.</p>
        </div>
        <div class="col-sm-4">
          <i class="fa-solid fa-house-user logo-small"></i>
          <h4>원 관리</h4>
          <p>원장님은 보다 간편하게 원 관리를 할 수 있습니다.</p>
        </div>
      </div>
      <br /><br />
      <div class="row slideanim">
        <div class="col-sm-4">
          <i class="fa-solid fa-hand-holding-dollar logo-small"></i>
          <h4>비용</h4>
          <p>합리적인 비용으로 고품질 서비스를 받을 수 있습니다.</p>
        </div>
        <div class="col-sm-4">
          <i class="fa-solid fa-screwdriver-wrench logo-small"></i>
          <h4>편리성</h4>
          <p>사용자들의 불편사항을 없애기 위해 꾸준히 노력합니다.</p>
        </div>
        <div class="col-sm-4">
          <i class="fa-solid fa-chart-pie logo-small"></i>
          <h4>확실한 정보</h4>
          <p>수 많은 양질의 데이터를 활용하여 정확한 정보를 전달합니다.</p>
        </div>
      </div>
    </div>

    <footer class="container-fluid text-center">
      <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
      </a>
      <div id="contact" class="container-fluid bg-grey">
        <h2 class="text-center">CONTACT</h2>
        <div class="row">
          <p>24시간 내로 응답을 해드립니다.</p>
          <p>
            <span class="glyphicon glyphicon-map-marker"></span> Seoul, Republic of Korea
          </p>
          <p><span class="glyphicon glyphicon-phone"></span> +82 010-2818-3641</p>
          <p>
            <span class="glyphicon glyphicon-envelope"></span>
            myb@gmail.com
          </p>
        </div>
      </div>
    </footer>

    <script>
      $(document).ready(function () {
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#myPage']").on("click", function (event) {
          // Make sure this.hash has a value before overriding default behavior
          if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
            $("html, body").animate(
              {
                scrollTop: $(hash).offset().top,
              },
              900,
              function () {
                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
              }
            );
          } // End if
        });

        $(window).scroll(function () {
          $(".slideanim").each(function () {
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
            if (pos < winTop + 600) {
              $(this).addClass("slide");
            }
          });
        });
      });
    </script>
  </body>
</html>

