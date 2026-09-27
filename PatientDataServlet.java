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

@WebServlet("/patientData")
public class PatientDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String sql =
                "SELECT * FROM sensor_data ORDER BY created_at DESC";

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Patient Sensor Data</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Patient Sensor Data</h2>");

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                out.println("<p>Database connection failed.</p>");
                return;
            }

            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                out.println("<table border='1' cellpadding='10'>");

                out.println("<tr>");
                out.println("<th>Patient</th>");
                out.println("<th>Heart Rate</th>");
                out.println("<th>Temperature</th>");
                out.println("<th>Blood Pressure</th>");
                out.println("<th>Oxygen Level</th>");
                out.println("<th>Date</th>");
                out.println("</tr>");

                while (rs.next()) {

                    out.println("<tr>");

                    out.println("<td>"
                            + rs.getString("patient_name")
                            + "</td>");

                    out.println("<td>"
                            + rs.getString("heart_rate")
                            + "</td>");

                    out.println("<td>"
                            + rs.getString("temperature")
                            + "</td>");

                    out.println("<td>"
                            + rs.getString("blood_pressure")
                            + "</td>");

                    out.println("<td>"
                            + rs.getString("oxygen_level")
                            + "</td>");

                    out.println("<td>"
                            + rs.getTimestamp("created_at")
                            + "</td>");

                    out.println("</tr>");
                }

                out.println("</table>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            out.println("<p>Error: "
                    + e.getMessage()
                    + "</p>");
        }

        out.println("<br>");
        out.println("<a href='doctor.jsp'>Back to Doctor Dashboard</a>");
        out.println("<br><br>");
        out.println("<a href='patient.jsp'>Back to Patient Dashboard</a>");

        out.println("</body>");
        out.println("</html>");
    }
}