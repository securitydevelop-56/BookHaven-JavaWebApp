package com.bookhaven.servlet;

import com.bookhaven.dao.BookDAO;
import com.bookhaven.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Book> featuredBooks = bookDAO.getFeaturedBooks();
        request.setAttribute("featuredBooks", featuredBooks);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
