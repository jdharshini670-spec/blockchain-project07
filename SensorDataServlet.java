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

@WebServlet("/sensor")
public class SensorDataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String patientName = request.getParameter("patientName");
        String heartRate = request.getParameter("heartRate");
        String temperature = request.getParameter("temperature");
        String bloodPressure = request.getParameter("bloodPressure");
        String oxygenLevel = request.getParameter("oxygenLevel");

        String sensorData =
                "Patient: " + patientName
                + ", Heart Rate: " + heartRate
                + ", Temperature: " + temperature
                + ", Blood Pressure: " + bloodPressure
                + ", Oxygen Level: " + oxygenLevel;

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                showMessage(response, "Database connection failed.");
                return;
            }

            String sql =
                    "INSERT INTO sensor_data "
                    + "(patient_name, heart_rate, temperature, "
                    + "blood_pressure, oxygen_level) "
                    + "VALUES (?, ?, ?, ?, ?)";

            try (PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setString(1, patientName);
                ps.setString(2, heartRate);
                ps.setString(3, temperature);
                ps.setString(4, bloodPressure);
                ps.setString(5, oxygenLevel);

                int result = ps.executeUpdate();

                if (result > 0) {

                    BlockchainServlet.addTransaction(sensorData);

                    showMessage(
                            response,
                            "Sensor Data Saved Successfully!<br><br>"
                            + "Blockchain Block Created Successfully.<br><br>"
                            + "Patient: " + patientName + "<br>"
                            + "Heart Rate: " + heartRate + "<br>"
                            + "Temperature: " + temperature + "<br>"
                            + "Blood Pressure: " + bloodPressure + "<br>"
                            + "Oxygen Level: " + oxygenLevel
                    );

                } else {

                    showMessage(
                            response,
                            "Sensor data could not be saved."
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            showMessage(
                    response,
                    "Sensor data error: " + e.getMessage()
            );
        }
    }

    private void showMessage(HttpServletResponse response,
                             String message)
            throws IOException {

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Medical IoT Sensor</title>");
        out.println("</head>");

        out.println("<body>");

        out.println("<h2>Medical IoT Sensor</h2>");

        out.println("<p>" + message + "</p>");

        out.println("<br>");

        out.println("<a href='index.jsp'>Back to Home</a>");

        out.println("</body>");
        out.println("</html>");
    }
}