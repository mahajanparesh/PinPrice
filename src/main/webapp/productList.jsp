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

	 ProductDao pd = new ProductDao(request, con, session.getAttribute("email").toString());
	 List<Product> products = pd.getAllProducts();
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
    <link rel="stylesheet" href="assets/css/Footer-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/Pretty-Footer-.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
	<%@include file="navbar.jsp" %> 
	<input type = "hidden" id = "status" value= "<%= session.getAttribute("status") %>">
	<input type = "hidden" id = "deleteStatus" value= "<%= session.getAttribute("deleteStatus") %>">
	<input type = "hidden" id = "updateStatus" value= "<%= session.getAttribute("updateStatus") %>">
	<%
	session.setAttribute("deleteStatus",null);
session.setAttribute("updateStatus", null);
%>
    <div class="container" id="productsUnder_div">
        <header style="border-bottom: 1px solid #777777;margin-top: 50px;">
            <h1 class="text-center">Products under Tracking</h1>
        </header>
    </div>
    <div class="container" style="margin-top: 25px;">
        <div class="row g-0">
        <%
        if(!products.isEmpty()){
        	for(Product p:products){%>
        	
        		<div class="col-md-6 col-lg-4 item zoom-on-hover">
                <div class="card">
                    <div class="card-body text-center" style="height:336px">
                        <div class="d-xxl-flex justify-content-xxl-center">
                            <div class="d-inline-block d-xxl-flex" style="width: 250px;height: 250px;border-style: solid;border-color: rgba(255,255,255,0);"><img class="d-xxl-flex" style="width: 100%;object-fit: contain;height: 100%;" width="194" height="80" src="<%= p.getImgUrl()%>"></div>
                        </div>
                        <p class="card-text" style="font-weight: bold;font-size: 18px;"><%= p.getTitle()%></p>
                    </div>
                    <div class="text-center d-xxl-flex justify-content-xxl-center align-items-xxl-center" style="margin-bottom: 10px;margin-top: 5px;">
                        <div class="d-inline-block" style="width: 80%;">
                            <div style="float: left;">
                                <h1 class="float-start d-xxl-flex align-items-xxl-center" style="font-size: 20px;color: var(--bs-red);">₹</h1>
                                <h1 class="float-end d-xxl-flex" style="font-size: 20px;color: var(--bs-red);margin-left: 5px;"><%= p.getPrice() %></h1>
                            </div>
                            <div class="d-xxl-flex align-items-xxl-center" style="float: right;">
                                <h1 class="d-block" style="font-family: 'Open Sans', arial, sans-serif;color: rgb(94,94,94);font-size: 16px;text-align: justify;align-items: end;float: right;"><i class="far fa-star" style="color: var(--bs-warning);"></i><%=p.getRating() %></h1>
                            </div>
                        </div>
                    </div><a class="btn btn-primary" type="button" style="background: #41d7fb;border-color: rgba(255,255,255,0);" href="dispExistProductDetails.jsp?id=<%=p.getId() %>">View Details</a>
                </div>
            </div>
        	<%}
        	
        }
        
        %>
        
        </div>
    </div>
    <div>
        <div class="container text-center" id="noProducts_div" style="margin-top: 50px;"><img src="assets/img/pinpng.com-empty-sign-png-6071299%20(1).png" style="width: 300px;">
            <h1 style="margin-top: 20px;">No Products Under Tracking</h1>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type = "text/javascript">
		var status = document.getElementById("status").value;
		var deleteStatus = document.getElementById("deleteStatus").value;
		var updateStatus = document.getElementById("updateStatus").value;
		document.write(status);
		if(status == "hasProducts"){
			document.getElementById("noProducts_div").style.display = "none";
		}
		if(status == "noProducts"){
			document.getElementById("productsUnder_div").style.display = "none";
		}
		if(updateStatus == "productSuccess"){
			swal("Congrats", "Product Updated Successfully", "success");
		}
		if(deleteStatus == "productDeleteSuccess"){
			swal("Congrats", "Product Deleted Successfully!!", "success");
		}
	</script>
</body>

</html>