<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("name") == null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>PinPrice</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
</head>

<body>
<input type = "hidden" id = "session_status" value= "<%= session.getAttribute("name") %>">
    <input type = "hidden" id = "status" value= "<%= request.getAttribute("status") %>">
    <%@include file="navbar.jsp" %>
    <section style="margin: 30px;">
        <div class="container">
            <h1 class="display-4 fw-bold text-center mb-5" style="font-size: 40px;color: var(--bs-gray-800);">Product Details</h1>
            <div class="bg-dark border rounded border-0 border-dark overflow-hidden" style="width: auto;height: auto;background: rgb(255,255,255);">
                <div class="row g-0" style="background: #e6fbff;">
                    <div class="col-md-6 text-center d-lg-flex order-first justify-content-lg-center align-items-lg-center" style="background: #e6fbff;padding: 20px;padding-top: 20px;padding-bottom: 20px;">
                        <div class="d-lg-flex justify-content-lg-center align-items-lg-center" style="width: 100%;height: 100%;background: #ffffff;"><img class="d-lg-flex" width="100" height="80" style="width: 250px;height: auto;" src="<%=session.getAttribute("ProductImageURL")%>"></div>
                    </div>
                    <div class="col-md-6 order-first order-md-last" style="min-height: 250px;padding: 20px;padding-left: 20px;">
                        <div class="text-white p-4 p-md-5" style="transform: scale(1);text-align: center;color: var(--bs-info);background: #ffffff;">
                            <h4 class="text-start" style="color: rgb(27,27,27);border-color: rgb(255,255,255);text-align: center;font-size: 30px;"><span style="color: rgb(15, 17, 17);"><span style="color: rgb(15, 17, 17);"><%=session.getAttribute("ProductTitle") %></span></h4>
                            <div>
                                <h4 class="text-start float-start" style="color: var(--bs-red);border-color: rgb(255,255,255);text-align: center;font-size: 23px;width: auto;"><i class="fas fa-rupee-sign" style="color: var(--bs-red);margin-right: 5px;"></i><br></h4>
                                <h4 class="text-start" style="color: var(--bs-red);border-color: rgb(255,255,255);text-align: center;font-size: 23px;width: auto;"><%=session.getAttribute("ProductPrice") %></h4>
                            </div>
                            <h1 style="font-family: 'Open Sans', arial, sans-serif;color: rgb(94,94,94);font-size: 16px;text-align: justify;border-style: none;"><i class="far fa-star" style="color: var(--bs-warning);"></i><%=session.getAttribute("ProductRating") %></h1>
                            <div class="my-3">
                                <form class="text-center" method="post" action="addProductServlet" style="margin-bottom: 50px;">
                                    <div class="mb-3">
                                        <div class="form-check"><input class="form-check-input" type="checkbox" name="notifyCheck" onClick="ShowHideDiv(this)"  style="border-color: #41d7fb;"><label class="form-check-label text-start d-xl-flex justify-content-xl-start" for="formCheck-1" style="color: rgb(0,0,0);">Notify me whenever the price changes.</label></div>
                                    </div>
                                    <div class="mb-3" id="div_trackDetails">
                                        <p style="color: var(--bs-gray-600);">Enter the product's target price for which you want to be notified. (Note: Target price should be lower than current price)</p><input class="form-control" type="number" name="targetPrice" placeholder="Enter your target price">
                                    </div>
                                    <div class="text-end float-end d-xl-flex mb-3" style="width: 150px;"><button class="btn btn-primary d-block w-100" type="submit" style="background: #41d7fb;border-style: none;">Add Product<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" class="float-start d-xl-flex justify-content-xl-center align-items-xl-center" style="font-size: 23px;">
                                                <path d="M12 6C12.5523 6 13 6.44772 13 7V11H17C17.5523 11 18 11.4477 18 12C18 12.5523 17.5523 13 17 13H13V17C13 17.5523 12.5523 18 12 18C11.4477 18 11 17.5523 11 17V13H7C6.44772 13 6 12.5523 6 12C6 11.4477 6.44772 11 7 11H11V7C11 6.44772 11.4477 6 12 6Z" fill="currentColor"></path>
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M5 22C3.34315 22 2 20.6569 2 19V5C2 3.34315 3.34315 2 5 2H19C20.6569 2 22 3.34315 22 5V19C22 20.6569 20.6569 22 19 22H5ZM4 19C4 19.5523 4.44772 20 5 20H19C19.5523 20 20 19.5523 20 19V5C20 4.44772 19.5523 4 19 4H5C4.44772 4 4 4.44772 4 5V19Z" fill="currentColor"></path>
                                            </svg></button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@include file="footer.jsp" %>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
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
		if(status=="invalidTargetPrice"){
			swal("Sorry", "Invalid Target Price", "error");
		}
		function ShowHideDiv(chkNotify) {
		
	        var dvtrackDetails = document.getElementById("div_trackDetails");
	        dvtrackDetails.style.display = chkNotify.checked ? "none" : "block";
	    }
		
	</script>
</body>
</html>