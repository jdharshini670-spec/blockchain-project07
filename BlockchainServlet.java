package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/blockchain")
public class BlockchainServlet extends HttpServlet {

    private static final Blockchain blockchain =
            new Blockchain();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Blockchain Traceability</title>");

        out.println("<style>");
        out.println("body { font-family: Arial; margin: 40px; }");
        out.println("table { border-collapse: collapse; width: 100%; }");
        out.println("th, td { border: 1px solid #999; padding: 10px; }");
        out.println("th { background: #eeeeee; }");
        out.println("</style>");

        out.println("</head>");
        out.println("<body>");

        out.println("<h2>Medical IoT Blockchain Traceability</h2>");

        out.println("<p><b>Blockchain Status:</b> "
                + (blockchain.isChainValid()
                ? "Valid"
                : "Invalid")
                + "</p>");

        out.println("<table>");

        out.println("<tr>");
        out.println("<th>Block Index</th>");
        out.println("<th>Timestamp</th>");
        out.println("<th>Data</th>");
        out.println("<th>Previous Hash</th>");
        out.println("<th>Hash</th>");
        out.println("</tr>");

        for (Block block : blockchain.getChain()) {

            out.println("<tr>");

            out.println("<td>"
                    + block.getIndex()
                    + "</td>");

            out.println("<td>"
                    + block.getTimestamp()
                    + "</td>");

            out.println("<td>"
                    + block.getData()
                    + "</td>");

            out.println("<td>"
                    + block.getPreviousHash()
                    + "</td>");

            out.println("<td>"
                    + block.getHash()
                    + "</td>");

            out.println("</tr>");
        }

        out.println("</table>");

        out.println("<br>");

        out.println("<a href='cloudserver.jsp'>");
        out.println("Back to Cloud Server");
        out.println("</a>");

        out.println("</body>");
        out.println("</html>");
    }

    public static void addTransaction(String data) {

        blockchain.addBlock(data);
    }
}