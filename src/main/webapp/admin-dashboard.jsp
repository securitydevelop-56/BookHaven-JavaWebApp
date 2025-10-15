<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookhaven.model.Contact" %>
<%@ page import="com.bookhaven.dao.ContactDAO" %>
<%
    // Check if admin is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("admin-login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - BookHaven</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="home">
                <i class="fas fa-book-open"></i> BookHaven - Admin
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <span class="nav-link">
                            <i class="fas fa-user"></i> Welcome, <%= username %>
                        </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-logout">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="container-fluid py-4">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 bg-light py-3">
                <div class="list-group">
                    <a href="#dashboard" class="list-group-item list-group-item-action active">
                        <i class="fas fa-home"></i> Dashboard
                    </a>
                    <a href="#contacts" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope"></i> Contact Leads
                    </a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="col-md-10">
                <div class="row mb-4">
                    <div class="col-12">
                        <h2 class="mb-4">
                            <i class="fas fa-tachometer-alt"></i> Admin Dashboard
                        </h2>
                    </div>
                </div>

                <!-- Statistics Cards -->
                <%
                    ContactDAO contactDAO = new ContactDAO();
                    List<Contact> contacts = contactDAO.getAllContacts();
                    int totalContacts = contacts.size();
                %>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <div class="card bg-primary text-white shadow">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="text-uppercase">Total Contacts</h6>
                                        <h2 class="mb-0"><%= totalContacts %></h2>
                                    </div>
                                    <div>
                                        <i class="fas fa-envelope fa-3x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-success text-white shadow">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="text-uppercase">Featured Books</h6>
                                        <h2 class="mb-0">6</h2>
                                    </div>
                                    <div>
                                        <i class="fas fa-book fa-3x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card bg-info text-white shadow">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="text-uppercase">Admin Users</h6>
                                        <h2 class="mb-0">1</h2>
                                    </div>
                                    <div>
                                        <i class="fas fa-users fa-3x opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contact Leads Table -->
                <div class="row" id="contacts">
                    <div class="col-12">
                        <div class="card shadow">
                            <div class="card-header bg-white">
                                <h4 class="mb-0">
                                    <i class="fas fa-envelope"></i> Contact Leads
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Message</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                if (contacts != null && !contacts.isEmpty()) {
                                                    int count = 1;
                                                    for (Contact contact : contacts) {
                                            %>
                                            <tr>
                                                <td><%= count++ %></td>
                                                <td><%= contact.getName() %></td>
                                                <td><%= contact.getEmail() %></td>
                                                <td><%= contact.getMessage() %></td>
                                                <td><%= contact.getCreatedAt() %></td>
                                            </tr>
                                            <%
                                                    }
                                                } else {
                                            %>
                                            <tr>
                                                <td colspan="5" class="text-center text-muted">
                                                    <i class="fas fa-info-circle"></i> No contact leads available.
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">
                <i class="fas fa-book-open"></i> &copy; 2025 BookHaven Admin Panel. All rights reserved.
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
