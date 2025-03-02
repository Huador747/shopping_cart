<?php
include('h.php');
include("../condb.php");
$p_id = $_GET["id"];

?>
<!DOCTYPE html>
<head>
    <?php include('../boot4.php'); ?>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .product-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .product-image {
            width: 100%;
            cursor: pointer;
            transition: 0.3s;
        }

        .product-thumbnails {
            margin-top: 15px;
        }

        .thumbnail {
            width: 70px;
            margin: 5px;
            cursor: pointer;
            border: 1px solid #ddd;
        }

        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .rating {
            color: #FFA500;
            margin-bottom: 10px;
        }

        .price {
            font-size: 24px;
            font-weight: bold;
            margin: 15px 0;
        }

        .specs-section {
            margin: 20px 0;
            border-top: 1px solid #eee;
            padding-top: 20px;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }

        .quantity-btn {
            width: 40px;
            height: 40px;
            background: #f5f5f5;
            border: 1px solid #ddd;
            font-size: 18px;
        }

        .quantity-input {
            width: 60px;
            height: 40px;
            text-align: center;
            border: 1px solid #ddd;
            margin: 0 5px;
        }

        .add-to-cart-btn {
            background-color: #fff;
            color: #333;
            border: 1px solid #ddd;
            padding: 10px 20px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 10px;
        }

        .buy-now-btn {
            background-color: #f26522;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            width: 100%;
            margin-bottom: 20px;
        }

        .payment-icons {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .payment-icons img {
            height: 30px;
            margin: 0 5px;
        }

        .shipping-info {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            text-align: center;
        }

        .shipping-item {
            flex: 1;
            padding: 10px;
        }

        .shipping-item i {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .nav-tabs {
            margin-top: 40px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.9);
        }

        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
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

        #caption {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
            text-align: center;
            color: #ccc;
            padding: 10px 0;
            height: 150px;
        }

        @media only screen and (max-width: 768px) {
            .modal-content {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <?php
    include('banner.php');
    include('navbar.php');
    ?>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-lg-2 col-md-4 col-sm-12">
                <?php include('../menu.php'); ?>
            </div>

            <!-- Main Content -->
            <div class="col-lg-10 col-md-8 col-sm-12" style="margin-top: 10px">
                <?php
                // Use prepared statements for security
                $stmt = $con->prepare("SELECT * FROM tbl_product as p 
                INNER JOIN tbl_type as t ON p.type_id=t.type_id      
                WHERE p_id = ?");
                $stmt->bind_param("i", $p_id);
                $stmt->execute();
                $result = $stmt->get_result();
                $row = $result->fetch_assoc();

                $stmt_last_view = $con->prepare("SELECT p_view FROM tbl_product WHERE p_id = ?");
                $stmt_last_view->bind_param("i", $p_id);
                $stmt_last_view->execute();
                $resalt_last_view = $stmt_last_view->get_result();
                $row_last_view = $resalt_last_view->fetch_assoc();
                //เรียกดูวิวของสินค้านั้นๆ
                $last_view = $row_last_view['p_view']++;
                $last_view++;
                //นำวิวสินค้าเดิมมา+1
                $stmt_update_view = $con->prepare("UPDATE tbl_product SET p_view = ? WHERE p_id = ?");
                $stmt_update_view->bind_param("ii", $last_view, $p_id);
                $stmt_update_view->execute();
                //อัพเดทวิวสินค้าใหม่
                
                // Create a fake review count for demo purposes
                $review_count = rand(50, 200);
                $rating = rand(42, 49) / 10;
                ?>

                <div class="product-container">
                    <div class="row">
                        <!-- Product Images -->
                        <div class="col-md-6">
                            <?php
                            $img_path = '../p_img/' . $row['p_img'];
                            if (file_exists($img_path)) {
                                echo "<img src='$img_path' class='product-image' id='myImg' alt='" . $row["p_name"] . "'>";
                            } else {
                                echo "Image not found.";
                            }
                            ?>

                            <!-- Thumbnails (for demo) -->
                            <div class="product-thumbnails">
                                <img src="<?php echo $img_path; ?>" class="thumbnail"
                                    onclick="document.getElementById('myImg').src=this.src">
                                <?php if (file_exists($img_path)) { ?>
                                    <img src="<?php echo $img_path; ?>" class="thumbnail"
                                        onclick="document.getElementById('myImg').src=this.src">
                                    <img src="<?php echo $img_path; ?>" class="thumbnail"
                                        onclick="document.getElementById('myImg').src=this.src">
                                <?php } ?>
                            </div>

                            <!-- Modal for image zoom -->
                            <div id="myModal" class="modal">
                                <span class="close">&times;</span>
                                <img class="modal-content" id="img01">
                                <div id="caption"></div>
                            </div>
                        </div>

                        <!-- Product Info -->
                        <div class="col-md-6">
                            <div class="product-title"><?php echo $row["p_name"]; ?></div>

                            <!-- Rating Stars -->
                            <div class="rating">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star-half-alt"></i>
                                <?php echo $rating; ?> (<?php echo $review_count; ?> reviews) |
                                <i class="far fa-comment-dots"></i> No questions
                            </div>

                            <!-- Price -->
                            <div class="price">฿<?php echo number_format($row["p_price"], 2); ?></div>
                            
                            <!-- Payment Info -->
                            <div>
                                <i class="fab fa-paypal"></i> Pay in 4 interest-free payments of ฿<?php echo number_format($row["p_price"]/4, 2); ?> | Learn more
                            </div>
                            
                            <!-- Product Type -->
                            <div class="specs-section">
                                <div>Model Type: <?php echo $row["type_name"]; ?> </div>
                            
                                <?php if (in_array($row["type_name"], ["คันเบ็ดเคสติ้ง", "คันเบ็ดสปินนิ่ง"])) { ?>
    <!-- Dropdown for variations -->
    <div class="form-group mt-3">
        <select class="form-control">
            <option><?php echo $row["type_name"]; ?> | <?php echo rand(6, 8); ?>' / Fast-2Pcs - ฿<?php echo number_format($row["p_price"], 2); ?></option>    
            <option><?php echo $row["type_name"]; ?> | <?php echo rand(6, 8); ?>' / Fast-2Pcs - ฿<?php echo number_format($row["p_price"], 2); ?></option>
        </select>
    </div>
<?php } ?>
<?php if (in_array($row["type_name"], ["สายเบ็ด"])) { ?>
    <!-- Dropdown for variations -->
    <div class="form-group mt-3">
        <select class="form-control">
            <option><?php echo $row["type_name"]; ?> | 8lb - ฿<?php echo number_format($row["p_price"], 2); ?></option>
            <option><?php echo $row["type_name"]; ?> | 12lb - ฿<?php echo number_format($row["p_price"], 2); ?></option>
            <option><?php echo $row["type_name"]; ?> | 16lb - ฿<?php echo number_format($row["p_price"], 2); ?></option>
        </select>
    </div>
<?php } ?>




                                
                                <!-- Bundle upsell -->
                                <div class="mt-4">
                                    <h5>ห้ามพลาดข้อเสนอสุดพิเศษ!!</h5>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="bundle-check">
                                        <label class="form-check-label" for="bundle-check">
                                            <?php echo $row["type_name"]; ?> River Finesse Baitcasting Reel
                                            <div>฿<?php echo number_format($row["p_price"] * 1.2, 2); ?>
                                                ฿<?php echo number_format($row["p_price"] * 0.9, 2); ?> USD</div>
                                        </label>
                                    </div>
                                </div>

                                <!-- Quantity Selector -->
                                <div class="quantity-selector">
                                    <button class="quantity-btn minus-btn">-</button>
                                    <input type="text" value="1" class="quantity-input" id="quantity" min="1">
                                    <button class="quantity-btn plus-btn">+</button>
                                </div>

                                <!-- Buy Buttons -->
                                <button class="add-to-cart-btn">ADD TO CART</button>
                                <button class="buy-now-btn" onclick="buyNow()">BUY IT NOW</button>

                                <script>
                                    function buyNow() {
                                        const urlParams = new URLSearchParams(window.location.search);
                                        const productId = urlParams.get('id');

                                        if (productId) {
                                            fetch(`fetch_product.php?id=${productId}`)
                                                .then(response => response.json())
                                                .then(data => {
                                                    if (data.success) {
                                                        window.location.href = `checkout.php?id=${productId}&name=${encodeURIComponent(data.name)}&price=${data.price}`;
                                                    } else {
                                                        alert('Failed to fetch product details.');
                                                    }
                                                })
                                                .catch(error => {
                                                    console.error('Error fetching product details:', error);
                                                    alert('An error occurred while fetching product details.');
                                                });
                                        } else {
                                            window.location.href = 'checkout.php';
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product Tabs -->
                <div class="row mt-5">
                    <div class="col-12">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="overview-tab" data-toggle="tab" href="#overview"
                                    role="tab">Overview</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="specs-tab" data-toggle="tab" href="#specs" role="tab">Specs</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews"
                                    role="tab">Reviews</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="overview" role="tabpanel">
                                <div class="p-3">
                                    <h4>รายละเอียดสินค้า</h4>
                                    <p><?php echo nl2br($row["p_detail"]); ?></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="specs" role="tabpanel">
                                <div class="p-3">
                                    <h4>สเปคสินค้า</h4>
                                    <p><?php echo nl2br($row["p_spec"]); ?></p>
                                    <p><b>คงเหลือ :</b> <?php echo $row["p_qty"]; ?> <?php echo $row["p_unit"]; ?></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel">
                                <div class="p-3">
                                    <h4>Reviews</h4>
                                    <p>จำนวนการเข้าชม <?php echo $row['p_view']; ?> ครั้ง</p>
                                    <div class="rating mb-3">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <?php echo $rating; ?> overall rating based on <?php echo $review_count; ?>
                                        reviews
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Social Share -->
                <div class="row mt-3">
                    <div class="col-12"></div>
                        <!-- Go to www.addthis.com/dashboard to customize your tools -->
                        <script type="text/javascript"
                            src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5500ee80057fdb99"></script>
                        <div class="addthis_inline_share_toolbox_sf2w"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById('myImg');
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // Quantity selector functionality
        document.addEventListener('DOMContentLoaded', function () {
            const minusBtn = document.querySelector('.minus-btn');
            const plusBtn = document.querySelector('.plus-btn');
            const quantityInput = document.querySelector('.quantity-input');

            // Set minimum quantity to 1
            const minQuantity = 1;

            // Check if product has max quantity limits
            const maxQuantity = <?php echo isset($row["p_qty"]) ? $row["p_qty"] : 999; ?>;

            // Decrease quantity when minus button is clicked
            minusBtn.addEventListener('click', function () {
                let currentValue = parseInt(quantityInput.value);
                if (currentValue > minQuantity) {
                    quantityInput.value = currentValue - 1;
                }
            });

            // Increase quantity when plus button is clicked
            plusBtn.addEventListener('click', function () {
                let currentValue = parseInt(quantityInput.value);
                if (currentValue < maxQuantity) {
                    quantityInput.value = currentValue + 1;
                } else {
                    alert('สินค้าคงเหลือมีจำนวนจำกัด');
                }
            });

            // Validate input to ensure it's a number and within limits
            quantityInput.addEventListener('change', function () {
                let currentValue = parseInt(quantityInput.value);

                // If not a number, reset to 1
                if (isNaN(currentValue)) {
                    quantityInput.value = minQuantity;
                    return;
                }

                // Ensure minimum quantity
                if (currentValue < minQuantity) {
                    quantityInput.value = minQuantity;
                }

                // Ensure maximum quantity
                if (currentValue > maxQuantity) {
                    quantityInput.value = maxQuantity;
                    alert('สินค้าคงเหลือมีจำนวนจำกัด');
                }
            });
        });

        // Add event listener to checkout button
        document.addEventListener('DOMContentLoaded', function () {
            const checkoutBtn = document.querySelector('.checkout-btn');
            if (checkoutBtn) {
                checkoutBtn.addEventListener('click', function () {
                    window.location.href = 'checkout.php';
                });
            }

            const viewCartBtn = document.querySelector('.view-cart-btn');
            if (viewCartBtn) {
                viewCartBtn.addEventListener('click', function () {
                    window.location.href = 'cart-item.php';
                });
            }
        });
    </script>
    <!-- Add this HTML for the slide-out cart at the end of your body tag, before the closing </body> -->

    <div id="shopping-cart-sidebar" class="cart-sidebar">
        <div class="cart-header">
            <h4>Shopping Cart (<span id="cart-count">0</span>)</h4>
            <button class="close-cart">&times;</button>
        </div>
        <div id="cart-items" class="cart-items">
            <!-- Cart items will be added here dynamically -->
        </div>
        <div class="cart-footer">
            <div class="discount-section">
                <h5>Discount applied</h5>
                <div class="discount-amount">฿0.00</div>
            </div>
            <div class="subtotal-section">
                <h5>Subtotal</h5>
                <div id="cart-subtotal">฿0.00</div>
            </div>
            <button class="view-cart-btn">VIEW CART</button>
        </div>
    </div>

    <style>
        /* Styles for the slide-out cart */
        .cart-sidebar {
            position: fixed;
            top: 0;
            right: -400px;
            /* Start offscreen */
            width: 400px;
            height: 100%;
            background-color: white;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.2);
            z-index: 1001;
            transition: right 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
        }

        .cart-sidebar.open {
            right: 0;
            /* Slide in when open */
        }

        .cart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .close-cart {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }

        .cart-items {
            flex: 1;
            overflow-y: auto;
            padding: 15px;
        }

        .cart-item {
            display: flex;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .cart-item-image {
            width: 80px;
            height: 80px;
            object-fit: contain;
            margin-right: 15px;
        }

        .cart-item-details {
            flex: 1;
        }

        .cart-item-title {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .cart-item-price {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .cart-item-quantity {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .cart-quantity-btn {
            width: 25px;
            height: 25px;
            background: #f5f5f5;
            border: 1px solid #ddd;
            font-size: 14px;
        }

        .cart-quantity-input {
            width: 40px;
            height: 25px;
            text-align: center;
            border: 1px solid #ddd;
            margin: 0 5px;
        }

        .cart-footer {
            padding: 15px;
            border-top: 1px solid #eee;
        }

        .discount-section,
        .subtotal-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .checkout-btn,
        .view-cart-btn {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            text-align: center;
            cursor: pointer;
        }

        .checkout-btn {
            background-color: #f26522;
            color: white;
            border: none;
        }

        .view-cart-btn {
            background-color: white;
            color: #333;
            border: 1px solid #ddd;
        }

        /* Overlay when cart is open */
        .cart-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            display: none;
        }

        .cart-overlay.active {
            display: block;
        }

        @media screen and (max-width: 480px) {
            .cart-sidebar {
                width: 100%;
                right: -100%;
            }
        }
    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get elements
            const addToCartBtn = document.querySelector('.add-to-cart-btn');
            const cartSidebar = document.getElementById('shopping-cart-sidebar');
            const closeCartBtn = document.querySelector('.close-cart');
            const cartItemsContainer = document.getElementById('cart-items');
            const cartCount = document.getElementById('cart-count');
            const cartSubtotal = document.getElementById('cart-subtotal');

            // Create overlay
            const overlay = document.createElement('div');
            overlay.className = 'cart-overlay';
            document.body.appendChild(overlay);

            // Cart items array
            let cartItems = [];
            let cartTotal = 0;

            // Function to open cart
            function openCart() {
                cartSidebar.classList.add('open');
                overlay.classList.add('active');
                document.body.style.overflow = 'hidden'; // Prevent scrolling
            }

            // Function to close cart
            function closeCart() {
                cartSidebar.classList.remove('open');
                overlay.classList.remove('active');
                document.body.style.overflow = ''; // Allow scrolling
            }

            // Add to cart function
            function addToCart() {
                // Get product details
                const productName = document.querySelector('.product-title').textContent;
                const productPrice = parseFloat(document.querySelector('.price').textContent.replace('฿', '').replace(',', ''));
                const productImage = document.getElementById('myImg').src;
                const productQuantity = parseInt(document.getElementById('quantity').value);

                // Check if product already in cart
                const existingItemIndex = cartItems.findIndex(item => item.name === productName);

                if (existingItemIndex !== -1) {
                    // Update quantity if product already in cart
                    cartItems[existingItemIndex].quantity += productQuantity;
                } else {
                    // Add new item to cart
                    cartItems.push({
                        name: productName,
                        price: productPrice,
                        image: productImage,
                        quantity: productQuantity
                    });
                }

                // Update cart display
                updateCartDisplay();

                // Open cart sidebar
                openCart();
            }

            // Update cart display
            function updateCartDisplay() {
                // Clear current cart items
                cartItemsContainer.innerHTML = '';

                // Reset cart total
                cartTotal = 0;

                // Add items to cart display
                cartItems.forEach((item, index) => {
                    const itemTotal = item.price * item.quantity;
                    cartTotal += itemTotal;

                    const cartItemHTML = `
                <div class="cart-item" data-index="${index}">
                    <img src="${item.image}" class="cart-item-image" alt="${item.name}">
                    <div class="cart-item-details">
                        <div class="cart-item-title">${item.name}</div>
                        <div class="cart-item-price">฿${item.price.toFixed(2)}</div>
                        <div class="cart-item-quantity">
                            <button class="cart-quantity-btn cart-minus-btn" data-index="${index}">-</button>
                            <input type="text" value="${item.quantity}" class="cart-quantity-input" data-index="${index}">
                            <button class="cart-quantity-btn cart-plus-btn" data-index="${index}">+</button>
                        </div>
                    </div>
                </div>
            `;

                    cartItemsContainer.innerHTML += cartItemHTML;
                });

                // Update cart count and subtotal
                cartCount.textContent = cartItems.length;
                cartSubtotal.textContent = `฿${cartTotal.toFixed(2)}`;

                // Add event listeners to quantity buttons
                document.querySelectorAll('.cart-minus-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        if (cartItems[index].quantity > 1) {
                            cartItems[index].quantity--;
                            updateCartDisplay();
                        }
                    });
                });

                document.querySelectorAll('.cart-plus-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        cartItems[index].quantity++;
                        updateCartDisplay();
                    });
                });
            }

            // Event listeners
            addToCartBtn.addEventListener('click', addToCart);
            closeCartBtn.addEventListener('click', closeCart);
            overlay.addEventListener('click', closeCart);

            // Close cart when pressing Escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeCart();
                }
            });
        });
        // First, modify your cart sidebar HTML structure to match the design in the images
        document.addEventListener('DOMContentLoaded', function () {
            // Get elements
            const addToCartBtn = document.querySelector('.add-to-cart-btn');
            const cartSidebar = document.getElementById('shopping-cart-sidebar');
            const closeCartBtn = document.querySelector('.close-cart');
            const cartItemsContainer = document.getElementById('cart-items');
            const cartCount = document.getElementById('cart-count');
            const cartSubtotal = document.getElementById('cart-subtotal');
            const discountAmount = document.querySelector('.discount-amount');
            const discountSection = document.querySelector('.discount-section');

            // Create overlay
            const overlay = document.createElement('div');
            overlay.className = 'cart-overlay';
            document.body.appendChild(overlay);

            // Initialize cart from localStorage if exists
            let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
            let cartTotal = 0;
            let cartDiscount = 0;

            // Initial cart display update
            updateCartDisplay();

            // Function to open cart
            function openCart() {
                cartSidebar.classList.add('open');
                overlay.classList.add('active');
                document.body.style.overflow = 'hidden'; // Prevent scrolling
            }

            // Function to close cart
            function closeCart() {
                cartSidebar.classList.remove('open');
                overlay.classList.remove('active');
                document.body.style.overflow = ''; // Allow scrolling
            }

            // Add to cart function
            function addToCart(event) {
                if (event) event.preventDefault();

                // Get product details
                const productId = document.querySelector('[name="p_id"]') ?
                    document.querySelector('[name="p_id"]').value :
                    <?php echo isset($p_id) ? $p_id : '0'; ?>;
                const productName = document.querySelector('.product-title').textContent;
                const productPrice = parseFloat(document.querySelector('.price').textContent.replace('฿', '').replace(',', ''));
                const productImage = document.getElementById('myImg').src;
                const productQuantity = parseInt(document.getElementById('quantity').value);
                const productVariation = document.querySelector('.form-control') ? document.querySelector('.form-control').value : "";

                // Check if product already in cart
                const existingItemIndex = cartItems.findIndex(item =>
                    item.id == productId && item.variation === productVariation);

                if (existingItemIndex !== -1) {
                    // Update quantity if product already in cart
                    cartItems[existingItemIndex].quantity += productQuantity;
                } else {
                    // Add new item to cart
                    cartItems.push({
                        id: productId,
                        name: productName,
                        price: productPrice,
                        image: productImage,
                        quantity: productQuantity,
                        variation: productVariation
                    });
                }

                // Save to localStorage
                localStorage.setItem('cartItems', JSON.stringify(cartItems));

                // Update cart display
                updateCartDisplay();

                // Open cart sidebar
                openCart();
            }

            // Calculate discounts (example logic - customize based on your requirements)
            function calculateDiscount(total) {
                // Example discount: 10% off orders over 5000
                if (total > 5000) {
                    return total * 0.1;
                }
                return 0;
            }

            // Function to remove item from cart
            function removeCartItem(index) {
                cartItems.splice(index, 1);
                localStorage.setItem('cartItems', JSON.stringify(cartItems));
                updateCartDisplay();
            }

            // Update cart display
            function updateCartDisplay() {
                // Clear current cart items
                cartItemsContainer.innerHTML = '';

                // Reset cart total
                cartTotal = 0;

                // Calculate total quantity for cart count
                let totalQuantity = cartItems.reduce((total, item) => total + item.quantity, 0);

                // Add items to cart display
                cartItems.forEach((item, index) => {
                    const itemTotal = item.price * item.quantity;
                    cartTotal += itemTotal;

                    const cartItemHTML = `
                <div class="cart-item" data-index="${index}">
                    <img src="${item.image}" class="cart-item-image" alt="${item.name}">
                    <div class="cart-item-details">
                        <div class="cart-item-title">${item.name}</div>
                        ${item.variation ? `<div class="cart-item-variation">${item.variation}</div>` : ''}
                        <div class="cart-item-price">฿${item.price.toFixed(2)}</div>
                        <div class="cart-item-quantity">
                            <button class="cart-quantity-btn cart-minus-btn" data-index="${index}">-</button>
                            <input type="text" value="${item.quantity}" class="cart-quantity-input" data-index="${index}">
                            <button class="cart-quantity-btn cart-plus-btn" data-index="${index}">+</button>
                        </div>
                    </div>
                    <div class="delete-item-container">
                        <button class="delete-item-btn" data-index="${index}">×</button>
                    </div>
                </div>
            `;

                    cartItemsContainer.innerHTML += cartItemHTML;
                });

                // Calculate discount
                cartDiscount = calculateDiscount(cartTotal);

                // Update cart count, discount and subtotal
                cartCount.textContent = totalQuantity;

                if (cartDiscount > 0) {
                    discountAmount.textContent = `-฿${cartDiscount.toFixed(2)}`;
                    if (discountSection) discountSection.style.display = 'flex';
                } else {
                    discountAmount.textContent = `฿0.00`;
                    if (discountSection) discountSection.style.display = 'flex';
                }

                cartSubtotal.textContent = `฿${(cartTotal - cartDiscount).toFixed(2)}`;

                // Add event listeners to quantity buttons
                document.querySelectorAll('.cart-minus-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        if (cartItems[index].quantity > 1) {
                            cartItems[index].quantity--;
                            localStorage.setItem('cartItems', JSON.stringify(cartItems));
                            updateCartDisplay();
                        }
                    });
                });

                document.querySelectorAll('.cart-plus-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        cartItems[index].quantity++;
                        localStorage.setItem('cartItems', JSON.stringify(cartItems));
                        updateCartDisplay();
                    });
                });

                // Add event listeners to delete buttons
                document.querySelectorAll('.delete-item-btn').forEach(btn => {
                    btn.addEventListener('click', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        removeCartItem(index);
                    });
                });

                // Add input validation
                document.querySelectorAll('.cart-quantity-input').forEach(input => {
                    input.addEventListener('change', function () {
                        const index = parseInt(this.getAttribute('data-index'));
                        let quantity = parseInt(this.value);

                        if (isNaN(quantity) || quantity < 1) {
                            quantity = 1;
                        }

                        cartItems[index].quantity = quantity;
                        localStorage.setItem('cartItems', JSON.stringify(cartItems));
                        updateCartDisplay();
                    });
                });
            }

            // Event listeners
            if (addToCartBtn) addToCartBtn.addEventListener('click', addToCart);
            if (closeCartBtn) closeCartBtn.addEventListener('click', closeCart);
            overlay.addEventListener('click', closeCart);

            // Close cart when pressing Escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeCart();
                }
            });
        });

    </script>
    <?php include('script4.php') ?>
    <?php include('footer.php') ?>
</body>

</html>