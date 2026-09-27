<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access Control Request</title>

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

        .info {
            margin-bottom: 20px;
            padding: 12px;
            background: #eef5fb;
            border-left: 4px solid #123c69;
            line-height: 1.5;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-family: Arial, sans-serif;
        }

        textarea {
            height: 100px;
            resize: vertical;
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
    </style>
</head>

<body>

    <div class="header">
        <h1>Medical IoT Blockchain</h1>
    </div>

    <div class="container">

        <div class="form-box">

            <h2>Access Control Request</h2>

            <div class="info">
                Submit a request to access protected medical
                information.
            </div>

            <form action="access" method="post">

                <label>Patient Name</label>
                <input type="text"
                       name="patientName"
                       placeholder="Enter patient name"
                       required>

                <label>Doctor Name</label>
                <input type="text"
                       name="doctorName"
                       placeholder="Enter doctor name"
                       required>

                <label>Access Type</label>

                <select name="accessType" required>
                    <option value="">-- Select Access Type --</option>
                    <option value="Clinical Report">
                        Clinical Report
                    </option>
                    <option value="Sensor Data">
                        Sensor Data
                    </option>
                    <option value="Patient Details">
                        Patient Details
                    </option>
                </select>

                <label>Reason</label>

                <textarea name="reason"
                          placeholder="Enter reason for access"
                          required></textarea>

                <button type="submit" class="btn">
                    Submit Access Request
                </button>

            </form>

            <a href="cloudserver.jsp" class="back">
                ← Back to Cloud Server
            </a>

        </div>

    </div>

</body>
</html>