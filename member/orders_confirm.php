<?php
session_start();
include('../condb.php');

// Check if order data is available in session
if (!isset($_SESSION['order'])) {
    header('Location: index.php');
    exit();
}

$order = $_SESSION['order'];
?>

<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ยืนยันการสั่งซื้อ - ระบบสั่งซื้อสินค้า</title>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;500;600&family=Sarabun:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Kanit', 'Sarabun', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            font-size: 32px;
            color: #3a3a3a;
            margin-bottom: 10px;
            font-weight: 600;
        }
        .success-message {
            background: linear-gradient(to right, #d4ffea, #d4edda);
            color: #155724;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(21, 87, 36, 0.1);
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .success-message h2 {
            color: #155724;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(21, 87, 36, 0.2);
            text-align: center;
        }
        .success-message h2::after {
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(to right, #155724, #2ecc71);
        }
        .success-message p {
            font-size: 16px;
            margin: 15px 0;
        }
        .success-message strong {
            font-size: 18px;
            color: #0d5219;
        }
        .back-link {
            margin-top: 30px;
            text-align: center;
        }
        .back-link a {
            text-decoration: none;
            color: rgb(187, 194, 201);
            font-weight: 600;
            transition: color 0.3s ease;
            display: inline-flex;
            align-items: center;
        }
        .back-link a:hover {
            color: rgb(0, 0, 0);
        }
        .back-link a i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-check-circle"></i> ยืนยันการสั่งซื้อ</h1>
        </div>
        <div class="success-message">
            <h2><i class="fas fa-check-circle"></i> ขอบคุณสำหรับการสั่งซื้อ!</h2>
            <p>เราได้รับคำสั่งซื้อของคุณแล้ว จะจัดส่งสินค้าภายใน 2-3 วันทำการ</p>
            <p class="mt-3">รหัสคำสั่งซื้อของคุณ:</p>

        <div class="back-link">
            <a href="index.php" class="btn"><i class="fas fa-home"></i> กลับไปยังหน้าหลัก</a>
        </div>
    </div>
</div>
</body>
</html>