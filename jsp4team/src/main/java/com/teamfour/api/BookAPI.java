package com.teamfour.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class BookAPI {
	String apiKey = "ttbdlwldms98031640001";
	
	public JSONArray newBookList(int start, int maxResult) throws IOException {
		start = (start - 1) * 10;
        //신간도서 api
        String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey="+apiKey+"&QueryType=ItemNewSpecial&MaxResults=" + maxResult + "&start=" + start + "&SearchTarget=Book&output=JS&Version=20131101";
        
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder jsonResponse = new StringBuilder();
        String line;
        
        while ((line = reader.readLine()) != null) {
            jsonResponse.append(line);
        }
        reader.close();
        
        // JSON 파싱
        JSONParser parser = new JSONParser();
        JSONArray itemsArray = null;
        
        JSONObject jsonObject;
		try {
			jsonObject = (JSONObject) parser.parse(jsonResponse.toString());
			itemsArray = (JSONArray) jsonObject.get("item");
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
        	conn.disconnect();
        }
		
        return itemsArray;
	}
	
	public JSONArray newBookList(int maxResult) throws IOException {
		//신간도서 api
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey="+apiKey+"&QueryType=ItemNewSpecial&MaxResults=" + maxResult + "&start=1&SearchTarget=Book&output=JS&Version=20131101";
		
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder jsonResponse = new StringBuilder();
		String line;
		
		while ((line = reader.readLine()) != null) {
			jsonResponse.append(line);
		}
		reader.close();
		
		// JSON 파싱
		JSONParser parser = new JSONParser();
		JSONArray itemsArray = null;
		
		JSONObject jsonObject;
		try {
			jsonObject = (JSONObject) parser.parse(jsonResponse.toString());
			itemsArray = (JSONArray) jsonObject.get("item");
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			conn.disconnect();
		}
		
		return itemsArray;
	}
	
	public JSONArray bestSellerList() throws IOException {
		String apiUrl2 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=" + apiKey + "&QueryType=Bestseller&MaxResults=8&start=1&SearchTarget=Book&output=JS&Version=20131101";
        
        URL url2 = new URL(apiUrl2);
        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
        conn2.setRequestMethod("GET");

        BufferedReader reader2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
        StringBuilder jsonResponse2 = new StringBuilder();
        String line2;

        while ((line2 = reader2.readLine()) != null) {
        	jsonResponse2.append(line2);
        }
        reader2.close();

        // JSON 파싱
        JSONParser parser2 = new JSONParser();
        JSONArray itemsArray2 = null;
        try {
        	JSONObject jsonObject2 = (JSONObject) parser2.parse(jsonResponse2.toString());
        	itemsArray2 = (JSONArray) jsonObject2.get("item");
        	
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	conn2.disconnect();
        }
        
        return itemsArray2;
	}
	
	public JSONArray bestSellerFList() throws IOException {
		String apiUrl3 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey="+apiKey+"&QueryType=Bestseller&MaxResults=6&start=1&SearchTarget=Foreign&output=JS&Version=20131101";
        
        URL url3 = new URL(apiUrl3);
        HttpURLConnection conn3 = (HttpURLConnection) url3.openConnection();
        conn3.setRequestMethod("GET");

        BufferedReader reader3 = new BufferedReader(new InputStreamReader(conn3.getInputStream()));
        StringBuilder jsonResponse3 = new StringBuilder();
        String line3;

        while ((line3 = reader3.readLine()) != null) {
        	jsonResponse3.append(line3);
        }
        reader3.close();

        // JSON 파싱
        JSONParser parser3 = new JSONParser();
        JSONArray itemsArray3 = null;
        
        try {
        	JSONObject jsonObject3 = (JSONObject) parser3.parse(jsonResponse3.toString());
        	itemsArray3 = (JSONArray) jsonObject3.get("item");

        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	conn3.disconnect();
        }
        
        return itemsArray3;

	}
	
	public JSONArray detailBookInfo() {
		String apiUrl4 = "";
		
		
		JSONArray itemsArray4 = null;
		
		
		return itemsArray4;
	}
	

}
