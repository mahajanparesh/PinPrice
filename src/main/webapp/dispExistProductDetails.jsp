<%@page import="com.pinprice.models.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "com.pinprice.dao.ProductDao"%>
<%@ page import = "java.util.List"%>
 <%
	if(session.getAttribute("name") == null){
		response.sendRedirect("login.jsp");
	}
%>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
	ProductDao pd = new ProductDao(request, con, Integer.parseInt(request.getParameter("id")));
	List<Product> product = pd.getProduct();
	 
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
    <link rel="stylesheet" href="assets/fonts/line-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<input type = "hidden" id = "status" value= "<%= session.getAttribute("status1") %>">
	<input type = "hidden" id = "deleteStatus" value= "<%= session.getAttribute("deleteStatus") %>">
	<input type = "hidden" id = "updateStatus" value= "<%= session.getAttribute("updateStatus") %>">
	<%
	session.setAttribute("status1",null);
session.setAttribute("updateStatus", null);
%>
	<%@include file="navbar.jsp" %>
    <section style="margin: 30px;">
    
        <div class="container">
            <h1 class="display-4 fw-bold text-center mb-5" style="font-size: 40px;color: var(--bs-gray-800);">Product Details</h1>
            <div class="bg-dark border rounded border-0 border-dark overflow-hidden" style="width: auto;height: auto;background: rgb(255,255,255);">
                <div class="row g-0" style="background: #e6fbff;">
                <%
				        if(!product.isEmpty()){
				        	for(Product p:product){
				        	if(p.getNotifyAll().equals("yes")){
				        	%>
                    <div class="col-md-6 text-center d-lg-flex order-first justify-content-lg-center align-items-lg-center" style="background: #e6fbff;padding: 20px;padding-top: 20px;padding-bottom: 20px;">
                    	<div class="d-lg-flex justify-content-lg-center align-items-lg-center" style="width: 100%;height: 100%;background: #ffffff; ">
                        <div class="d-inline-block d-xxl-flex" style="align-items: center; justify-content: center; width: 300px;height: 300px;border-style: solid;border-color: rgba(255,255,255,0);"><img class="d-xxl-flex" style="width: 100%;object-fit: contain;height: 100%;" width="194" height="80" src="<%= p.getImgUrl()%>"></div>
                        </div>
                    </div>
                    <div class="col-md-6 order-first order-md-last" style="min-height: 250px;padding: 20px;padding-left: 20px;">
                        <div class="text-white p-4 p-md-5" style="transform: scale(1);text-align: center;color: var(--bs-info);background: #ffffff;padding-right: 100px !important;padding-bottom: 80px !important;">
                        
                            <h4 class="text-start" style="color: rgb(27,27,27);border-color: rgb(255,255,255);text-align: center;font-size: 30px;"><span style="color: rgb(15, 17, 17);"><%=p.getTitle() %></span></h4><i class="la la-rupee float-start" style="color: rgb(255,0,0);font-size: 26px;"></i>
                            <h4 class="text-start" style="color: var(--bs-red);border-color: rgb(255,255,255);text-align: center;font-size: 23px;"><%=p.getPrice() %></h4>
                            <h1 style="font-family: 'Open Sans', arial, sans-serif;color: rgb(94,94,94);font-size: 16px;text-align: justify;"><i class="far fa-star" style="color: var(--bs-red);"></i><%=p.getRating() %></h1>
                            <div class="my-3">
                                <form class="text-center" method="post" action="UpdateProduct?id=<%=p.getId() %>" style="margin-bottom: 50px;">
                                <input type="hidden" value=<%= p.getId() %> name="id">
                                    <div class="mb-3">
                                        <div class="form-check"><input class="form-check-input" onClick="ShowHideDiv(this)"  type="checkbox" id="formCheck-1" style="border-color: #41d7fb;" name="notifyCheck" checked><label class="form-check-label text-start d-xl-flex justify-content-xl-start" for="formCheck-1" style="color: rgb(0,0,0);">Notify me whenever the price changes.</label></div>
                                    </div>
                                    <div class="mb-3" id="div_trackDetails" style="display: none;">
                                        <p style="color: var(--bs-gray-600);">Enter the product's target price for which you want to be notified. (Note: Target price should be lower than current price)</p><input class="form-control" type="number" name="targetPrice" placeholder="Enter your target price">
                                    </div>
                                    <div class="text-end float-end d-xl-flex mb-3"><button class="btn btn-primary float-start d-block w-100" type="submit" style="background: #41d7fb;border-style: none;width: 120px !important;margin-left: 5px;margin-top: 5px;">Update<i class="fas fa-save float-start d-xl-flex justify-content-xl-center align-items-xl-center" style="font-size: 23px;"></i></button><a class="btn btn-primary float-end d-block w-100" type="submit" style="background: var(--bs-red);width: 120px !important;margin-left: 5px;margin-top: 5px;border-style: none;border-color: rgba(255,255,255,0);" href="DeleteProduct?id=<%= p.getId()%>">Delete<i class="fa fa-trash float-start d-xl-flex justify-content-xl-center align-items-xl-center" style="font-size: 23px;"></i></a></div>
                                </form>
                            </div>
                             
                             

                            <%}else{%>
                            	<div class="col-md-6 text-center d-lg-flex order-first justify-content-lg-center align-items-lg-center" style="background: #e6fbff;padding: 20px;padding-top: 20px;padding-bottom: 20px;">
                      
                        <div class="d-lg-flex justify-content-lg-center align-items-lg-center" style="width: 100%;height: 100%;background: #ffffff;">
                        <div class="d-inline-block d-xxl-flex" style="width: 300px;height: 300px;border-style: solid;border-color: rgba(255,255,255,0);"><img class="d-xxl-flex" style="width: 100%;object-fit: contain;height: 100%;" width="194" height="80" src="<%= p.getImgUrl()%>"></div>
                        </div></div>
                    <div class="col-md-6 order-first order-md-last" style="min-height: 250px;padding: 20px;padding-left: 20px;">
                        <div class="text-white p-4 p-md-5" style="transform: scale(1);text-align: center;color: var(--bs-info);background: #ffffff;padding-right: 100px !important;padding-bottom: 80px !important;">
                        
                            <h4 class="text-start" style="color: rgb(27,27,27);border-color: rgb(255,255,255);text-align: center;font-size: 30px;"><span style="color: rgb(15, 17, 17);"><%=p.getTitle() %></span></h4><i class="la la-rupee float-start" style="color: rgb(255,0,0);font-size: 26px;"></i>
                            
                            <h4 class="text-start" style="color: var(--bs-red);border-color: rgb(255,255,255);text-align: center;font-size: 23px;"><%=p.getPrice() %></h4>
                            <h1 style="font-family: 'Open Sans', arial, sans-serif;color: rgb(94,94,94);font-size: 16px;text-align: justify;"><i class="far fa-star" style="color: var(--bs-red);"></i><%=p.getRating() %></h1>
                            <div class="my-3">
                                <form class="text-center" method="post" action="UpdateProduct?id<%=p.getId() %>" style="margin-bottom: 50px;">
                                <input type="hidden" value=<%= p.getId() %> name="id">
                                    <div class="mb-3">
                                        <div class="form-check"><input class="form-check-input" onClick="ShowHideDiv(this)"  type="checkbox" id="formCheck-1" name="notifyCheck" style="border-color: #41d7fb;" ><label class="form-check-label text-start d-xl-flex justify-content-xl-start" for="formCheck-1" style="color: rgb(0,0,0);">Notify me whenever the price changes.</label></div>
                                    </div>
                                    <div class="mb-3" id="div_trackDetails" >
                                        <p style="color: var(--bs-gray-600);">Enter the product's target price for which you want to be notified. (Note: Target price should be lower than current price)</p><input class="form-control" type="number" name="targetPrice" placeholder="Enter your target price" value=<%= p.getTrackPrice()%>>
                                    </div>
                                    <div class="text-end float-end d-xl-flex mb-3"><button class="btn btn-primary float-start d-block w-100" type="submit" style="background: #41d7fb;border-style: none;width: 120px !important;margin-left: 5px;margin-top: 5px;">Update<i class="fas fa-save float-start d-xl-flex justify-content-xl-center align-items-xl-center" style="font-size: 23px;"></i></button><a class="btn btn-primary float-end d-block w-100"  style="background: var(--bs-red);width: 120px !important;margin-left: 5px;margin-top: 5px;border-style: none;border-color: rgba(255,255,255,0);" href="DeleteProduct?id=<%=p.getId()%>">Delete<i class="fa fa-trash float-start d-xl-flex justify-content-xl-center align-items-xl-center" style="font-size: 23px;"></i></a></div>
                                </form>
                            </div>
                            <%}
				        	}
        	
        					}
        
        					%>
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
                     		function ShowHideDiv(chkNotify) {
                     		
                     	        var dvtrackDetails = document.getElementById("div_trackDetails");
                     	        dvtrackDetails.style.display = chkNotify.checked ? "none" : "block";
                     	    }
                     		var session_status = document.getElementById("session_status").value;
                     		var deleteStatus = document.getElementById("deleteStatus").value;
                    		var updateStatus = document.getElementById("updateStatus").value;
                    		var status = document.getElementById("status").value;
                    		document.write(status);
                    		if(deleteStatus == "productDeleteFailed"){
                    			swal("Failed!!", "Unable to delete the product", "error");
                    			
                    		}
                    		if(status=="invalidTargetPrice"){
                    			document.write("hello");
                    			swal("Sorry", "Invalid Target Price", "error");
                    		}
                    		if(updateStatus=="productFailed"){
                    			swal("Sorry", "Unable to update product", "error");
                    		}
                     	</script>
                     	
</body>

</html>