<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medical IoT Blockchain</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            color: #1f2937;
        }

        .header {
            background: #123c69;
            color: white;
            padding: 22px 50px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 25px;
        }

        .header span {
            font-size: 14px;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 45px auto;
        }

        .welcome {
            text-align: center;
            margin-bottom: 35px;
        }

        .welcome h2 {
            color: #123c69;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #555;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.10);
            text-align: center;
        }

        .card h3 {
            color: #123c69;
            margin-bottom: 12px;
        }

        .card p {
            font-size: 14px;
            line-height: 1.6;
            color: #666;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #123c69;
            color: white;
            padding: 11px 22px;
            border-radius: 6px;
        }

        .btn:hover {
            background: #0b2948;
        }

        .footer {
            margin-top: 60px;
            background: #123c69;
            color: white;
            text-align: center;
            padding: 18px;
            font-size: 13px;
        }

        @media (max-width: 800px) {
            .cards {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 20px;
            }
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Medical IoT Blockchain</h1>
        <span>Security & Privacy Framework</span>
    </div>

    <div class="container">

        <div class="welcome">
            <h2>Blockchain-Based Security and Privacy Framework</h2>
            <p>
                Secure management of Medical IoT data using
                Blockchain and Cryptography.
            </p>
        </div>

        <div class="cards">

            <div class="card">
                <h3>Cloud Server</h3>
                <p>
                    Manage doctors, patients, clinical reports,
                    access control and blockchain traceability.
                </p>

                <a href="login.jsp" class="btn">
                    Login
                </a>
            </div>

            <div class="card">
                <h3>Patient Sensor</h3>
                <p>
                    Register patient information and manage
                    Medical IoT sensor data securely.
                </p>

                <a href="patient.jsp" class="btn">
                    Patient
                </a>
            </div>

            <div class="card">
                <h3>Doctor</h3>
                <p>
                    View patient sensor data, clinical reports
                    and access requests.
                </p>

                <a href="doctor.jsp" class="btn">
                    Doctor
                </a>
            </div>

        </div>

    </div>

    <div class="footer">
        <p>Medical IoT Blockchain Security System</p>
    </div>

</body>
</html>