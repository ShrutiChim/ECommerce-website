package com.readers;

import java.io.*;
import java.sql.*;
import java.nio.file.Paths;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

//@WebServlet("/Subscribe")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 15
)
public class Subscribe extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String readerName = (String) session.getAttribute("readerName");

        if (readerName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get receipt file
        Part filePart = request.getPart("receipt");
        String fileName = getFileName(filePart);

        // Folder to store receipts (make sure it's created)
        String uploadPath = getServletContext().getRealPath("") + File.separator + "receipts";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save the file
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bookdb", "root", "");

            // Insert into subscription_requests table instead of updating readers directly
            String sql = "INSERT INTO subscription_requests (reader_username, receipt_filename, status) VALUES (?, ?, 'Pending')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, readerName);
            pstmt.setString(2, fileName);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                request.setAttribute("message", "✅ Your subscription request has been sent to the admin for approval.");
            } else {
                request.setAttribute("error", "❌ Failed to submit your subscription request. Try again.");
            }

            request.getRequestDispatcher("subscribe.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return Paths.get(token.substring(token.indexOf("=") + 2, token.length() - 1)).getFileName().toString();
            }
        }
        return "receipt_" + System.currentTimeMillis();
    }
}
