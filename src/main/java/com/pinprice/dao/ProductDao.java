package com.pinprice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.pinprice.models.Product;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	private String email;
	private String id;
	HttpServletRequest request;
	public ProductDao(HttpServletRequest request,Connection con, String email) {
		this.con = con;
		this.email = email;
		this.request = request;
	}
	public ProductDao(HttpServletRequest request,Connection con, int id) {
		this.con = con;
		this.id = Integer.toString(id);
		this.request = request;
	}
	public List<Product> getAllProducts(){
		HttpSession session = request.getSession();
	
		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from product where uemail=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, this.email);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setEmail(rs.getString("uemail"));
				row.setUrl(rs.getString("url"));
				row.setImgUrl(rs.getString("imgUrl"));
				row.setTitle(rs.getString("title"));
				row.setPrice(rs.getString("price"));
				row.setRating(rs.getString("rating"));
				row.setNotifyAll(rs.getString("notifyAll"));
				row.setTrackPrice(rs.getString("trackingPrice"));
				products.add(row);
			}
			if(products.isEmpty()) {
				session.setAttribute("status", "noProducts");
			}
			else {
				session.setAttribute("status", "hasProducts");
			}
		}catch (Exception e) {
		e.printStackTrace();
	}
		return products;
	}
	
	public List<Product> getProduct(){
		HttpSession session = request.getSession();
	
		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from product where id=?";
			pst = this.con.prepareStatement(query);
			pst.setString(1, this.id);
			rs = pst.executeQuery();
			while(rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("id"));
				row.setEmail(rs.getString("uemail"));
				row.setUrl(rs.getString("url"));
				row.setImgUrl(rs.getString("imgUrl"));
				row.setTitle(rs.getString("title"));
				row.setPrice(rs.getString("price"));
				row.setRating(rs.getString("rating"));
				row.setNotifyAll(rs.getString("notifyAll"));
				row.setTrackPrice(rs.getString("trackingPrice"));
				products.add(row);
			}
			System.out.println(rs);
			if(products.isEmpty()) {
				session.setAttribute("status", "noProducts");
			}
			else {
				session.setAttribute("status", "hasProducts");
			}
		}catch (Exception e) {
		e.printStackTrace();
	}
		return products;
	}
}
