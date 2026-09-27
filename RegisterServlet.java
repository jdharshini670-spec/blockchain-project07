package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (username == null || username.trim().isEmpty()
                || password == null || password.isEmpty()
                || role == null || role.isEmpty()) {

            showMessage(response, "Please fill all fields.");
            return;
        }

        String hashedPassword =
                BCrypt.hashpw(password, BCrypt.gensalt());

        String sql =
                "INSERT INTO users(username, password, role) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                showMessage(response, "Database connection failed.");
                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, username.trim());
                ps.setString(2, hashedPassword);
                ps.setString(3, role);

                int result = ps.executeUpdate();

                if (result > 0) {

                    showMessage(
                            response,
                            "Registration Successful!<br><br>"
                            + "Username: " + username + "<br>"
                            + "Role: " + role + "<br><br>"
                            + "<a href='login.jsp'>Go to Login</a>"
                    );

                } else {

                    showMessage(
                            response,
                            "Registration failed."
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            showMessage(
                    response,
                    "Registration error: " + e.getMessage()
            );
        }
    }

    private void showMessage(HttpServletResponse response,
                             String message)
            throws IOException {

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Registration</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Medical IoT Registration</h2>");
        out.println("<p>" + message + "</p>");

        out.println("</body>");
        out.println("</html>");
    }
}