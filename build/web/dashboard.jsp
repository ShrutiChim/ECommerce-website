<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, java.util.*, java.sql.*" %>
<%
    String readerName = (String) session.getAttribute("readerName");
    Boolean isSubscribed = (Boolean) session.getAttribute("isSubscribed");

    if (readerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Map<String, String[][]> booksByCategory = new LinkedHashMap<>();

    booksByCategory.put("Fiction", new String[][]{
        {"The Alchemist", "https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg"},
        {"Midnight Library", "https://m.media-amazon.com/images/I/81Ee8C3LJL._AC_UF894,1000_QL80_.jpg"},
        {"The Night Circus", "https://m.media-amazon.com/images/I/91YODvny72L._AC_UF1000,1000_QL80_.jpg"},
        {"Verity", "https://m.media-amazon.com/images/I/91YwPf1pMUL._AC_UF1000,1000_QL80_.jpg"}
    });

    booksByCategory.put("Children", new String[][]{
        {"Harry Potter", "https://m.media-amazon.com/images/I/81iqZ2HHD-L.jpg"},
        {"Cat in the Hat", "https://m.media-amazon.com/images/I/81OdwZ8TnHL._AC_UF1000,1000_QL80_.jpg"},
        {"Charlotte's Web", "https://m.media-amazon.com/images/I/91HHqVTAJQL.jpg"},
        {"The Gruffalo", "https://m.media-amazon.com/images/I/81a4kCNuH+L.jpg"}
    });

    booksByCategory.put("Science & Technology", new String[][]{
        {"A Brief History of Time", "https://m.media-amazon.com/images/I/71n58v6ujNL.jpg"},
        {"Astrophysics for People", "https://m.media-amazon.com/images/I/81cbQlGV8mL.jpg"},
        {"Cosmos", "https://m.media-amazon.com/images/I/91zRkCH8prL.jpg"},
        {"The Selfish Gene", "https://m.media-amazon.com/images/I/91zbl96VrwL.jpg"}
    });

    booksByCategory.put("Biographies", new String[][]{
        {"Steve Jobs", "https://m.media-amazon.com/images/I/81VStYnDGrL.jpg"},
        {"Wings of Fire", "https://m.media-amazon.com/images/I/81zxfzN2sKL.jpg"},
        {"Becoming", "https://m.media-amazon.com/images/I/81h2gWPTYJL.jpg"},
        {"Long Walk to Freedom", "https://m.media-amazon.com/images/I/81uZIS4WRsL.jpg"}
    });
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard | BookNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .novel-img {
            height: 250px;
            object-fit: cover;
        }
        .section-header {
            margin-top: 40px;
            margin-bottom: 20px;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 5px;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">
<div class="container mt-4">
    <div class="mb-4">
        <h3>👋 Welcome, <%= readerName %></h3>
        <% if (isSubscribed != null && isSubscribed) { %>
            <span class="badge bg-success">Premium Subscriber</span>
        <% } else { %>
            <span class="badge bg-warning text-dark">Not Subscribed</span>
        <% } %>
        <div class="mt-3 d-flex gap-2">
            <a href="welcome.jsp" class="btn btn-outline-secondary">🏠 Home</a>
            <a href="read.jsp" class="btn btn-primary" <%= (isSubscribed != null && isSubscribed) ? "" : "disabled" %>>📖 Read Novels</a>
            <a href="subscribe.jsp" class="btn btn-warning">🛒 Subscribe</a>
            <a href="logout.jsp" class="btn btn-danger">🚪 Logout</a>
        </div>
    </div>

    <% for (Map.Entry<String, String[][]> entry : booksByCategory.entrySet()) {
        String genre = entry.getKey();
        String[][] books = entry.getValue(); %>

        <div class="section-header">
            <h4><%= genre %></h4>
        </div>
        <div class="row row-cols-1 row-cols-md-4 g-4">
            <% for (String[] book : books) { %>
                <div class="col">
                    <div class="card h-100 shadow-sm">
                        <img src="<%= book[1] %>" class="card-img-top novel-img" alt="<%= book[0] %> cover">
                        <div class="card-body">
                            <h6 class="card-title"><%= book[0] %></h6>
                            <p class="text-muted">Available in PDF</p>
                        </div>
                        <div class="card-footer d-flex justify-content-between">
                            <a href="#" class="btn btn-sm btn-outline-primary">💰 Buy</a>
                            <% if (isSubscribed != null && isSubscribed) { %>
                                <a href="read.jsp" class="btn btn-sm btn-outline-success">📖 Read</a>
                            <% } else { %>
                                <button class="btn btn-sm btn-outline-secondary" disabled>🔒 Read</button>
                            <% } %>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
