package com.bookhaven.servlet;

import com.bookhaven.dao.ContactDAO;
import com.bookhaven.model.Contact;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    private ContactDAO contactDAO;

    @Override
    public void init() throws ServletException {
        contactDAO = new ContactDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, message);
        boolean success = contactDAO.saveContact(contact);

        if (success) {
            request.setAttribute("successMessage", "Thank you for contacting us! We'll get back to you soon.");
        } else {
            request.setAttribute("errorMessage", "Failed to submit contact form. Please try again.");
        }

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}
