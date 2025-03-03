<?php
// เริ่มต้น session สำหรับเก็บข้อมูลการสั่งซื้อ
session_start();

// รับค่า id สินค้าจาก URL
$product_id = isset($_GET['id']) ? (int)$_GET['id'] : null;

// ตรวจสอบว่า id อยู่ในช่วงที่กำหนด (2-52)
if ($product_id < 2 || $product_id > 52) {
    // หากไม่อยู่ในช่วง ให้เปลี่ยนเป็น null เพื่อแสดงข้อความแจ้งเตือน
    $product_id = null;
}

// ฟังก์ชันเชื่อมต่อฐานข้อมูล
function connectDB() {
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
function testDatabaseConnection() {
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
function getProductById($id) {
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
if ($product_id) {
    $selected_product = getProductById($product_id);
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
    if (empty($errors)) {
        // บันทึกการสั่งซื้อลงฐานข้อมูล
        $conn = connectDB();
        
        $stmt = $conn->prepare("INSERT INTO orders (product_id, fullname, phone, address, payment_method, total_price, order_date) VALUES (?, ?, ?, ?, ?, ?, NOW())");
        
        // ตรวจสอบว่า prepare สำเร็จหรือไม่
        if ($stmt === false) {
            $errors[] = 'เกิดข้อผิดพลาดในการเตรียมคำสั่ง SQL: ' . $conn->error;
            $conn->close();
        } else {
            $fullname = $_POST['fullname'];
            $phone = $_POST['phone'];
            $address = $_POST['address'];
            $payment_method = $_POST['payment_method'];
            $total_price = $selected_product['price'];
            
            $stmt->bind_param("issssd", $product_id, $fullname, $phone, $address, $payment_method, $total_price);
            
            if ($stmt->execute()) {
                // สั่งซื้อสำเร็จ
                $order_id = $conn->insert_id;
                
                // เก็บข้อมูลการสั่งซื้อไว้ใน session
                $_SESSION['order'] = [
                    'order_id' => $order_id,
                    'product_id' => $product_id,
                    'product_name' => $selected_product['name'],
                    'price' => $selected_product['price'],
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
    <style>
        body {
            font-family: 'Kanit', 'Sarabun', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .checkout-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }
        .checkout-form {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .order-summary {
            flex: 1;
            min-width: 300px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        h1, h2 {
            color: #333;
        }
        .steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
        }
        .steps::before {
            content: '';
            position: absolute;
            top: 15px;
            left: 0;
            right: 0;
            height: 2px;
            background: #ccc;
            z-index: 1;
        }
        .step {
            position: relative;
            z-index: 2;
        }
        .step-circle {
            width: 30px;
            height: 30px;
            background: #007bff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin: 0 auto 5px;
        }
        .step-text {
            text-align: center;
            font-size: 0.9em;
        }
        .step.active .step-circle {
            background: #28a745;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], 
        input[type="tel"], 
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .payment-methods {
            margin-top: 20px;
        }
        .payment-option {
            margin-bottom: 10px;
        }
        .btn {
            background: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background: #0069d9;
        }
        .product-item {
            display: flex;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        .product-image {
            width: 80px;
            height: 80px;
            background: #eee;
            margin-right: 15px;
            border-radius: 4px;
            overflow: hidden;
        }
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .product-details {
            flex: 1;
        }
        .product-price {
            font-weight: bold;
            color: #e83e8c;
        }
        .total {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            text-align: right;
        }
        .success-message {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .error-message {
            background: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .back-link {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ชำระเงิน</h1>
        
        <?php if ($form_submitted): ?>
            <div class="success-message">
                <h2>ขอบคุณสำหรับการสั่งซื้อ!</h2>
                <p>เราได้รับคำสั่งซื้อของคุณแล้ว จะจัดส่งสินค้าภายใน 2-3 วันทำการ</p>
                <p>รหัสคำสั่งซื้อของคุณคือ: <strong><?php echo $_SESSION['order']['order_id']; ?></strong></p>
                <p>คุณจะได้รับข้อความยืนยันการสั่งซื้อไปยังเบอร์ <?php echo htmlspecialchars($_SESSION['order']['customer']['phone']); ?> เร็วๆ นี้</p>
                
                <div class="back-link">
                    <a href="index.php" class="btn">กลับไปยังหน้าหลัก</a>
                </div>
            </div>
        <?php else: ?>
        
        <!-- ขั้นตอนการสั่งซื้อ -->
        <div class="steps">
            <div class="step">
                <div class="step-circle">1</div>
                <div class="step-text">เลือกสินค้า</div>
            </div>
            <div class="step active">
                <div class="step-circle">2</div>
                <div class="step-text">กรอกข้อมูล</div>
            </div>
            <div class="step">
                <div class="step-circle">3</div>
                <div class="step-text">ยืนยันการสั่งซื้อ</div>
            </div>
            <div class="step">
                <div class="step-circle">4</div>
                <div class="step-text">ชำระเงิน</div>
            </div>
        </div>
        
        <?php if (!$selected_product): ?>
            <div class="error-message">ไม่พบสินค้าที่เลือก กรุณาเลือกสินค้าใหม่</div>
            <p><a href="index.php" class="btn">กลับไปยังหน้าสินค้า</a></p>
        <?php else: ?>
        
        <?php if (!empty($errors)): ?>
            <div class="error-message">
                <strong>กรุณาแก้ไขข้อผิดพลาด:</strong>
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
                <h2>ข้อมูลการจัดส่ง</h2>
                <form method="POST" action="">
                    <div class="form-group">
                        <label for="fullname">ชื่อ-นามสกุล *</label>
                        <input type="text" id="fullname" name="fullname" required value="<?php echo isset($_POST['fullname']) ? htmlspecialchars($_POST['fullname']) : ''; ?>">
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">เบอร์โทรศัพท์ *</label>
                        <input type="tel" id="phone" name="phone" required value="<?php echo isset($_POST['phone']) ? htmlspecialchars($_POST['phone']) : ''; ?>">
                    </div>
                    
                    <div class="form-group">
                        <label for="address">ที่อยู่จัดส่ง *</label>
                        <textarea id="address" name="address" rows="4" required><?php echo isset($_POST['address']) ? htmlspecialchars($_POST['address']) : ''; ?></textarea>
                    </div>
                    
                    <div class="payment-methods">
                        <h2>วิธีการชำระเงิน</h2>
                        
                        <div class="payment-option">
                            <input type="radio" id="bank-transfer" name="payment_method" value="bank_transfer" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'bank_transfer') ? 'checked' : ''; ?>>
                            <label for="bank-transfer">โอนเงินผ่านธนาคาร</label>
                        </div>
                        
                        <div class="payment-option">
                            <input type="radio" id="credit-card" name="payment_method" value="credit_card" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'credit_card') ? 'checked' : ''; ?>>
                            <label for="credit-card">บัตรเครดิต/เดบิต</label>
                        </div>
                        
                        <div class="payment-option">
                            <input type="radio" id="cod" name="payment_method" value="cod" <?php echo (isset($_POST['payment_method']) && $_POST['payment_method'] == 'cod') ? 'checked' : ''; ?>>
                            <label for="cod">เก็บเงินปลายทาง (COD)</label>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn">ยืนยันการสั่งซื้อ</button>
                </form>
            </div>
            
            <!-- สรุปรายการสั่งซื้อ -->
            <div class="order-summary">
                <h2>สรุปรายการสั่งซื้อ</h2>
                
                <div class="product-item">
                    <div class="product-image">
                        <img src="images/<?php echo htmlspecialchars($selected_product['image']); ?>" alt="<?php echo htmlspecialchars($selected_product['name']); ?>">
                    </div>
                    <div class="product-details">
                        <h3><?php echo htmlspecialchars($selected_product['name']); ?></h3>
                        <p>รหัสสินค้า: <?php echo htmlspecialchars($product_id); ?></p>
                        <p class="product-price">฿<?php echo number_format($selected_product['price'], 2); ?></p>
                    </div>
                </div>
                
                <div class="total">
                    ยอดรวมทั้งสิ้น: ฿<?php echo number_format($selected_product['price'], 2); ?>
                </div>
            </div>
        </div>
        <?php endif; ?>
        <?php endif; ?>
    </div>
</body>
</html>