<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Billing</title>
    <link rel="stylesheet" href="styles.css">
    <script src="script.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
</head>

<body>
    <!-- Navbar -->
    <nav>
        <div class="logo">Logo</div>
        <div class="nav-links" id="nav-links">
            <a href="/home" class="nav-link">Home</a>
            <a href="/product" class="nav-link">Product</a>
            <a href="/order" class="nav-link">Orders</a>
        </div>
        <div class="logout"><a href="#logout">Logout</a></div>
        <div class="hamburger" id="hamburger">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </nav>

    <!-- Main Content -->
    <form id="billing-form" action="/productdata" method="POST">
        <div class="form-row">
            <div class="form-group">
                <label for="barcode">Barcode Number</label>
                <input type="text" name="barcode" id="product-barcode" placeholder="Enter Barcode" required>
            </div>
            <div class="form-group">
                <label for="product-name">Product Name</label>
                <input type="text" name="productName" id="product-name" placeholder="Enter Product Name" required>
            </div>
            <div class="form-group">
                <label for="product-category">Product Category</label>
                <select name="category" id="product-category" required>
                    <option value="" disabled selected>Select Category</option>
                    <option value="electronics">Electronics</option>
                    <option value="clothing">Clothing</option>
                    <option value="furniture">Furniture</option>
                    <option value="grocery">Grocery</option>
                    <option value="toys">Toys</option>
                    <option value="books">Books</option>
                </select>
            </div>
            <div class="form-group">
                <label for="product-price">Product Price</label>
                <input type="number" name="productPrice" id="product-price" placeholder="Enter Product Price" required>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" name="quantity" id="quantity" placeholder="Enter Quantity" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="gst">GST</label>
                <select name="gst" id="gst">
                    <option value="0">0%</option>
                    <option value="5">5%</option>
                    <option value="12">12%</option>
                    <option value="18">18%</option>
                </select>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="cgst">CGST</label>
                <input name="cgst" type="number" id="cgst" readonly>
            </div>
            <div class="form-group">
                <label for="sgst">SGST</label>
                <input name="sgst" type="number" id="sgst" readonly>
            </div>
            <div class="form-group">
                <label for="total-price">Total Price</label>
                <input name="totalPrice" type="number" id="total-price" readonly>
            </div>
        </div>

        <div class="form-row">
            <div class="button-container">
                <button type="submit" id="add-product">Add Product</button>
            </div>
        </div>
    </form>


</body>

</html>