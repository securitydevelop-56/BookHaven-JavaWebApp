<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.bookhaven.model.Book" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookHaven - Your Literary Paradise</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="home">
                <i class="fas fa-book-open"></i> BookHaven
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin-login">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero bg-light py-5">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold text-primary">Welcome to BookHaven</h1>
                    <p class="lead text-muted">Your Literary Paradise - Discover, Explore, and Enjoy Great Books</p>
                    <a href="contact" class="btn btn-primary btn-lg mt-3">
                        <i class="fas fa-envelope"></i> Contact Us
                    </a>
                </div>
                <div class="col-lg-6">
                    <img src="images/books-hero.jpg" alt="Books" class="img-fluid rounded" 
                         onerror="this.src='https://via.placeholder.com/600x400/007bff/ffffff?text=BookHaven'">
                </div>
            </div>
        </div>
    </section>

    <!-- Featured Books Section -->
    <section class="featured-books py-5">
        <div class="container">
            <h2 class="text-center mb-5">
                <i class="fas fa-star text-warning"></i> Featured Books
            </h2>
            <div class="row">
                <%
                    List<Book> featuredBooks = (List<Book>) request.getAttribute("featuredBooks");
                    if (featuredBooks != null && !featuredBooks.isEmpty()) {
                        for (Book book : featuredBooks) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm">
                        <img src="<%= book.getImageUrl() %>" class="card-img-top" alt="<%= book.getTitle() %>"
                             onerror="this.src='https://via.placeholder.com/300x400/6c757d/ffffff?text=<%= book.getTitle() %>'">
                        <div class="card-body">
                            <h5 class="card-title"><%= book.getTitle() %></h5>
                            <p class="card-text text-muted">
                                <i class="fas fa-user"></i> <%= book.getAuthor() %>
                            </p>
                            <p class="card-text"><%= book.getDescription() %></p>
                            <p class="card-text">
                                <strong class="text-primary">$<%= String.format("%.2f", book.getPrice()) %></strong>
                            </p>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        <i class="fas fa-info-circle"></i> No featured books available at the moment.
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">
                <i class="fas fa-book-open"></i> &copy; 2025 BookHaven. All rights reserved.
            </p>
            <p class="mb-0">
                <small>Advanced Java Course Project</small>
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
