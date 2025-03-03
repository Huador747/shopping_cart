<?php
// เริ่มต้น session สำหรับเก็บข้อมูลการสั่งซื้อ
session_start();

// รับค่า id สินค้าจาก URL
$p_id = isset($_GET['id']) ? (int) $_GET['id'] : null;

// ตรวจสอบว่า id อยู่ในช่วงที่กำหนด (2-52)
if ($p_id < 2 || $p_id > 52) {
    // หากไม่อยู่ในช่วง ให้เปลี่ยนเป็น null เพื่อแสดงข้อความแจ้งเตือน
    $product_id = null;
}

// ฟังก์ชันเชื่อมต่อฐานข้อมูล
function connectDB()
{
    $servername = "localhost";
    $username = "root";  // ปรับให้เป็น username ของคุณ
    $password = "";      // ปรับให้เป็น password ของคุณ
    $dbname = "shopping_cart"; // ปรับให้เป็นชื่อฐานข้อมูลของคุณ

    // สร้างการเชื่อมต่อ
    $conn = new mysqli("localhost", "root", "", "shopping_cart");

    // ตรวจสอบการเชื่อมต่อ
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // กำหนด charset เป็น utf8
    $conn->set_charset("utf8");

    return $conn;
}

// ฟังก์ชันทดสอบการเชื่อมต่อฐานข้อมูล
function testDatabaseConnection()
{
    $conn = connectDB();

    // ทดสอบการเชื่อมต่อด้วยคำสั่ง SQL ทดสอบ
    $result = $conn->query("SHOW TABLES");

    if ($result) {
        echo "Database connection successful. Tables in database:<br>";
        while ($row = $result->fetch_row()) {
            echo $row[0] . "<br>";
        }
    } else {
        echo "Error querying database: " . $conn->error;
    }

    $conn->close();
}

// ฟังก์ชันดึงข้อมูลสินค้าจาก id - แก้ไขเพื่อตรวจสอบความผิดพลาด
function getProductById($id)
{
    $conn = connectDB();

    // ใช้ Prepared Statement เพื่อป้องกัน SQL Injection
    $stmt = $conn->prepare("SELECT * FROM tbl_product WHERE p_id = ?");

    // ตรวจสอบว่า prepare สำเร็จหรือไม่
    if ($stmt === false) {
        // แสดงข้อผิดพลาดและออกจากฟังก์ชัน
        echo "Prepare statement failed: " . $conn->error;
        $conn->close();
        return null;
    }

    $stmt->bind_param("i", $id);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $product = $result->fetch_assoc();
        $stmt->close();
        $conn->close();
        return $product;
    } else {
        $stmt->close();
        $conn->close();
        return null;
    }
}

// ดึงข้อมูลสินค้า
$selected_product = null;
if ($p_id) {
    $selected_product = getProductById($p_id);
}

// ตรวจสอบการส่งฟอร์ม
$form_submitted = false;
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // ตรวจสอบข้อมูลที่ส่งมา
    if (empty($_POST['fullname'])) {
        $errors[] = 'กรุณากรอกชื่อ-นามสกุล';
    }

    if (empty($_POST['phone'])) {
        $errors[] = 'กรุณากรอกเบอร์โทรศัพท์';
    } elseif (!preg_match('/^[0-9]{10}$/', $_POST['phone'])) {
        $errors[] = 'เบอร์โทรศัพท์ไม่ถูกต้อง (กรุณากรอก 10 หลัก)';
    }

    if (empty($_POST['address'])) {
        $errors[] = 'กรุณากรอกที่อยู่';
    }

    if (empty($_POST['payment_method'])) {
        $errors[] = 'กรุณาเลือกวิธีการชำระเงิน';
    }

    // ถ้าไม่มีข้อผิดพลาด
    if (empty($errors) && $selected_product) {
        // บันทึกการสั่งซื้อลงฐานข้อมูล
        $conn = connectDB();

        $stmt = $conn->prepare("INSERT INTO tbl_orders (p_name, m_name, m_tel, m_address, payment_method, total_price, order_date) VALUES (?, ?, ?, ?, ?, ?, NOW())");

        // ตรวจสอบว่า prepare สำเร็จหรือไม่
        if ($stmt === false) {
            $errors[] = 'เกิดข้อผิดพลาดในการเตรียมคำสั่ง SQL: ' . $conn->error;
            $conn->close();
        } else {
            $fullname = $_POST['fullname'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $payment_method = $_POST['payment_method'];
            $total_price = isset($selected_product['p_price']) ? $selected_product['p_price'] : 0;
            $product_name = $selected_product['p_name'];

            $stmt->bind_param("sssssd", $product_name, $fullname, $phone, $address, $payment_method, $total_price);

            if ($stmt->execute()) {
                // สั่งซื้อสำเร็จ
                $order_id = $conn->insert_id;

                // เก็บข้อมูลการสั่งซื้อไว้ใน session
                $_SESSION['order'] = [
                    'order_id' => $order_id,
                    'product_name' => $product_name,
                    'price' => $total_price,
                    'customer' => [
                        'fullname' => $fullname,
                        'phone' => $phone,
                        'address' => $address,
                        'payment_method' => $payment_method
                    ]
                ];

                $form_submitted = true;
            } else {
                $errors[] = 'เกิดข้อผิดพลาดในการบันทึกคำสั่งซื้อ: ' . $stmt->error;
            }

            $stmt->close();
            $conn->close();
        }
    } else {
        $errors[] = 'ไม่พบสินค้าที่เลือก';
    }
}

