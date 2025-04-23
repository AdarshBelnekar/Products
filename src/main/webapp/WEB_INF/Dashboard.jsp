<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-commerce Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: ;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            color: #fff;
            padding-top: 20px;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            margin-bottom: 20px;
        }
        .statistics-box {
            display: flex;
            justify-content: space-between;
        }
        .statistics-box .card {
            flex: 1;
            margin-right: 10px;
        }
        .statistics-box .card:last-child {
            margin-right: 0;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2 class="text-center text-white">Admin Panel</h2>
        <a href="#overview">Overview</a>
        <a href="#products">Products</a>
        <a href="#orders">Orders</a>
        <a href="#customers">Customers</a>
        <a href="#reports">Reports</a>
        <a href="#settings">Settings</a>
    </div>

    <!-- Content Area -->
    <div class="content">
        <div id="overview">
            <h1>Dashboard Overview</h1>
            <div class="statistics-box">
                <!-- Total Sales Card -->
                <div class="card bg-info text-white">
                    <div class="card-body">
                        <h5 class="card-title">Total Sales</h5>
                        <p class="card-text">$ 25,000</p>
                    </div>
                </div>
                <!-- Total Orders Card -->
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <h5 class="card-title">Total Orders</h5>
                        <p class="card-text">350</p>
                    </div>
                </div>
                <!-- Total Customers Card -->
                <div class="card bg-warning text-white">
                    <div class="card-body">
                        <h5 class="card-title">Total Customers</h5>
                        <p class="card-text">1,200</p>
                    </div>
                </div>
            </div>

            <h2>Recent Orders</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#12345</td>
                        <td>John Doe</td>
                        <td>$150</td>
                        <td>Shipped</td>
                    </tr>
                    <tr>
                        <td>#12346</td>
                        <td>Jane Smith</td>
                        <td>$200</td>
                        <td>Processing</td>
                    </tr>
                    <tr>
                        <td>#12347</td>
                        <td>Mark Johnson</td>
                        <td>$90</td>
                        <td>Delivered</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Products Section -->
        <div id="products">
            <h2>Products</h2>
            <button class="btn btn-primary mb-3">Add New Product</button>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#001</td>
                        <td>Product 1</td>
                        <td>$50</td>
                        <td>100</td>
                        <td>Active</td>
                    </tr>
                    <tr>
                        <td>#002</td>
                        <td>Product 2</td>
                        <td>$75</td>
                        <td>30</td>
                        <td>Active</td>
                    </tr>
                    <tr>
                        <td>#003</td>
                        <td>Product 3</td>
                        <td>$120</td>
                        <td>50</td>
                        <td>Out of Stock</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Orders Section -->
        <div id="orders">
            <h2>Order Management</h2>
            <button class="btn btn-secondary mb-3">View All Orders</button>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#12345</td>
                        <td>John Doe</td>
                        <td>$150</td>
                        <td>Shipped</td>
                    </tr>
                    <tr>
                        <td>#12346</td>
                        <td>Jane Smith</td>
                        <td>$200</td>
                        <td>Processing</td>
                    </tr>
                    <tr>
                        <td>#12347</td>
                        <td>Mark Johnson</td>
                        <td>$90</td>
                        <td>Delivered</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Customers Section -->
        <div id="customers">
            <h2>Customer Management</h2>
            <button class="btn btn-secondary mb-3">View All Customers</button>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#C001</td>
                        <td>John Doe</td>
                        <td>john.doe@example.com</td>
                        <td>Active</td>
                    </tr>
                    <tr>
                        <td>#C002</td>
                        <td>Jane Smith</td>
                        <td>jane.smith@example.com</td>
                        <td>Active</td>
                    </tr>
                    <tr>
                        <td>#C003</td>
                        <td>Mark Johnson</td>
                        <td>mark.johnson@example.com</td>
                        <td>Inactive</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Reports Section -->
        <div id="reports">
            <h2>Reports</h2>
            <button class="btn btn-danger mb-3">Generate Report</button>
            <p>Download detailed sales, inventory, and order reports here.</p>
        </div>

        <!-- Settings Section -->
        <div id="settings">
            <h2>Settings</h2>
            <p>Adjust your account settings, payment methods, shipping, and more.</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
