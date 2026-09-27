<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clinical Reports</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #333;
        }

        .header {
            background: #123c69;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 24px;
        }

        .container {
            width: 92%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .title {
            margin-bottom: 25px;
        }

        .title h2 {
            color: #123c69;
            margin-bottom: 8px;
        }

        .title p {
            color: #666;
        }

        .report-box {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.10);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #123c69;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f7f9fc;
        }

        .status {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 13px;
            background: #e8f5e9;
            color: #26733a;
        }

        .btn {
            display: inline-block;
            margin-top: 25px;
            background: #123c69;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 5px;
        }

        .btn:hover {
            background: #0b2948;
        }

        @media (max-width: 700px) {
            .header {
                padding: 18px 20px;
            }

            .container {
                width: 95%;
            }
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Medical IoT Blockchain</h1>
        <span>Clinical Reports</span>
    </div>

    <div class="container">

        <div class="title">
            <h2>Clinical Reports</h2>
            <p>
                View clinical information securely within
                the Medical IoT system.
            </p>
        </div>

        <div class="report-box">

            <table>

                <thead>
                    <tr>
                        <th>Report ID</th>
                        <th>Patient Name</th>
                        <th>Doctor</th>
                        <th>Report Type</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>CR001</td>
                        <td>Patient 01</td>
                        <td>Doctor 01</td>
                        <td>General Checkup</td>
                        <td>25-09-2026</td>
                        <td>
                            <span class="status">Available</span>
                        </td>
                    </tr>

                    <tr>
                        <td>CR002</td>
                        <td>Patient 02</td>
                        <td>Doctor 02</td>
                        <td>Sensor Report</td>
                        <td>25-09-2026</td>
                        <td>
                            <span class="status">Available</span>
                        </td>
                    </tr>

                </tbody>

            </table>

            <a href="index.jsp" class="btn">
                ← Back to Home
            </a>

        </div>

    </div>

</body>
</html>