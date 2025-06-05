<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String name = (String) session.getAttribute("readerName");
    String genre = (String) session.getAttribute("readerGenre");
    String lastLogin = (String) session.getAttribute("lastLogin");
    Boolean isSubscribed = (Boolean) session.getAttribute("isSubscribed");

    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Welcome | BookNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1519682577862-22b62b24e493') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            color: #fff;
            max-width: 500px;
            margin: auto;
            text-align: center;
        }

        h1 span {
            color: #ffc107;
        }

        .btn-custom {
            width: 100%;
            margin-bottom: 10px;
        }

        .info-text {
            font-size: 0.9rem;
            color: #e0e0e0;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: -1;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center min-vh-100">
    <div class="overlay"></div>

    <div class="glass-card">
        <h1 class="mb-3">👋 Welcome, <span><%= name %></span>!</h1>
        <p class="mb-1">📖 <strong>Favorite Genre:</strong> <%= genre %></p>
        <p class="info-text mb-4"><i>Last login:</i> <%= lastLogin %></p>

        <a href="dashboard.jsp" class="btn btn-warning btn-custom">📚 Go to Dashboard</a>

        <% if (isSubscribed != null && isSubscribed) { %>
            <p class="text-success mt-3">✅ You are a premium subscriber</p>
            <a href="read.jsp" class="btn btn-primary btn-custom">📖 Read Novel</a>
        <% } else { %>
            <p class="text-warning mt-3">🔒 You're not subscribed yet</p>
            <a href="Subscribe.jsp" class="btn btn-warning btn-custom">🛒 Subscribe Now</a>
            <a href="buy.jsp" class="btn btn-outline-light btn-custom">💰 Buy Novel</a>
        <% } %>

        <a href="logout.jsp" class="btn btn-outline-light btn-custom mt-3">🚪 Logout</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
