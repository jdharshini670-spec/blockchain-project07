package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (username == null || password == null || role == null) {
            showMessage(response, "Please fill all fields.");
            return;
        }

        username = username.trim();
        role = role.trim();

        if (username.isEmpty() || password.isEmpty() || role.isEmpty()) {
            showMessage(response, "Please fill all fields.");
            return;
        }

        // Search using username only
        String sql =
                "SELECT username, password, role "
                + "FROM users "
                + "WHERE username = ?";

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                showMessage(response, "Database connection failed.");
                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, username);

                try (ResultSet rs = ps.executeQuery()) {

                    if (!rs.next()) {
                        showMessage(
                                response,
                                "Username not found."
                        );
                        return;
                    }

                    String databaseUsername =
                            rs.getString("username");

                    String databaseRole =
                            rs.getString("role");

                    String storedPassword =
                            rs.getString("password");

                    // Check role
                    if (!databaseRole.trim()
                            .equalsIgnoreCase(role)) {

                        showMessage(
                                response,
                                "Incorrect role selected."
                        );
                        return;
                    }

                    // Check password
                    boolean passwordCorrect;

                    try {
                        passwordCorrect =
                                BCrypt.checkpw(
                                        password,
                                        storedPassword
                                );
                    } catch (Exception e) {
                        passwordCorrect = false;
                    }

                    if (!passwordCorrect) {
                        showMessage(
                                response,
                                "Invalid password."
                        );
                        return;
                    }

                    // Create session
                    HttpSession session =
                            request.getSession();

                    session.setAttribute(
                            "username",
                            databaseUsername
                    );

                    session.setAttribute(
                            "role",
                            databaseRole
                    );

                    // Redirect according to role
                    if ("Cloud Server"
                            .equalsIgnoreCase(databaseRole)) {

                        response.sendRedirect(
                                "cloudserver.jsp"
                        );

                    } else if ("Doctor"
                            .equalsIgnoreCase(databaseRole)) {

                        response.sendRedirect(
                                "doctor.jsp"
                        );

                    } else if ("Patient"
                            .equalsIgnoreCase(databaseRole)) {

                        response.sendRedirect(
                                "patient.jsp"
                        );

                    } else {

                        response.sendRedirect(
                                "index.jsp"
                        );
                    }
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            showMessage(
                    response,
                    "Login error: " + e.getMessage()
            );
        }
    }

    private void showMessage(
            HttpServletResponse response,
            String message)
            throws IOException {

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Medical IoT Login</title>");

        out.println("<style>");

        out.println(
                "body {"
                + "font-family:Arial;"
                + "background:#f4f7fb;"
                + "text-align:center;"
                + "padding-top:80px;"
                + "}"
        );

        out.println(
                "h2 {color:#123c69;}"
        );

        out.println(
                "a {"
                + "display:inline-block;"
                + "margin-top:20px;"
                + "padding:10px 20px;"
                + "background:#1976d2;"
                + "color:white;"
                + "text-decoration:none;"
                + "border-radius:6px;"
                + "}"
        );

        out.println("</style>");
        out.println("</head>");

        out.println("<body>");

        out.println("<h2>Medical IoT Login</h2>");

        out.println("<p>" + message + "</p>");

        out.println(
                "<a href='login.jsp'>Back to Login</a>"
        );

        out.println("</body>");
        out.println("</html>");
    }
}