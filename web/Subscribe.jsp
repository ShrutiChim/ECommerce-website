<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String readerName = (String) session.getAttribute("readerName");
    if (readerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Subscribe | BookNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: url('https://images.unsplash.com/photo-1507842217343-583bb7270b66') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', sans-serif;
        }

        .card-subscribe {
            background-color: rgba(255,255,255,0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 5px 30px rgba(0,0,0,0.3);
            max-width: 600px;
            margin: 80px auto;
            text-align: center;
        }

        .qr-img {
            max-width: 200px;
            margin: 20px auto;
        }

        .btn-primary {
            width: 100%;
        }

        .form-control {
            margin-bottom: 15px;
        }

        a {
            display: block;
            margin-top: 15px;
            color: #007bff;
        }
    </style>
</head>
<body>

<div class="card-subscribe">
    <h2>🌟 Premium Reader Subscription</h2>
    <p>Step 1: Scan & Pay using this QR</p>
    <img src="images/image1.jpeg" alt="UPI QR" class="qr-img" />

    <p>Step 2: Upload your payment screenshot/receipt below</p>
    <form action="Subscribe" method="post" enctype="multipart/form-data">
        <input type="file" name="receipt" class="form-control" accept="image/*,application/pdf" required>
        <button type="submit" class="btn btn-success mt-2">✅ I've Paid - Activate Subscription</button>
    </form>
    
    <a href="welcome.jsp">← Back to Welcome</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
