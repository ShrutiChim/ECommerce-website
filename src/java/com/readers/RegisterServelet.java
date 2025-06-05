package com.readers;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

//@WebServlet("/RegisterServelet")
public class RegisterServelet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String fullName = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String genre = request.getParameter("genre");

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookdb", "root", "");

            // ✅ Check for duplicate username or email
            String checkSql = "SELECT * FROM readers WHERE username = ? OR email = ?";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // ⚠️ Already exists
                request.setAttribute("error", "Username or Email already exists. Please use a different one.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // ✅ Insert new reader
            String insertSql = "INSERT INTO readers (fullname, username, email, password, gender, genre) VALUES (?, ?, ?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, fullName);
            insertStmt.setString(2, username);
            insertStmt.setString(3, email);
            insertStmt.setString(4, password);
            insertStmt.setString(5, gender);
            insertStmt.setString(6, genre);

            int result = insertStmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("login.jsp"); // ✅ Successful registration
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Server error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try {
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
