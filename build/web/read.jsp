<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    
    Boolean isSubscribed = (Boolean) session.getAttribute("isSubscribed");
    String readerName = (String) session.getAttribute("readerName");

    if (readerName == null || isSubscribed == null || !isSubscribed) {
        response.sendRedirect("Subscribe.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Read Novel | BookNest</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Segoe UI', sans-serif;
        }
        .reader-box {
            background-color: white;
            padding: 2rem;
            margin: 2rem auto;
            max-width: 800px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="reader-box">
    <h3 class="mb-4 text-center">📖 You’re now reading: <i>The Alchemist</i></h3>
    <p>
        “When you want something, all the universe conspires in helping you to achieve it.”
        <br><br>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque egestas sem at ex convallis, a lobortis est vulputate.
        Suspendisse potenti. Curabitur sit amet dapibus nulla. Sed id turpis non nibh tempor suscipit.
    </p>
</div>

<!-- 🔒 Screen Security Scripts -->
<script>
    // Disable right-click
    document.addEventListener("contextmenu", e => e.preventDefault());

    // Disable F12 and Ctrl+Shift+I (DevTools)
    document.onkeydown = function(e) {
        if (e.key === "F12" || (e.ctrlKey && e.shiftKey && e.key === "I")) {
            return false;
        }
    };

    // Block tab switching
    document.addEventListener('visibilitychange', function () {
        if (document.hidden) {
            alert("Reading paused. Please don’t switch tabs while reading.");
            window.location.href = "dashboard.jsp";
        }
    });
</script>

</body>
</html>
