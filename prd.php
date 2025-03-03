<?php
include('h.php');
include("condb.php");
$p_id = $_GET["id"];
?>
<!DOCTYPE html>

<head>
    <?php include('boot4.php'); ?>
    <style>
        /* General styling */
        body {
            font-family: 'Arial', sans-serif;
        }
        
        .product-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        /* Product images */
        .product-main-img {
            width: 100%;
            cursor: pointer;
            margin-bottom: 15px;
        }
        
        .thumbnail-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }
        
        .thumbnail {
            width: 80px;
            height: 80px;
            object-fit: contain;
            border: 1px solid #ddd;
            cursor: pointer;
        }
        
        .thumbnail:hover {
            border-color: #888;
        }
        
        /* Product details */
        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .product-rating {
            color: #FF9900;
            margin-bottom: 15px;
        }
        
        .product-price {
            font-size: 24px;
            font-weight: bold;
            color: #000;
            margin-bottom: 20px;
        }
        
        .product-spec {
            margin: 15px 0;
            padding: 15px 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }
        
        /* Quantity selector */
        .quantity-selector {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }
        
        .quantity-btn {
            width: 30px;
            height: 30px;
            background: #f5f5f5;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
        
        .quantity-input {
            width: 50px;
            height: 30px;
            border: 1px solid #ddd;
            text-align: center;
            margin: 0 5px;
        }
        
        /* Action buttons */
        .action-btns {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }
        
        .add-to-cart-btn {
            background-color: white;
            color: #333;
            border: 1px solid #333;
            padding: 10px 15px;
            font-weight: bold;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .buy-now-btn {
            background-color: #E57342;
            color: white;
            border: none;
            padding: 10px 15px;
            font-weight: bold;
            border-radius: 3px;
            cursor: pointer;
        }
        
        /* Product tabs */
        .product-tabs {
            margin-top: 30px;
            border-bottom: 1px solid #ddd;
        }
        
        .tab-links {
            display: flex;
            gap: 20px;
            margin-bottom: -1px;
        }
        
        .tab-link {
            padding: 10px 20px;
            cursor: pointer;
            border-bottom: 3px solid transparent;
        }
        
        .tab-link.active {
            border-bottom: 3px solid #E57342;
            font-weight: bold;
        }
        
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1050;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.9);
        }
        
        .modal-content {
            margin: auto;
            display: block;
            max-width: 80%;
            max-height: 80%;
        }
        
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }
        
        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <?php
    include('banner.php');
    include('navbar.php');
    ?>
    <div class="container">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-2 col-md-4 d-none d-md-block">
                <?php include('menu.php'); ?>
            </div>

            <!-- Main Content -->
            <div class="col-lg-10 col-md-8 col-sm-12 product-container" style="margin-top: 20px">
                <?php
                $sql = "SELECT * FROM tbl_product as p 
                    INNER JOIN tbl_type as t ON p.type_id=t.type_id      
                    AND p_id = $p_id";
                $result = mysqli_query($con, $sql) or die("Error in query: $sql " . mysqli_error($con));
                $row = mysqli_fetch_array($result);

                // Update view count
                $sql_last_view = "SELECT p_view FROM tbl_product Where p_id = '" . $p_id . "'";
                $resalt_last_view = mysqli_query($con, $sql_last_view) or die("Error in query: $sql_last_view " . mysqli_error($con));
                $row_last_view = mysqli_fetch_assoc($resalt_last_view);
                $last_view = $row_last_view['p_view']++;
                $last_view++;
                $update_view = "UPDATE `tbl_product` SET `p_view` = '" . $last_view . "' WHERE `p_id` ='" . $p_id . "'";
                $resalt_updateview = $con->query($update_view);
                ?>
                
                <!-- Product Overview Section -->
                <div class="row">
                    <!-- Product Images (Left Side) -->
                    <div class="col-md-6">
                        <div class="row">
                            <!-- Thumbnails -->
                            <div class="col-2">
                                <div class="thumbnail-container">
                                    <?php
                                    $img_path = 'p_img/' . $row['p_img'];
                                    if (file_exists($img_path)) {
                                        echo "<img src='$img_path' class='thumbnail' onclick='changeImage(this.src)'>";
                                        // If you have more images, you can add them here
                                        // For demo, we'll duplicate the same image
                                        echo "<img src='$img_path' class='thumbnail' onclick='changeImage(this.src)'>";
                                        echo "<img src='$img_path' class='thumbnail' onclick='changeImage(this.src)'>";
                                    }
                                    ?>
                                </div>
                            </div>
                            
                            <!-- Main Image -->
                            <div class="col-10">
                                <?php
                                if (file_exists($img_path)) {
                                    echo "<img src='$img_path' class='product-main-img' id='mainImg' onclick='openModal()'>";
                                } else {
                                    echo "Image not found.";
                                }
                                ?>
                            </div>
                        </div>
                        
                        <!-- Image Modal -->
                        <div id="imageModal" class="modal">
                            <span class="close" onclick="closeModal()">&times;</span>
                            <img class="modal-content" id="modalImg">
                        </div>
                    </div>
                    
                    <!-- Product Details (Right Side) -->
                    <div class="col-md-6">
                        <div class="product-title"><?php echo $row["p_name"]; ?></div>
                        
                        
                        <div class="product-price">
                            <?php echo number_format($row["p_price"], 2); ?>
                        </div>
                        
                        <div class="product-type">
                            <strong>ประเภท:</strong> <?php echo $row["type_name"]; ?>
                        </div>
                        
                        <div class="product-spec">
                            <strong>สเปคสินค้า:</strong><br>
                            <?php echo nl2br($row["p_spec"]); ?>
                        </div>
                        
                        <div class="product-stock">
                            <strong>คงเหลือ:</strong> <?php echo $row["p_qty"]; ?> <?php echo $row["p_unit"]; ?>
                        </div>
                        
                        <!-- Quantity Selector -->
                        <div class="quantity-selector">
                            <div class="quantity-btn" onclick="decreaseQty()">-</div>
                            <input type="text" id="quantity" class="quantity-input" value="1">
                            <div class="quantity-btn" onclick="increaseQty()">+</div>
                        </div>
                        
                        <!-- Action Buttons -->
                        <div class="action-btns">
                            <button class="add-to-cart-btn" onclick="redirectToLogin()">เพิ่มลงตะกร้า</button>
                            <button class="buy-now-btn" onclick="redirectToLogin()">ซื้อเลย</button>
                        </div>
                        
                        <!-- Share Buttons -->
                        <div class="share-buttons" style="margin-top: 20px;">
                            
                                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5500ee80057fdb99"></script>
                                <div class="addthis_inline_share_toolbox_sf2w"></div>
                            </p>
                        </div>
                    </div>
                </div>
                
                <!-- Product Tabs Section -->
                <div class="product-tabs">
                    <div class="tab-links">
                        <div class="tab-link active" onclick="changeTab(this, 'overview')">ภาพรวม</div>
                        <div class="tab-link" onclick="changeTab(this, 'specs')">สเปคสินค้า</div>
                        <div class="tab-link" onclick="changeTab(this, 'reviews')">รีวิว</div>
                    </div>
                </div>
                
                <!-- Tab Content -->
                <div id="overview" class="tab-content" style="display: block; margin-top: 20px;">
                    <?php echo nl2br($row["p_detail"]); ?>
                </div>
                
                <div id="specs" class="tab-content" style="display: none; margin-top: 20px;">
                    <?php echo nl2br($row["p_spec"]); ?>
                </div>
                
                <div id="reviews" class="tab-content" style="display: none; margin-top: 20px;">
                    <p>จำนวนการเข้าชม <?php echo $row['p_view']; ?> ครั้ง</p>
                    <p>ยังไม่มีรีวิว</p>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Image functions
        function changeImage(src) {
            document.getElementById('mainImg').src = src;
        }
        
        function openModal() {
            document.getElementById('imageModal').style.display = "block";
            document.getElementById('modalImg').src = document.getElementById('mainImg').src;
        }
        
        function closeModal() {
            document.getElementById('imageModal').style.display = "none";
        }
        
        // Tab functions
        function changeTab(element, tabName) {
            // Hide all tab contents
            var tabContents = document.getElementsByClassName('tab-content');
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }
            
            // Remove active class from all tabs
            var tabs = document.getElementsByClassName('tab-link');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].className = tabs[i].className.replace(" active", "");
            }
            
            // Show the selected tab content and add active class
            document.getElementById(tabName).style.display = "block";
            element.className += " active";
        }
        
        // Quantity functions
        function increaseQty() {
            var qtyInput = document.getElementById('quantity');
            var qty = parseInt(qtyInput.value);
            qtyInput.value = qty + 1;
        }
        
        function decreaseQty() {
            var qtyInput = document.getElementById('quantity');
            var qty = parseInt(qtyInput.value);
            if (qty > 1) {
                qtyInput.value = qty - 1;
            }
        }

        function redirectToLogin() {
            alert("กรุณาเข้าสู่ระบบหรือสมัครสมชิก");
            window.location.href = "form_login.php";
        }
    </script>
</body>

</html>
<?php include('footer.php'); ?>
<?php include('script4.php'); ?>