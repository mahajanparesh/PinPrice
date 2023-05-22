package com.pinprice.registration;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		 
		 String uname = request.getParameter("name");
		 String uemail = request.getParameter("email");
		 String upwd = request.getParameter("pass");
		 String reUpwd = request.getParameter("re_pass");
		 String umobile = request.getParameter("contact");
		 RequestDispatcher dispatcher = null;
		 PreparedStatement ps = null;
		 Connection con = null;
		 
		 if(uname == null || uname.equals("")) {
			 	request.setAttribute("status", "invalidName");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else if(uemail == null || uemail.equals("")) {
				request.setAttribute("status", "invalidEmail");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else if(upwd == null || upwd.equals("")) {
				request.setAttribute("status", "invalidUpwd");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else if(!upwd.equals(reUpwd)) {
				request.setAttribute("status", "invalidConfirmPassword");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else if(umobile == null || umobile.equals("")) {
				request.setAttribute("status", "invalidMobile");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else if(umobile.length() > 10 || umobile.length() < 10){
				request.setAttribute("status", "invalidMobileLength");
				dispatcher = request.getRequestDispatcher("signup.jsp");
				dispatcher.forward(request, response);
			}
		 else {
			 try {
				 Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PinPrice","root","");
						ps = con.prepareStatement("select * from users where uemail=?");
											
						ps.setString(1, uemail);
						ResultSet rs = ps.executeQuery();
						if(rs.next()) {
									request.setAttribute("status", "invalidUser");
									dispatcher = request.getRequestDispatcher("signup.jsp");
									}
						else {
										ps = con.prepareStatement("insert into users (uname,upwd,uemail,umobile) values(?,?,?,?)");
										ps.setString(1, uname);
										ps.setString(2, upwd);
										ps.setString(3, uemail);
										ps.setString(4, umobile);
										
										int rowCount = ps. executeUpdate();
										dispatcher = request.getRequestDispatcher("signup.jsp");
										
										if(rowCount > 0 ) {
											dispatcher = request.getRequestDispatcher("login.jsp");
											request.setAttribute("status","successSignup");
										}
										else {
											dispatcher = request.getRequestDispatcher("signup.jsp");
											request.setAttribute("status", "failed");
										}
										dispatcher.forward(request, response);
										
							}					
						dispatcher.forward(request, response);					
			 }catch (Exception e) {
				e.printStackTrace();
			}
			 finally {
				 try {
					con.close();
					out.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				 
			 }
		 }
	}

}
