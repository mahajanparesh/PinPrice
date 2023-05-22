package com.pinprice.addProduct;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addProductServlet
 */
@WebServlet("/addProductServlet")
public class addProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String notify = request.getParameter("notifyCheck");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		PreparedStatement ps = null;
		 Connection con = null;
		 
		if(notify == null) {
			String targetPrice = request.getParameter("targetPrice");
			if(targetPrice == null || targetPrice.equals("")) {
				request.setAttribute("status", "invalidTargetPrice");
				dispatcher = request.getRequestDispatcher("dispProductDetails.jsp");
				dispatcher.forward(request, response);
			}
			else {
				try {
					 Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
						ps = con.prepareStatement("insert into product (uemail,url,imgUrl,title,price,rating,notifyAll,trackingPrice) values(?,?,?,?,?,?,?,?)");
						ps.setString(1, (String) session.getAttribute("email"));
						ps.setString(2, (String) session.getAttribute("ProductUrl"));
						ps.setString(3, (String) session.getAttribute("ProductImageURL"));
						ps.setString(4,(String) session.getAttribute("ProductTitle"));
						ps.setString(5, (String) session.getAttribute("ProductPrice"));
						ps.setString(6, (String) session.getAttribute("ProductRating"));
						ps.setString(7, "no");
						ps.setString(8, targetPrice);
						int rowCount = ps. executeUpdate();
						if(rowCount > 0 ) {
										dispatcher = request.getRequestDispatcher("index.jsp");
										request.setAttribute("status","productSuccess");
										}
										else {
											dispatcher = request.getRequestDispatcher("dispProductDetails.jsp");
											request.setAttribute("status", "productFailed");
										}
										dispatcher.forward(request, response);
															
				 }catch (Exception e) {
					e.printStackTrace();
				}
				 finally {
					 try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					 
				 }
			}
		}
		else {
			try {
				 Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
					ps = con.prepareStatement("insert into product (uemail,url,imgUrl,title,price,rating,notifyAll,trackingPrice) values(?,?,?,?,?,?,?,?)");
					ps.setString(1, (String) session.getAttribute("email"));
					ps.setString(2, (String) session.getAttribute("ProductUrl"));
					ps.setString(3, (String) session.getAttribute("ProductImageURL"));
					ps.setString(4,(String) session.getAttribute("ProductTitle"));
					ps.setString(5, (String) session.getAttribute("ProductPrice"));
					ps.setString(6, (String) session.getAttribute("ProductRating"));
					ps.setString(7, "yes");
					ps.setString(8, null);
					int rowCount = ps. executeUpdate();
					if(rowCount > 0 ) {
									dispatcher = request.getRequestDispatcher("index.jsp");
									request.setAttribute("status","productSuccess");
									}
									else {
										dispatcher = request.getRequestDispatcher("dispProductDetails.jsp");
										request.setAttribute("status", "productFailed");
									}
									dispatcher.forward(request, response);
														
			 }catch (Exception e) {
				e.printStackTrace();
			}
			 finally {
				 try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			 }
		}
	}

}
