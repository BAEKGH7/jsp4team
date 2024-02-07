package com.teamfour.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.teamfour.api.BookAPI;


@WebServlet("/index2")
public class NewBookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public NewBookList() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	BookAPI bookAPI = new BookAPI();
    	
    	//신간리스트 api
    	JSONArray itemsArray = bookAPI.newBookList(6);
        request.setAttribute("bookNewList", itemsArray);
            
        //국내도서 베스트셀러 api
        JSONArray itemsArray2 = bookAPI.bestSellerList();
        request.setAttribute("bestBookList", itemsArray2);
 
        //해외도서 베스트셀러 api
        JSONArray itemsArray3 = bookAPI.bestSellerFList();
        request.setAttribute("bestFBookList", itemsArray3);
        
        //도서상세정보 api
        JSONArray itemsArray4 = bookAPI.detailBookInfo();
        
        
        request.setAttribute("detailBookInfo", itemsArray4);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
