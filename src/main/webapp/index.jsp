<%
	session.setAttribute("deleteStatus",null);
session.setAttribute("updateStatus", null);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
</head>

<body style="border-color: rgba(33,37,41,0);" data-bs-spy="scroll" data-bs-target="#mainNav" data-bs-smooth-scroll="true">

    <input type = "hidden" id = "session_status" value= "<%= session.getAttribute("name") %>">
    <input type = "hidden" id = "status" value= "<%= request.getAttribute("status") %>">
    <nav class="navbar navbar-light navbar-expand-md sticky-top navbar-shrink py-3" id="mainNav" style="background: #ffffff;">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><img src="assets/img/logo_text%20copy.png" style="width: 40px;height: 40px;"><span style="margin-left: 5px;color: rgb(65,215,251);">Pin</span><span style="margin-left: 0px;color: rgb(39,191,227);">Price</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#aboutUs">About Us</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#footerSection">Contact Us</a></li>
                </ul><a class="btn btn-primary shadow" id="login_btn" role="button" href="login.jsp" style="background: var(--bs-cyan);border-color: rgba(255,255,255,0);">Login</a>
                <div id="logout_div"><a class="btn btn-primary shadow" role="button" style="background: var(--bs-cyan);border-color: rgba(255,255,255,0); margin-right: 10px;" href="LogoutServlet">Logout<i class="icon ion-log-out" style="font-size: 16px;margin-left: 5px;"></i></a><a class="btn btn-primary shadow" role="button" style="background: #41d7fb;color: #ffffff;margin-right: 10px;border-width: 2px;border-color: #27bfe3;" href="productList.jsp">Trackings</a><a class="btn btn-primary shadow" role="button" style="background: #ffffff;color: #41d7fb;border-width: 2px;border-color: rgb(65,215,251);"><%= session.getAttribute("name") %></a></div>
            </div>
        </div>
    </nav>
    <header class="pt-5">
        <div class="container pt-4 pt-xl-5" style="padding-top: 0px !important;">
            <div class="row pt-5">
                <div class="col-md-8 text-center text-md-start mx-auto">
                    <div class="text-center">
                        <h1 class="display-4 fw-bold mb-5">A tool which tracks your Product details.</h1>
                        <p class="fs-5 text-muted mb-5" style="margin-bottom: 30px! important;">Enter your product URL here</p>
                        <form class="d-flex justify-content-center flex-wrap" method="post" action="validateUrl">
                            <div class="shadow-lg mb-3"><input class="form-control" type="text" name="url" placeholder="Enter Product URL" style="width: 250px;"></div>
                            <div class="shadow-lg mb-3" style="margin-left: 10px;"><button class="btn btn-primary" type="submit" style="background: var(--bs-cyan);border-color: rgba(255,255,255,0);">Track</button></div>
                        </form>
                    </div>
                </div>
                <div class="col-12 col-lg-10 mx-auto">
                    <div class="text-center position-relative"><img class="img-fluid" src="assets/img/illustrations/meeting.svg" style="width: 800px;"></div>
                </div>
            </div>
        </div>
    </header>
    <section class="visible" id="aboutUs" style="background: #dbf9ff;margin-top: 50px;">
        <div class="container bg-primary-gradient py-5" data-bs-spy="scroll">
            <div class="row">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <p class="fw-bold text-success mb-2" style="color: var(--bs-info) !important;font-size: 20px;">Our Services</p>
                    <h3 class="fw-bold">What we can do for you</h3>
                </div>
            </div>
            <div class="py-5 p-lg-5">
                <div class="card" style="margin: auto;">
                    <div class="card-body text-center d-lg-flex" style="padding: 49px;width: auto;">
                        <p class="card-text" style="font-size: 25px;"><span style="color: rgb(0, 0, 0);">PinPrice is a free website that provides a graphical interface for viewing historical price charts for various e-commerce stores. It also assists you in determining the best time to purchase a product at the best price.</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="footerSection">
        <footer style="background: #e6fbff;margin-top: 50px;" data-bs-spy="scroll">
            <div class="row">
                <div class="col-sm-6 col-md-4 footer-navigation">
                    <h3><span style="margin-left: 5px;color: rgb(65,215,251);font-family: ABeeZee, sans-serif;">Pin</span><span style="margin-left: 0px;color: rgb(39,191,227);font-family: ABeeZee, sans-serif;">Price</span></h3>
                    <p class="company-name">Company Name © 2022</p>
                </div>
                <div class="col-sm-6 col-md-4 footer-contacts">
                    <div><span class="fa fa-map-marker footer-contacts-icon"> </span>
                        <p style="color: rgb(0,0,0);"> Mumbai, India</p>
                    </div>
                    <div><i class="fa fa-phone footer-contacts-icon"></i>
                        <p class="footer-center-info email text-start" style="color: rgb(0,0,0);"> +91 7378840560</p>
                    </div>
                    <div><i class="fa fa-envelope footer-contacts-icon"></i>
                        <p> <a href="#" target="_blank" style="border-color: rgba(194,206,227,0);color: var(--bs-info);">pareshdmahajan1@gmail.com</a></p>
                    </div>
                </div>
                <div class="col-md-4 footer-about">
                    <h4 style="color: rgb(0,0,0);">About the company</h4>
                    <p>PinPrice is a free website that provides a graphical interface for viewing historical price charts for various e-commerce stores. It also assists you in determining the best time to purchase a product at the best price.</p>
                    <div class="social-links social-icons"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-linkedin"></i></a><a href="#"><i class="fa fa-github"></i></a></div>
                </div>
            </div>
        </footer>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    
    <script type = "text/javascript">
		var session_status = document.getElementById("session_status").value;
		var status = document.getElementById("status").value;
		if(session_status == "null"){
			document.getElementById("logout_div").style.display = "none";
		}
		if(session_status != "null"){
			document.getElementById("login_btn").style.display = "none";
		}
		if(status=="invalidLogin"){
			swal("Sorry", "Login First", "error");
		}
		if(status=="invalidAmazonUrl"){
			swal("Sorry", "Invalid Amazon Product URL", "error");
		}
		if(status == "productSuccess"){
			swal("Congrats", "Product Added Successfully", "success");
		}
	</script>
</body>

</html>