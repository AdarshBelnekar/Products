<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Page</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f9f9f9; margin: 0; padding: 20px; }
        h1 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin: 30px auto; background: #fff; box-shadow: 0 0 10px rgba(0,0,0,0.05); }
        th, td { padding: 10px 12px; border: 1px solid #ddd; text-align: center; }
        th { background: #007BFF; color: #fff; }
        .low-stock { background: #fff3cd; }
        tr:hover { background: #f1f1f1; }
    </style>
</head>
<body>
    <h1>Order Page</h1>
    <form id="barcodeForm" autocomplete="off">
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
                <th>Category</th>
                <th>GST</th>
            </tr>
        </thead>
        <tbody id="productTableBody">
            <!-- Table rows will be inserted by JavaScript -->
        </tbody>
    </table>
    <script>
        // Minimal, robust: always show all searched products
        let searchedProducts = [];
        function renderTable(products) {
            const tableBody = document.getElementById('productTableBody');
            tableBody.innerHTML = '';
            if (!products || products.length === 0) {
                const row = document.createElement('tr');
                let td = document.createElement('td');
                td.colSpan = 9;
                td.textContent = 'No products found.';
                row.appendChild(td);
                tableBody.appendChild(row);
                return;
            }
            products.forEach(product => {
                const row = document.createElement('tr');
                if (product.quantity < 10) row.classList.add('low-stock');
                row.innerHTML =
    '<td>' + (product.barcode != null ? product.barcode : '') + '</td>' +
    '<td>' + (product.productName != null ? product.productName : '') + '</td>' +
    '<td>' + (product.quantity != null ? product.quantity : '') + '</td>' +
    '<td>' + (product.cgst != null ? product.cgst : '') + '</td>' +
    '<td>' + (product.sgst != null ? product.sgst : '') + '</td>' +
    '<td>' + (product.productPrice != null ? product.productPrice : '') + '</td>' +
    '<td>' + (product.totalPrice != null ? product.totalPrice : '') + '</td>' +
    '<td>' + (product.category != null ? product.category : '') + '</td>' +
    '<td>' + (product.gst != null ? product.gst : '') + '</td>';

                tableBody.appendChild(row);
            });
        }
        renderTable(searchedProducts);
        document.getElementById('barcodeForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const barcodeInput = document.getElementById('barcode');
            const barcode = barcodeInput.value.trim();
            if (!barcode) {
                renderTable(searchedProducts);
                return;
            }
            // Check if already listed
            const exists = searchedProducts.some(p => String(p.barcode) === barcode);
            if (exists) {
                alert('This barcode is already in the list!');
                renderTable(searchedProducts);
                return;
            }
            fetch('/api/search?barcode=' + encodeURIComponent(barcode))
                .then(resp => {
                    if (!resp.ok) throw new Error('Network response was not ok');
                    return resp.json();
                })
                .then(data => {
                    let prod = null;
                    if (Array.isArray(data)) {
                        prod = data.length > 0 ? data[0] : null;
                    } else if (data && typeof data === 'object') {
                        prod = (data.barcode && data.productName) ? data : null;
                    }
                    if (!prod) {
                        alert('Product not found!');
                        renderTable(searchedProducts);
                        return;
                    }
                    searchedProducts.push(prod);
                    renderTable(searchedProducts);
                    barcodeInput.value = '';
                })
                .catch(error => {
                    alert('Error fetching product!');
                    console.error('Error:', error);
                });
        });
    </script>
</body>
</html>
