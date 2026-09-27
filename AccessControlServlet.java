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

@WebServlet("/access")
public class AccessControlServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String patientName = request.getParameter("patientName");
        String doctorName = request.getParameter("doctorName");
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        String sql =
                "INSERT INTO access_requests "
                + "(patient_name, doctor_name, access_type, reason) "
                + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                showMessage(response, "Database connection failed.");
                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, patientName);
                ps.setString(2, doctorName);
                ps.setString(3, accessType);
                ps.setString(4, reason);

                int result = ps.executeUpdate();

                if (result > 0) {

                    showMessage(
                            response,
                            "Access Control Request Submitted Successfully!<br><br>"
                            + "Patient: " + patientName + "<br>"
                            + "Doctor: " + doctorName + "<br>"
                            + "Access Type: " + accessType + "<br>"
                            + "Reason: " + reason
                    );

                } else {

                    showMessage(
                            response,
                            "Access request could not be submitted."
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            showMessage(
                    response,
                    "Access control error: " + e.getMessage()
            );
        }
    }

    private void showMessage(HttpServletResponse response,
                             String message)
            throws IOException {

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Access Control</title>");
        out.println("</head>");

        out.println("<body>");

        out.println("<h2>Medical IoT Access Control</h2>");

        out.println("<p>" + message + "</p>");

        out.println("<br>");

        out.println("<a href='cloudserver.jsp'>Back to Cloud Server</a>");

        out.println("</body>");
        out.println("</html>");
    }
}