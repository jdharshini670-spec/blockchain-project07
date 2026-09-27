<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Patient Profile</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            margin: 0;
        }

        .header {
            background: #123c69;
            color: white;
            padding: 20px 40px;
        }

        .container {
            width: 90%;
            max-width: 700px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.10);
        }

        h2 {
            color: #123c69;
            margin-bottom: 25px;
        }

        .info {
            padding: 15px;
            margin-bottom: 12px;
            background: #f4f7fb;
            border-radius: 6px;
        }

        .back {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background: #123c69;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<div class="header">
    <h1>Patient Profile</h1>
</div>

<div class="container">

    <div class="card">

        <h2>Registered Patient Information</h2>

        <div class="info">
            <strong>Patient Name:</strong> Registered Patient
        </div>

        <div class="info">
            <strong>Role:</strong> Patient
        </div>

        <div class="info">
            <strong>Account Status:</strong> Active
        </div>

        <a href="patient.jsp" class="back">
            Back to Patient Dashboard
        </a>

    </div>

</div>

</body>
</html>