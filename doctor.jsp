<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>

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

        .logout {
            color: white;
            text-decoration: none;
            background: #c0392b;
            padding: 9px 18px;
            border-radius: 5px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
        }

        .welcome {
            margin-bottom: 30px;
        }

        .welcome h2 {
            color: #123c69;
            margin-bottom: 8px;
        }

        .welcome p {
            color: #666;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 22px;
        }

        .card {
            background: white;
            padding: 28px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.10);
        }

        .card h3 {
            color: #123c69;
            margin-bottom: 12px;
        }

        .card p {
            color: #666;
            line-height: 1.5;
            margin-bottom: 18px;
        }

        .btn {
            display: inline-block;
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
            .cards {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 18px 20px;
            }
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Doctor Dashboard</h1>

        <a href="login.jsp" class="logout">
            Logout
        </a>
    </div>

    <div class="container">

        <div class="welcome">

            <h2>Welcome, Doctor</h2>

            <p>
                View patient sensor information, clinical
                reports and secure access requests.
            </p>

        </div>

        <div class="cards">

            <!-- Sensor Data -->

            <div class="card">

                <h3>Patient Sensor Details</h3>

                <p>
                    View Medical IoT sensor data submitted
                    by patients.
                </p>

                <a href="patientData" class="btn">
                    View Sensor Data
                </a>

            </div>


            <!-- Blockchain -->

            <div class="card">

                <h3>Blockchain Traceability</h3>

                <p>
                    Trace patient information and verify
                    blockchain-based records.
                </p>

                <a href="blockchain" class="btn">
                    Trace Blockchain
                </a>

            </div>


            <!-- Key Request -->

            <div class="card">

                <h3>Key Request</h3>

                <p>
                    View requests related to secure access
                    and encryption keys.
                </p>

                <a href="access.jsp" class="btn">
                    View Key Request
                </a>

            </div>


            <!-- Clinical Reports -->

            <div class="card">

                <h3>Clinical Reports</h3>

                <p>
                    View your available medical clinical reports.
                </p>

                <a href="clinicalreports.jsp" class="btn">
                    View Reports
                </a>

            </div>

        </div>

    </div>

</body>
</html>
