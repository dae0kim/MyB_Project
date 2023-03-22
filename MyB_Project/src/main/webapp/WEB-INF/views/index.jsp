<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <title>MyB</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    
    <link href='https://fonts.googleapis.com/css?family=Nanum Gothic' rel='stylesheet'>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/web/index.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
          <a class="navbar-brand" href="#myPage">MyB</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#about">ABOUT</a></li>
            <li><a href="#services">SERVICES</a></li>
            <li><a href="<c:url value='/login' />">LOGIN</a></li>
            <li><a href="<c:url value='/principal/join' />">JOIN</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="jumbotron text-center">
      <h1>Company</h1>
      <p>We specialize in blablabla</p>
    </div>

    <!-- Container (About Section) -->
    <div id="about" class="container-fluid">
      <div class="row">
        <div class="col-sm-8">
          <h2>About Company Page</h2>
          <br />
          <h4>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat.
          </h4>
          <br />
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
            aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat
            non proident, sunt in culpa qui officia deserunt mollit anim id est
            laborum consectetur adipiscing elit, sed do eiusmod tempor
            incididunt ut labore et dolore magna aliqua. Ut enim ad minim
            veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
            ea commodo consequat.
          </p>
          <br />
        </div>
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-signal logo"></span>
        </div>
      </div>
    </div>

    <div class="container-fluid bg-grey">
      <div class="row">
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-globe logo slideanim"></span>
        </div>
        <div class="col-sm-8">
          <h2>Our Values</h2>
          <br />
          <h4>
            <strong>MISSION:</strong> Our mission lorem ipsum dolor sit amet,
            consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
            exercitation ullamco laboris nisi ut aliquip ex ea commodo
            consequat.
          </h4>
          <br />
          <p>
            <strong>VISION:</strong> Our vision Lorem ipsum dolor sit amet,
            consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
            labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
            exercitation ullamco laboris nisi ut aliquip ex ea commodo
            consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit,
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
            nisi ut aliquip ex ea commodo consequat.
          </p>
        </div>
      </div>
    </div>

    <!-- Container (Services Section) -->
    <div id="services" class="container-fluid text-center">
      <h2>SERVICES</h2>
      <h4>What we offer</h4>
      <br />
      <div class="row slideanim">
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-off logo-small"></span>
          <h4>POWER</h4>
          <p>Lorem ipsum dolor sit amet..</p>
        </div>
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-heart logo-small"></span>
          <h4>LOVE</h4>
          <p>Lorem ipsum dolor sit amet..</p>
        </div>
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-lock logo-small"></span>
          <h4>JOB DONE</h4>
          <p>Lorem ipsum dolor sit amet..</p>
        </div>
      </div>
      <br /><br />
      <div class="row slideanim">
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-leaf logo-small"></span>
          <h4>GREEN</h4>
          <p>Lorem ipsum dolor sit amet..</p>
        </div>
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-certificate logo-small"></span>
          <h4>CERTIFIED</h4>
          <p>Lorem ipsum dolor sit amet..</p>
        </div>
        <div class="col-sm-4">
          <span class="glyphicon glyphicon-wrench logo-small"></span>
          <h4 style="color: #303030">HARD WORK</h4>
          <p>Lorem ipsum dolor sit amet..</p>
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
          <p>Contact us and we'll get back to you within 24 hours.</p>
          <p>
            <span class="glyphicon glyphicon-map-marker"></span> Chicago, US
          </p>
          <p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
          <p>
            <span class="glyphicon glyphicon-envelope"></span>
            myemail@something.com
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

