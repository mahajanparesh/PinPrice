package com.pinprice.models;

public class Product {
	private int id;
	private String email, url, imgUrl, title, price, rating, notifyAll, trackPrice;
	
	
	public Product() {
	}


	public Product(int id, String url, String imgUrl, String title, String price, String rating, String notifyAll,
			String trackPrice, String email) {
		
		super();
		this.id = id;
		this.email = email;
		this.url = url;
		this.imgUrl = imgUrl;
		this.title = title;
		this.price = price;
		this.rating = rating;
		this.notifyAll = notifyAll;
		this.trackPrice = trackPrice;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getImgUrl() {
		return imgUrl;
	}


	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getRating() {
		return rating;
	}


	public void setRating(String rating) {
		this.rating = rating;
	}


	public String getNotifyAll() {
		return notifyAll;
	}


	public void setNotifyAll(String notifyAll) {
		this.notifyAll = notifyAll;
	}


	public String getTrackPrice() {
		return trackPrice;
	}


	public void setTrackPrice(String trackPrice) {
		this.trackPrice = trackPrice;
	}
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	
		
}
