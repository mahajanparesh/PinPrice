package com.pinprice.updateProduct;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String notify = request.getParameter("notifyCheck");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		PreparedStatement ps = null;
		 Connection con = null;
		 
		if(notify == null) {
			String targetPrice = request.getParameter("targetPrice");
			if(targetPrice == null || targetPrice.equals("")) {
				session.setAttribute("status1", "invalidTargetPrice");
				dispatcher = request.getRequestDispatcher("dispExistProductDetails.jsp");
				dispatcher.forward(request, response);
			}
			else {
				try {
					 Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
						
						ps = con.prepareStatement("Update product set notifyAll = ? , trackingPrice=? where id=?");
						ps.setString(1, "no");
						ps.setString(2, targetPrice);
						ps.setString(3, request.getParameter("id"));
						int rowCount = ps. executeUpdate();
						if(rowCount > 0 ) {
										dispatcher = request.getRequestDispatcher("productList.jsp");
										session.setAttribute("updateStatus","productSuccess");
										session.setAttribute("deleteStatus",null);
										}
										else {
											dispatcher = request.getRequestDispatcher("dispExistProductDetails.jsp");
											session.setAttribute("updateStatus", "productFailed");
											session.setAttribute("deleteStatus",null);
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
				
				ps = con.prepareStatement("Update product set notifyAll = ?, trackingPrice=? where id=?");
				ps.setString(1, "yes");
				ps.setString(2, null);
				ps.setString(3, request.getParameter("id"));
				int rowCount = ps. executeUpdate();
				if(rowCount > 0 ) {
								dispatcher = request.getRequestDispatcher("productList.jsp");
								session.setAttribute("updateStatus","productSuccess");
								session.setAttribute("deleteStatus",null);
								}
								else {
									dispatcher = request.getRequestDispatcher("dispExistProductDetails.jsp");
									session.setAttribute("updateStatus", "productFailed");
									session.setAttribute("deleteStatus",null);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
