<?php
// Start session if not already started
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Handle AJAX request to update cart
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action']) && $_POST['action'] === 'update_cart') {
    if (isset($_POST['cart_data'])) {
        // Save cart data to session
        $_SESSION['cart_items'] = $_POST['cart_data'];
        
        // Return success response
        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'message' => 'Cart updated successfully']);
        exit;
    }
}

// Get cart data from session or localStorage
$cart_items = [];
if (isset($_SESSION['cart_items'])) {
    $cart_items = json_decode($_SESSION['cart_items'], true);
}

// Create header.php content inline instead of including it
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .navbar-brand {
            font-weight: bold;
        }
        .cart-icon {
            position: relative;
        }
        .cart-count {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: #dc3545;
            color: white;
            border-radius: 50%;
            padding: 0.25rem 0.5rem;
            font-size: 0.75rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="index.php">ร้านค้าออนไลน์</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.php">หน้าแรก</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container mt-5">
    <h1 class="mb-4">ตะกร้าสินค้า</h1>
    
    <div class="row">
        <div class="col-lg-8">
            <!-- Cart items -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">รายการสินค้า</h5>
                </div>
                <div class="card-body">
                    <div id="empty-cart-message" style="display: none;" class="text-center py-4">
                        <h4>ตะกร้าสินค้าของคุณว่างเปล่า</h4>
                        <a href="index.php" class="btn btn-primary mt-3">เลือกซื้อสินค้าต่อ</a>
                    </div>
                    <div id="cart-table-container">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>สินค้า</th>
                                        <th>ราคา</th>
                                        <th>จำนวน</th>
                                        <th>ราคารวม</th>
                                        <th>ดำเนินการ</th>
                                    </tr>
                                </thead>
                                <tbody id="cart-table-body">
                                    <!-- Cart items will be displayed here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4">
            <!-- Order summary -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">สรุปคำสั่งซื้อ</h5>
                </div>
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <span>ราคารวม</span>
                        <span id="summary-subtotal">฿0.00</span>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <span>ส่วนลด</span>
                        <span id="summary-discount">฿0.00</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between mb-3">
                        <span><strong>ยอดรวมสุทธิ</strong></span>
                        <span id="summary-total"><strong>฿0.00</strong></span>
                    </div>
                    <button id="checkout-btn" class="btn btn-primary btn-block w-100">ดำเนินการชำระเงิน</button>
                    <a href="index.php" class="btn btn-outline-secondary btn-block mt-2 w-100">เลือกซื้อสินค้าต่อ</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Get cart items from localStorage
    let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
    const cartTableBody = document.getElementById('cart-table-body');
    const summarySubtotal = document.getElementById('summary-subtotal');
    const summaryDiscount = document.getElementById('summary-discount');
    const summaryTotal = document.getElementById('summary-total');
    const emptyCartMessage = document.getElementById('empty-cart-message');
    const cartTableContainer = document.getElementById('cart-table-container');
    const cartCountBadge = document.getElementById('cart-count');
    
    // Function to update cart display
    function updateCartDisplay() {
        if (!cartTableBody) return;
        
        // Update cart count in header
        if (cartCountBadge) {
            cartCountBadge.textContent = cartItems.reduce((total, item) => total + item.quantity, 0);
        }
        
        // Show/hide empty cart message
        if (cartItems.length === 0) {
            if (emptyCartMessage) emptyCartMessage.style.display = 'block';
            if (cartTableContainer) cartTableContainer.style.display = 'none';
            return;
        } else {
            if (emptyCartMessage) emptyCartMessage.style.display = 'none';
            if (cartTableContainer) cartTableContainer.style.display = 'block';
        }
        
        // Clear table
        cartTableBody.innerHTML = '';
        
        // Calculate totals
        let subtotal = 0;
        
        // Add items to table
        cartItems.forEach((item, index) => {
            const itemTotal = item.price * item.quantity;
            subtotal += itemTotal;
            
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>
                    <div class="d-flex align-items-center">
                        <img src="${item.image || 'placeholder.jpg'}" alt="${item.name}" style="width: 60px; height: 60px; object-fit: contain; margin-right: 10px;">
                        <div>
                            <h6 class="mb-0">${item.name}</h6>
                            ${item.variation ? `<small class="text-muted">${item.variation}</small>` : ''}
                        </div>
                    </div>
                </td>
                <td>฿${item.price.toFixed(2)}</td>
                <td>
                    <div class="input-group" style="max-width: 120px;">
                        <button class="btn btn-sm btn-outline-secondary cart-minus-btn" data-index="${index}">-</button>
                        <input type="text" class="form-control text-center cart-quantity-input" value="${item.quantity}" data-index="${index}">
                        <button class="btn btn-sm btn-outline-secondary cart-plus-btn" data-index="${index}">+</button>
                    </div>
                </td>
                <td>฿${itemTotal.toFixed(2)}</td>
                <td>
                    <button class="btn btn-sm btn-danger delete-item-btn" data-index="${index}">×</button>
                </td>
            `;
            
            cartTableBody.appendChild(row);
        });
        
        // Calculate discount (example logic - customize based on your requirements)
        const discount = calculateDiscount(subtotal);
        
        // Update summary
        if (summarySubtotal) summarySubtotal.textContent = `฿${subtotal.toFixed(2)}`;
        if (summaryDiscount) summaryDiscount.textContent = `-฿${discount.toFixed(2)}`;
        if (summaryTotal) summaryTotal.textContent = `฿${(subtotal - discount).toFixed(2)}`;
        
        // Add event listeners to buttons
        addEventListeners();
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
        syncCartWithServer();
        updateCartDisplay();
    }
    
    // Function to add event listeners
    function addEventListeners() {
        // Quantity minus buttons
        document.querySelectorAll('.cart-minus-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const index = parseInt(this.getAttribute('data-index'));
                if (cartItems[index].quantity > 1) {
                    cartItems[index].quantity--;
                    localStorage.setItem('cartItems', JSON.stringify(cartItems));
                    syncCartWithServer();
                    updateCartDisplay();
                }
            });
        });
        
        // Quantity plus buttons
        document.querySelectorAll('.cart-plus-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const index = parseInt(this.getAttribute('data-index'));
                cartItems[index].quantity++;
                localStorage.setItem('cartItems', JSON.stringify(cartItems));
                syncCartWithServer();
                updateCartDisplay();
            });
        });
        
        // Delete buttons
        document.querySelectorAll('.delete-item-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const index = parseInt(this.getAttribute('data-index'));
                removeCartItem(index);
            });
        });
        
        // Quantity input fields
        document.querySelectorAll('.cart-quantity-input').forEach(input => {
            input.addEventListener('change', function() {
                const index = parseInt(this.getAttribute('data-index'));
                let quantity = parseInt(this.value);
                
                if (isNaN(quantity) || quantity < 1) {
                    quantity = 1;
                }
                
                cartItems[index].quantity = quantity;
                localStorage.setItem('cartItems', JSON.stringify(cartItems));
                syncCartWithServer();
                updateCartDisplay();
            });
        });
    }
    
    // Function to synchronize cart with server
    function syncCartWithServer() {
        // Create a form data object to send cart data to server
        const formData = new FormData();
        formData.append('cart_data', JSON.stringify(cartItems));
        formData.append('action', 'update_cart');
        
        // Use fetch API to send data to cart-item.php
        fetch('cart-item.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Cart synchronized with server', data);
        })
        .catch(error => {
            console.error('Error synchronizing cart with server:', error);
        });
    }
    
    // Initialize cart display
    updateCartDisplay();
    
    // Synchronize cart with server on page load
    syncCartWithServer();

    // Add event listener to checkout button
    const checkoutBtn = document.getElementById('checkout-btn');
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', function() {
            if (cartItems.length > 0) {
                const productId = cartItems[0].id; // Assuming single product checkout for simplicity
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
                alert('Your cart is empty.');
            }
        });
    }
});
</script>

<?php 
include'footer.php';
?>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>