// ทดสอบการเชื่อมต่อฐานข้อมูล - เปิดใช้งานถ้าต้องการทดสอบ
// testDatabaseConnection();
?>

<!DOCTYPE html>
<html lang="th">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ชำระเงิน - ระบบสั่งซื้อสินค้า</title>
    <!-- เพิ่ม Google Fonts สำหรับ Kanit และ Sarabun -->
    <link
        href="https://fonts.googleapis.com/css2?family=Kanit:wght@300;400;500;600&family=Sarabun:wght@300;400;500;600&display=swap"
        rel="stylesheet">
    <!-- เพิ่ม Font Awesome สำหรับไอคอน -->
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

        .checkout-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 30px;
        }

        .checkout-form,
        .order-summary {
            flex: 1;
            min-width: 320px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .checkout-form:hover,
        .order-summary:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        h1,
        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, #007bff, #00c6ff);
            border-radius: 3px;
        }

        .steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
            position: relative;
            padding: 0 10px;
        }

        .steps::before {
            content: '';
            position: absolute;
            top: 15px;
            left: 10%;
            right: 10%;
            height: 3px;
            background: #e0e0e0;
            z-index: 1;
            border-radius: 3px;
        }

        .step {
            position: relative;
            z-index: 2;
            text-align: center;
            flex: 1;
        }

        .step-circle {
            width: 36px;
            height: 36px;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin: 0 auto 10px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(37, 117, 252, 0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .step:hover .step-circle {
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(37, 117, 252, 0.3);
        }

        .step.active .step-circle {
            background: linear-gradient(135deg, #11cb6a 0%, #25fc7b 100%);
            box-shadow: 0 4px 8px rgba(17, 203, 106, 0.2);
        }

        .step-text {
            font-weight: 500;
            color: #555;
            font-size: 14px;
            margin-top: 5px;
        }

        .step.active .step-text {
            color: #11cb6a;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #4a4a4a;
            font-size: 15px;
        }

        input[type="text"],
        input[type="tel"],
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #eaeaea;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            transition: all 0.3s ease;
            font-family: 'Sarabun', sans-serif;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus,
        input[type="tel"]:focus,
        textarea:focus {
            border-color: #4a90e2;
            outline: none;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
        }

        .payment-methods {
            margin-top: 30px;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
        }

        .payment-option {
            margin-bottom: 18px;
            padding: 12px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
        }

        .payment-option:hover {
            background-color: #f0f0f0;
        }

        .payment-option input[type="radio"] {
            margin-right: 10px;
            transform: scale(1.2);
            accent-color: #4a90e2;
        }

        .payment-option label {
            margin-left: 5px;
            font-weight: 400;
            color: #333;
            font-size: 16px;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .payment-option label i {
            margin-right: 10px;
            font-size: 20px;
            color: #4a90e2;
        }

        .btn {
            background: linear-gradient(to right, #4a90e2, #5ca9fb);
            color: white;
            border: none;
            padding: 14px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: 0 4px 10px rgba(74, 144, 226, 0.3);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .btn i {
            margin-left: 8px;
        }

        .btn:hover {
            background: linear-gradient(to right, #3a80d2, #4a99eb);
            box-shadow: 0 6px 15px rgba(74, 144, 226, 0.4);
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(74, 144, 226, 0.3);
        }

        .product-item {
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 1px solid #eee;
            padding-bottom: 25px;
            transition: transform 0.3s ease;
        }

        .product-item:hover {
            transform: translateX(5px);
        }

        .product-image {
            width: 120px;
            height: 120px;
            background: #f5f5f5;
            margin-right: 25px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-image:hover img {
            transform: scale(1.05);
        }

        .product-details {
            flex: 1;
        }

        .product-details h3 {
            margin: 0 0 10px 0;
            font-size: 20px;
            color: #2c3e50;
            font-weight: 600;
        }

        .product-details p {
            margin: 5px 0;
            color: #666;
        }

        .product-price {
            font-weight: bold;
            color: #e83e8c;
            font-size: 22px;
            margin-top: 10px;
        }

        .total {
            font-size: 24px;
            font-weight: 600;
            margin-top: 30px;
            text-align: right;
            color: #2c3e50;
            padding-top: 20px;
            border-top: 2px dashed #eee;
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
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
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

        .error-message {
            background: linear-gradient(to right, #fff5f5, #f8d7da);
            color: #721c24;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(114, 28, 36, 0.1);
            animation: shakeError 0.5s ease;
        }

        @keyframes shakeError {

            0%,
            100% {
                transform: translateX(0);
            }

            10%,
            30%,
            50%,
            70%,
            90% {
                transform: translateX(-5px);
            }

            20%,
            40%,
            60%,
            80% {
                transform: translateX(5px);
            }
        }

        .error-message strong {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
        }

        .error-message ul {
            margin: 0;
            padding-left: 25px;
        }

        .error-message li {
            margin-bottom: 5px;
        }

        .back-link {
            margin-top: 30px;
            text-align: center;
        }

        .back-link a {
            text-decoration: none;
            color: rgb(180, 209, 243);
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

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .checkout-container {
                flex-direction: column;
            }

            .checkout-form,
            .order-summary {
                min-width: 100%;
            }

            .steps {
                flex-wrap: wrap;
            }

            .step {
                flex: 0 0 50%;
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-shopping-cart"></i> ชำระเงิน</h1>
        </div>

        <?php if ($form_submitted): ?>
            <div class="success-message">
                <h2><i class="fas fa-check-circle"></i> ขอบคุณสำหรับการสั่งซื้อ!</h2>
                <p>เราได้รับคำสั่งซื้อของคุณแล้ว จะจัดส่งสินค้าภายใน 2-3 วันทำการ</p>
                <p>รหัสคำสั่งซื้อของคุณคือ: <?php echo $_SESSION['order']['order_id']; ?></p>
                <p>คุณจะได้รับข้อความยืนยันการสั่งซื้อไปยังเบอร์
                    <?php echo htmlspecialchars($_SESSION['order']['customer']['phone']); ?> เร็วๆ นี้</p>
                <div class="back-link">
                    <a href="index.php" class="btn"><i class="fas fa-home"></i> กลับไปยังหน้าหลัก</a>
                </div>
            </div>
        <?php else: ?>

            <!-- ขั้นตอนการสั่งซื้อ -->
            <div class="steps">
                <div class="step">
                    <div class="step-circle"><i class="fas fa-box"></i></div>
                    <div class="step-text">เลือกสินค้า</div>
                </div>
                <div class="step active">
                    <div class="step-circle"><i class="fas fa-pencil-alt"></i></div>
                    <div class="step-text">กรอกข้อมูล</div>
                </div>
                <div class="step">
                    <div class="step-circle"><i class="fas fa-check"></i></div>
                    <div class="step-text">ยืนยันการสั่งซื้อ</div>
                </div>
                <div class="step">
                    <div class="step-circle"><i class="fas fa-credit-card"></i></div>
                    <div class="step-text">ชำระเงิน</div>
                </div>
            </div>

            <?php if (!$selected_product): ?>
                <div class="error-message"><i class="fas fa-exclamation-triangle"></i> ไม่พบสินค้าที่เลือก กรุณาเลือกสินค้าใหม่
                </div>
                <p><a href="index.php" class="btn"><i class="fas fa-arrow-left"></i> กลับไปยังหน้าสินค้า</a></p>
            <?php else: ?>

                <?php if (!empty($errors)): ?>
                    <div class="error-message">
                        <strong><i class="fas fa-exclamation-circle"></i> กรุณาแก้ไขข้อผิดพลาด:</strong>
                        <ul>
                            <?php foreach ($errors as $error): ?>
                                <li><?php echo $error; ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                <?php endif; ?>

                <div class="checkout-container">
                    <!-- ฟอร์มกรอกข้อมูล -->
                    <div class="checkout-form">
                        <h2><i class="fas fa-shipping-fast"></i> ข้อมูลการจัดส่ง</h2>
                        <form method="POST" action="">
                            <div class="form-group">
                                <label for="fullname"><i class="fas fa-user"></i> ชื่อ-นามสกุล *</label>
                                <input type="text" id="fullname" name="fullname" required placeholder="กรุณากรอกชื่อ-นามสกุล"
                                    value="<?php echo isset($_POST['fullname']) ? htmlspecialchars($_POST['fullname']) : ''; ?>">
                            </div>

                            <div class="form-group">
                                <label for="phone"><i class="fas fa-phone-alt"></i> เบอร์โทรศัพท์ *</label>
                                <input type="tel" id="phone" name="phone" required placeholder="กรุณากรอกเบอร์โทรศัพท์"
                                    value="<?php echo isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : ''; ?>">
                            </div>

                            <div class="form-group">
                                <label for="address"><i class="fas fa-map-marker-alt"></i> ที่อยู่จัดส่ง *</label>
                                <textarea id="address" name="address" rows="4" required
                                    placeholder="กรุณากรอกที่อยู่จัดส่ง"><?php echo isset($_POST['address']) ? htmlspecialchars($_POST['address']) : ''; ?></textarea>
                            </div>

                            <div class="payment-methods">
                                <h2><i class="fas fa-wallet"></i> วิธีการชำระเงิน</h2>

                                <div class="payment-option">
                                    <input type="radio" id="bank-transfer" name="payment_method" value="bank_transfer" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'bank_transfer') ? 'checked' : ''; ?>>
                                    <label for="bank-transfer"><i class="fas fa-university"></i> โอนเงินผ่านธนาคาร</label>
                                </div>

                                <div class="payment-option">
                                    <input type="radio" id="credit-card" name="payment_method" value="credit_card" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'credit_card') ? 'checked' : ''; ?>>
                                    <label for="credit-card"><i class="fas fa-credit-card"></i> บัตรเครดิต/เดบิต</label>
                                </div>

                                <div class="payment-option">
                                    <input type="radio" id="cod" name="payment_method" value="cod" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'cod') ? 'checked' : ''; ?>>
                                    <label for="cod"><i class="fas fa-truck"></i> เก็บเงินปลายทาง (COD)</label>
                                </div>
                            </div>

                            <form action="orders_confirm.php" method="post">
                                <button type="submit" class="btn">ยืนยันการสั่งซื้อ <i class="fas fa-check-circle"></i></button>
                            </form>
                    </div>

                    <!-- สรุปรายการสั่งซื้อ -->
                    <div class="order-summary">
                        <h2><i class="fas fa-shopping-basket"></i> สรุปรายการสั่งซื้อ</h2>

                        <div class="product-item">
                            <div class="product-image">
                                <img src="../p_img/<?php echo htmlspecialchars($selected_product['p_img']); ?>"
                                    alt="<?php echo htmlspecialchars($selected_product['p_name']); ?>">
                            </div>
                            <div class="product-details">
                                <h3><?php echo htmlspecialchars($selected_product['p_name']); ?></h3>
                                <p><i class="fas fa-barcode"></i> รหัสสินค้า: <?php echo htmlspecialchars($product_id); ?></p>
                                <p class="product-price">฿<?php echo number_format($selected_product['p_price'], 2); ?></p>
                            </div>
                        </div>

                        <div class="total">
                            <i class="fas fa-tags"></i> ยอดรวมทั้งสิ้น:
                            ฿<?php echo number_format($selected_product['p_price'], 2); ?>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</body>

</html>