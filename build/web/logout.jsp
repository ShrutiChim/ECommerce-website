<%
    // Invalidate session and redirect to login page
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

