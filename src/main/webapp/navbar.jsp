
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PinPrice</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
</head>

<body>
	<input type = "hidden" id = "session_status" value= "<%= session.getAttribute("name") %>">
    <nav class="navbar navbar-light navbar-expand-md sticky-top navbar-shrink py-3" id="mainNav" style="background: #ffffff;">
        <div class="container"><a class="navbar-brand d-flex align-items-center" href="/"><img src="assets/img/logo_text%20copy.png" style="width: 40px;height: 40px;"><span style="margin-left: 5px;color: rgb(65,215,251);">Pin</span><span style="margin-left: 0px;color: rgb(39,191,227);">Price</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#footerSection">Contact Us</a></li>
                </ul><a id ="login_btn" class="btn btn-primary shadow" role="button" href="login.jsp" style="background: var(--bs-cyan);border-color: rgba(255,255,255,0);">Login</a>
                <div id="logout_div"><a class="btn btn-primary shadow" role="button" style="background: var(--bs-cyan);border-color: rgba(255,255,255,0); margin-right: 10px;" href="LogoutServlet">Logout<i class="icon ion-log-out" style="font-size: 16px;margin-left: 5px;"></i></a><a class="btn btn-primary shadow" role="button" style="background: #41d7fb;color: #ffffff;margin-right: 10px;border-width: 2px;border-color: #27bfe3;" href="productList.jsp">Trackings</a><a class="btn btn-primary shadow" role="button" style="background: #ffffff;color: #41d7fb;border-width: 2px;border-color: rgb(65,215,251);"><%= session.getAttribute("name") %></a></div>
            </div>
        </div>
    </nav>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    
    <script type = "text/javascript">
		var session_status = document.getElementById("session_status").value;
		
		if(session_status == "null"){
			document.getElementById("logout_div").style.display = "none";
		}
		if(session_status != "null"){
			document.getElementById("login_btn").style.display = "none";
		}
	</script>
</body>
</html>