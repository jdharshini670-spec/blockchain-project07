<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medical IoT - Registration</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
        }

        .header {
            background: #123c69;
            color: white;
            padding: 22px 50px;
        }

        .header h1 {
            font-size: 25px;
        }

        .register-container {
            width: 420px;
            max-width: 90%;
            margin: 50px auto;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.12);
        }

        .register-container h2 {
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

        input, select {
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
    </style>
</head>

<body>

    <div class="header">
        <h1>Medical IoT Blockchain</h1>
    </div>

    <div class="register-container">

        <h2>Create Account</h2>

        <form action="register" method="post">

            <label>Username</label>
            <input type="text"
                   name="username"
                   placeholder="Enter username"
                   required>

            <label>Password</label>
            <input type="password"
                   name="password"
                   placeholder="Enter password"
                   required>

            <label>Select Role</label>

            <select name="role" required>
                <option value="">-- Select Role --</option>
                <option value="Cloud Server">Cloud Server</option>
                <option value="Doctor">Doctor</option>
                <option value="Patient">Patient</option>
            </select>

            <button type="submit" class="btn">
                Register
            </button>

        </form>

        <a href="login.jsp" class="back">
            ← Back to Login
        </a>

    </div>

</body>
</html>