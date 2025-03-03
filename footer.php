<footer>
    <style>
        footer {
            width: 100%;
            background-color: #333;
            color: #fff;
            padding: 20px 15px; /* ลด padding ให้ Footer เล็กลง */
            text-align: center;
            position: relative;
        }

        .footer-container {
            max-width: 1200px;
            margin: auto;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        nav ul li {
            margin: 5px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.2s ease-in-out;
        }

        nav ul li a:hover {
            color: #f39c12; /* เปลี่ยนสีเมื่อ Hover */
        }

        .footer-info {
            margin-top: 15px;
            font-size: 13px;
        }

        .footer-info p {
            margin: 3px 0;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }

        .social-icons img {
            width: 28px;
            height: 28px;
            object-fit: contain;
            border-radius: 5px;
            transition: transform 0.2s ease-in-out;
        }

        .social-icons img:hover {
            transform: scale(1.1);
        }

        /* Responsive สำหรับจอเล็ก */
        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: center;
            }

            .social-icons img {
                width: 25px;
                height: 25px;
            }
        }
    </style>

    <div class="footer-container">
        <h3>ที่สุดของอุปกรณ์ตกปลา ครบจบในที่เดียว</h3>
        <nav>
            <ul>
                <li><a href="http://localhost/shopping_cart/index.php">สินค้า</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=5">รอกเบทเคสติ้ง</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=6">รอกสปินนิ่ง</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=9">คันเบทเคสติ้ง</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=10">คันสปินนิ่ง</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=11">อุปกรณ์เสริม</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=12">สายเบ็ด</a></li>
                <li><a href="http://localhost/shopping_cart/index.php?act=showbytype&type_id=13">เหยื่อปลอม</a></li>
                
            </ul>
        </nav>
        <div class="footer-info">
            <p>📍 ที่อยู่ร้าน: 39 หมู่ที่ 1 ถนนรังสิต - นครนายก ตำบล คลองหก อำเภอคลองหลวง ปทุมธานี 12110</p>
            <p>📞 เบอร์โทรศัพท์: 099-999-9999</p>
            <p>📧 อีเมล: <a href="mailto:meumaihattok@gmail.com" style="color: #f39c12; text-decoration: none;">meumaihattok@gmail.com</a></p>
            <p>🕒 เวลาทำการ: 09:00 - 21:00 น.</p>
        </div>
        <div class="social-icons">
            <a href="https://www.facebook.com/profile.php?id=61573680238029"><img src="m_img/facebook.png" alt="Facebook"></a>
            <a href="https://www.tiktok.com/th-TH/"><img src="m_img/tiktok.png" alt="Tiktok"></a>
            <a href="https://www.line.me/th/"><img src="m_img/line.png" alt="Line"></a>
            <a href="https://www.youtube.com/"><img src="m_img/youtube.png" alt="YouTube"></a>
        </div>
        <p style="margin-top: 15px; font-size: 12px;">&copy; 2025 Meumaihattok. All Rights Reserved.</p>
    </div>
</footer>
