package com.pinprice.deleteProduct;

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
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		PreparedStatement ps = null;
		 Connection con = null;
		System.out.println(request.getParameter("id"));
		try {
			 Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
				ps = con.prepareStatement("delete from product where id=?");
				ps.setString(1, (String) request.getParameter("id"));
				int rowCount = ps. executeUpdate();
				if(rowCount > 0 ) {
								dispatcher = request.getRequestDispatcher("productList.jsp");
								session.setAttribute("deleteStatus","productDeleteSuccess");
								session.setAttribute("updateStatus",null);
								}
								else {
									dispatcher = request.getRequestDispatcher("dispExistProductDetails.jsp");
									session.setAttribute("deleteStatus", "productDeleteFailed");
									session.setAttribute("updateStatus",null);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
