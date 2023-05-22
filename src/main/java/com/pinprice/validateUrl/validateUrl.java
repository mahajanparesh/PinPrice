package com.pinprice.validateUrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.nodes.Document;

import com.pinprice.displayProductDetails.DispProductDetails;

/**
 * Servlet implementation class validateUrl
 */
@WebServlet("/validateUrl")
public class validateUrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validateUrl() {
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
		String url = request.getParameter("url");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		if(session.getAttribute("name") != null) {
			if(url.contains("amazon.in")) {
				Document doc = null;
				
			 	DispProductDetails dp = new DispProductDetails();
			 	doc = dp.initialize(url);
			 	session.setAttribute("ProductUrl", url);
			 	session.setAttribute("ProductImageURL", dp.getImgUrl(doc));
			 	session.setAttribute("ProductTitle", dp.getTitle(doc));
			 	session.setAttribute("ProductPrice", dp.getPrice(doc));
			 	session.setAttribute("ProductRating", dp.getRating(doc));
				dispatcher = request.getRequestDispatcher("dispProductDetails.jsp");
			}else {
				request.setAttribute("status", "invalidAmazonUrl");
				dispatcher = request.getRequestDispatcher("index.jsp");
			}
		}else {
			request.setAttribute("status", "invalidLogin");
			dispatcher = request.getRequestDispatcher("index.jsp");
		}
		dispatcher.forward(request, response);
	}

}
