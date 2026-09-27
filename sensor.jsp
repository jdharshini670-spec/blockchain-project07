<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medical IoT Sensor Data</title>

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
        }

        .header h1 {
            font-size: 24px;
        }

        .container {
            width: 90%;
            max-width: 650px;
            margin: 40px auto;
        }

        .form-box {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.12);
        }

        .form-box h2 {
            text-align: center;
            color: #123c69;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #123c69;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .btn:hover {
            background: #0b2948;
        }

        .back {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #555;
            text-decoration: none;
        }

        .info {
            margin-bottom: 20px;
            padding: 12px;
            background: #eef5fb;
            border-left: 4px solid #123c69;
            line-height: 1.5;
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Medical IoT Sensor</h1>
    </div>

    <div class="container">

        <div class="form-box">

            <h2>Patient Sensor Data</h2>

            <div class="info">
                Enter the patient information collected
                from the Medical IoT sensor.
            </div>

            <form action="sensor" method="post">

                <label>Patient Name</label>
                <input type="text"
                       name="patientName"
                       placeholder="Enter patient name"
                       required>

                <label>Heart Rate</label>
                <input type="text"
                       name="heartRate"
                       placeholder="Example: 78 BPM"
                       required>

                <label>Temperature</label>
                <input type="text"
                       name="temperature"
                       placeholder="Example: 98.6 °F"
                       required>

                <label>Blood Pressure</label>
                <input type="text"
                       name="bloodPressure"
                       placeholder="Example: 120/80 mmHg"
                       required>

                <label>Oxygen Level</label>
                <input type="text"
                       name="oxygenLevel"
                       placeholder="Example: 98%"
                       required>

                <button type="submit" class="btn">
                    Save Sensor Data
                </button>

            </form>

            <a href="index.jsp" class="back">
                ← Back to Home
            </a>

        </div>

    </div>

</body>
</html>