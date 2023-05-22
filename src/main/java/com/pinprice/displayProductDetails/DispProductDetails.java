package com.pinprice.displayProductDetails;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class DispProductDetails {
	Document doc=null;
	String amz_title=null;
	String amz_imgLink=null;
	String amz_price=null;
	String amz_rating=null;
	String[] words=null;
	public Document initialize(String url) throws IOException {
		
		doc = Jsoup.connect(url)
				  .data("query", "Java")
				  .userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100101 Firefox/5.0")
				  .cookie("auth", "token")
				  .timeout(20000)
				  .get();
		System.out.println(doc);
		return doc;
		
		
	}
	public String getTitle(Document doc) throws IOException {
		if(doc.getElementById("title") != null) {
			amz_title = doc.getElementById("title").text();
		}
		else if(doc.select("meta[name*='title']").attr("content") != null) {
			amz_title = doc.select("meta[name*='title']").attr("content");
		    amz_title = amz_title.substring(0, amz_title.indexOf(" : Amazon.in:"));
		}
		else {
			amz_title = null;
		}
		return amz_title ;
			
			
		}
	public String getImgUrl(Document doc) throws IOException {
		amz_imgLink = doc.select("img#landingImage").attr("src");
		return amz_imgLink;
	}
	public String getPrice(Document doc) throws IOException {
		amz_price= null;
		if(doc.select("span.a-offscreen").toString()!= null) {
			amz_price = doc.select("span.a-offscreen").text();
			amz_price = amz_price.split(" ")[0];
			amz_price = amz_price.replace("₹", "");
			amz_price = amz_price.replaceAll(",", "");
		}
		else if(doc.select("span[id*='price']").toString()!= null){
			amz_price = doc.select("span.a-offscreen").text();
			amz_price = amz_price.split(" ")[0];
			amz_price = amz_price.replace("₹", "");
			amz_price = amz_price.replaceAll(",", "");
		}
		else if(doc.select("span[class*=\"pricetopay\"]").toString() != ""){
	        amz_price = doc.select("span[class*=\"pricetopay\"]").select("span.a-offscreen").text();
	        amz_price = amz_price.replace("₹", "");
	        amz_price = amz_price.replaceAll(",", "");
			
	    }
	    else if(doc.select("span[class*=\"a-price buyingPrice\"]").toString() != ""){
	        amz_price = doc.select("span[class*=\"a-price buyingPrice\"]").select("span.a-offscreen").text();
	        amz_price = amz_price.replace("₹", "");
	        amz_price = amz_price.replaceAll(",", "");
	    }
		return amz_price;
	}
	public String getRating(Document doc) throws IOException {
		if(doc.getElementById("acrPopover") != null) {
			words = doc.getElementById("acrPopover").attr("title").toString().split(" ");
			amz_rating = words[0];
		}
		else {
			amz_rating = "0";
		}
        return amz_rating;
	}
	
}
