<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - BookHaven</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
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
                        <a class="nav-link" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="admin-login">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Form Section -->
    <section class="login-section py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    <div class="card shadow-lg">
                        <div class="card-body p-5">
                            <div class="text-center mb-4">
                                <i class="fas fa-user-shield fa-3x text-primary mb-3"></i>
                                <h2 class="fw-bold">Admin Login</h2>
                                <p class="text-muted">Enter your credentials to access the admin panel</p>
                            </div>

                            <% 
                                String errorMessage = (String) request.getAttribute("errorMessage");
                                if (errorMessage != null) {
                            %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle"></i> <%= errorMessage %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                            <% 
                                }
                            %>

                            <form method="post" action="admin-login">
                                <div class="mb-3">
                                    <label for="username" class="form-label">
                                        <i class="fas fa-user"></i> Username
                                    </label>
                                    <input type="text" class="form-control form-control-lg" id="username" 
                                           name="username" placeholder="Enter username" required autofocus>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="password" class="form-label">
                                        <i class="fas fa-lock"></i> Password
                                    </label>
                                    <input type="password" class="form-control form-control-lg" id="password" 
                                           name="password" placeholder="Enter password" required>
                                </div>
                                
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        <i class="fas fa-sign-in-alt"></i> Login
                                    </button>
                                </div>
                            </form>

                            <div class="text-center mt-3">
                                <a href="home" class="text-decoration-none">
                                    <i class="fas fa-arrow-left"></i> Back to Home
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4 mt-5 fixed-bottom">
        <div class="container text-center">
            <p class="mb-0">
                <i class="fas fa-book-open"></i> &copy; 2025 BookHaven. All rights reserved.
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
