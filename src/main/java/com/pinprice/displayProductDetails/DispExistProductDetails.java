package com.pinprice.displayProductDetails;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pinprice.models.Product;

/**
 * Servlet implementation class DispExistProductDetails
 */
@WebServlet("/DispExistProductDetails")
public class DispExistProductDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispExistProductDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = null;
		try {
			HttpSession session = request.getSession();
			Product product = (Product) session.getAttribute("product");
			System.out.println(product.getEmail());
			session.setAttribute("id", product.getId());
			session.setAttribute("email", product.getEmail());
			session.setAttribute("url", product.getUrl());
			session.setAttribute("imgUrl", product.getImgUrl());
			session.setAttribute("title", product.getTitle());
			session.setAttribute("price", product.getPrice());
			session.setAttribute("rating", product.getRating());
			session.setAttribute("notifyAll", product.getNotifyAll());
			session.setAttribute("trackPrice", product.getTrackPrice());
			rd = request.getRequestDispatcher("DispExistProductDetails.jsp");
			rd.forward(request,response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
