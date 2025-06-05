<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNest | Shop Novels</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .novel-cover {
            height: 250px;
            object-fit: cover;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">📚 BookNest</a>
    <form class="d-flex mx-auto" role="search">
      <input class="form-control me-2" type="search" placeholder="Search novels..." aria-label="Search">
      <button class="btn btn-outline-light" type="submit">Search</button>
    </form>
    <a href="login.jsp" class="btn btn-outline-light">Login</a>
  </div>
</nav>

<!-- Novel Shop Section -->
<div class="container mt-4">
    <h3 class="mb-4">🛒 Browse & Rent/Buy Novels</h3>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <%
            String[] titles = {"The Alchemist", "The Silent Patient", "The Night Circus", "Verity"};
            String[] covers = {
                "https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg",
                "https://m.media-amazon.com/images/I/81eB+7+CkUL._AC_UF1000,1000_QL80_.jpg",
                "https://m.media-amazon.com/images/I/91YODvny72L._AC_UF1000,1000_QL80_.jpg",
                "https://m.media-amazon.com/images/I/91YwPf1pMUL._AC_UF1000,1000_QL80_.jpg"
            };

            for (int i = 0; i < titles.length; i++) {
        %>
        <div class="col">
            <div class="card shadow-sm h-100">
                <img src="<%= covers[i] %>" class="card-img-top novel-cover" alt="Cover">
                <div class="card-body">
                    <h6 class="card-title"><%= titles[i] %></h6>
                    <p class="text-muted">Available in PDF format</p>
                    <div class="d-flex justify-content-between">
                        <a href="login.jsp" class="btn btn-sm btn-outline-success">Rent</a>
                        <a href="login.jsp" class="btn btn-sm btn-primary">Buy</a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
