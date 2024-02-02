package com.teamfour.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


@WebServlet("/index")
public class NewBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NewBookList() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //신간도서 api
    	String apiKey = "ttbdlwldms98031640001";
        String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey="+apiKey+"&QueryType=ItemNewSpecial&MaxResults=6&start=1&SearchTarget=Book&output=JS&Version=20131101";
        
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
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(jsonResponse.toString());
            JSONArray itemsArray = (JSONArray) jsonObject.get("item");
            
            // JSP로 데이터 전달
            request.setAttribute("bookNewList", itemsArray);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        //국내도서 베스트셀러 api
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
        try {
        	JSONObject jsonObject2 = (JSONObject) parser2.parse(jsonResponse2.toString());
        	JSONArray itemsArray2 = (JSONArray) jsonObject2.get("item");

        	// JSP로 데이터 전달
        	request.setAttribute("bestBookList", itemsArray2);
        	
        } catch (Exception e) {
        	e.printStackTrace();
        } 
        
        //해외도서 베스트셀러 api
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
        try {
        	JSONObject jsonObject3 = (JSONObject) parser3.parse(jsonResponse3.toString());
        	JSONArray itemsArray3 = (JSONArray) jsonObject3.get("item");

        	// JSP로 데이터 전달
        	request.setAttribute("bestFBookList", itemsArray3);
        	request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	// 연결 닫기
        	conn.disconnect();
        	conn2.disconnect();
        	conn3.disconnect();
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
