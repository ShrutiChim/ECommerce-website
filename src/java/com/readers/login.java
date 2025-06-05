package com.readers;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/login")
public class login extends HttpServlet
{  // ✅ Use proper class name
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookdb", "root", "");

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM readers WHERE username=? AND password=?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("readerName", rs.getString("fullname")); // 💡 needed for welcome.jsp
                session.setAttribute("readerGenre", rs.getString("genre"));
                session.setAttribute("readerEmail", rs.getString("email"));
                session.setAttribute("isSubscribed", rs.getBoolean("subscription"));
                session.setAttribute("lastLogin", new java.util.Date().toString());

                response.sendRedirect("welcome.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            conn.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}