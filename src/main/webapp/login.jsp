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
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
</head>

<body style="padding: 0px;padding-bottom: 0px;padding-right: 0px;padding-left: 0px;">
<input type = "hidden" id = "status" value= "<%= request.getAttribute("status") %>">
    <section class="position-relative py-4 py-xl-5">
        <div class="container">
            <div class="row d-flex justify-content-center" style="margin-top: 50px;margin-bottom: 50px;">
                <div class="col-md-6 col-xl-4">
                    <div class="card mb-5">
                        <div style="text-align: center;">
                            <h1 style="font-size: 30px;margin-top: 24px;">Login</h1>
                        </div>
                        <div class="card-body d-flex flex-column align-items-center" style="padding-top: 0px;">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4" style="background: #41d7fb;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"></path>
                                </svg></div>
                            <form class="text-center" method="post" action="LoginServlet" style="width: 300px;">
                                <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Email" required="required"></div>
                                <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Password" required="required"></div>
                                <div class="mb-3"><button class="btn btn-primary d-block w-100" type="submit" style="background: #41d7fb;border-color: #41d7fb;">Login</button></div>
                                <div class="mb-3"><a href="signup.jsp" style="border-color: rgb(0,0,0);color: rgb(0,0,0);">Create new account</a></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	
	<script type = "text/javascript">
		var status = document.getElementById("status").value;
		if(status == "successSignup"){
			swal("Congrats", "Account Create Successfully! Login now", "success");
		}
		if(status == "failed"){
			swal("Sorry", "Wrong Username or Password", "error");
		}
		if(status == "invalidEmail"){
			swal("Sorry", "Please enter Email", "error");
		}
		if(status == "invalidUpwd"){
			swal("Sorry", "Please enter Password", "error");
		}
	</script>
</body>
</html>