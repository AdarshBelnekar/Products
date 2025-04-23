<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Order Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 30px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        .low-stock {
            background-color: #fff3cd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body>
    <h1>Order Page</h1>

    <form action="/search" method="get">
        <label for="barcode">Search by Barcode:</label>
        <input type="number" name="barcode" id="barcode" required>
        <button type="submit">Search</button>
    </form>

    <table id="productTable">
        <thead>
            <tr>
                <th>Barcode</th>
                <th>Name</th>
                <th>Quantity</th>
                <th>CGST</th>
                <th>SGST</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Updated Date</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dynamic rows will be inserted here -->
        </tbody>
    </table>

    <script>
        // Fetch the JSON data (this URL should return the JSON you need)
        fetch('/search/${barcode}')
            .then(response => response.json())  // Parse the JSON data
            .then(data => {
                const tableBody = document.querySelector('#productTable tbody');
                data.forEach(product => {
                    const row = document.createElement('tr');
                    // Add a class if the quantity is low
                    if (product.quantity < 10) {
                        row.classList.add('low-stock');
                    }

                    row.innerHTML = `
                        <td>${product.barcode}</td>
                        <td>${product.name}</td>
                        <td>${product.quantity}</td>
                        <td>${product.cgst}</td>
                        <td>${product.sgst}</td>
                        <td>${product.productPrice}</td>
                        <td>${product.totalPrice}</td>
                        <td>${product.updatedDate}</td>
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    </script>
</body>
</html>
