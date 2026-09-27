<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cloud Server Dashboard</title>

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
            width: 92%;
            max-width: 1150px;
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
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.10);
        }

        .card h3 {
            color: #123c69;
            margin-bottom: 12px;
            font-size: 18px;
        }

        .card p {
            color: #666;
            line-height: 1.5;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .btn {
            display: inline-block;
            background: #123c69;
            color: white;
            text-decoration: none;
            padding: 10px 16px;
            border-radius: 5px;
        }

        .btn:hover {
            background: #0b2948;
        }

        @media (max-width: 850px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 550px) {
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
        <h1>Cloud Server Dashboard</h1>
        <a href="login.jsp" class="logout">Logout</a>
    </div>

    <div class="container">

        <div class="welcome">
            <h2>Welcome, Cloud Server</h2>
            <p>
                Manage doctors, patients, clinical reports,
                access requests and blockchain traceability.
            </p>
        </div>

        <div class="cards">

            <div class="card">
                <h3>View / Authorize Doctor</h3>
                <p>
                    View registered doctors and manage
                    doctor authorization.
                </p>
                <a href="#" class="btn">View Doctors</a>
            </div>

            <div class="card">
                <h3>Clinical Reports</h3>
                <p>
                    View clinical reports stored in the
                    Medical IoT system.
                </p>
                <a href="clinicalreports.jsp" class="btn">View Reports</a>
            </div>

            <div class="card">
                <h3>Patient Details</h3>
                <p>
                    View registered patient information
                    securely.
                </p>
                <a href="patientData" class="btn">View Patients</a>
            </div>

            <div class="card">
                <h3>Blockchain Traceability</h3>
                <p>
                    Trace patient information and verify
                    blockchain-based records.
                </p>
                <a href="blockchain" class="btn">Trace Blockchain</a>
            </div>

            <div class="card">
                <h3>Access Control Request</h3>
                <p>
                    View and manage requests for accessing
                    medical information.
                </p>
                <a href="access.jsp" class="btn">View Requests</a>
            </div>

            <div class="card">
                <h3>Encryption Key Requests</h3>
                <p>
                    Manage requests related to secure
                    encryption keys.
                </p>
                <a href="#" class="btn">View Key Requests</a>
            </div>

            <div class="card">
                <h3>Key Transaction</h3>
                <p>
                    View secure key transaction information.
                </p>
                <a href="#" class="btn">View Transaction</a>
            </div>

            <div class="card">
                <h3>Result Chart</h3>
                <p>
                    View medical IoT results in chart format.
                </p>
                <a href="#" class="btn">View Chart</a>
            </div>

        </div>

    </div>

</body>
</html>