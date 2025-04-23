document.addEventListener("DOMContentLoaded", () => {
    const productPriceInput = document.getElementById("product-price");
    const quantityInput = document.getElementById("quantity");
    const gstSelect = document.getElementById("gst");
    const cgstInput = document.getElementById("cgst");
    const sgstInput = document.getElementById("sgst");
    const totalPriceInput = document.getElementById("total-price");

    function calculateGST() {
        const price = parseFloat(productPriceInput.value) || 0;
        const quantity = parseInt(quantityInput.value) || 0;
        const gstPercent = parseFloat(gstSelect.value) || 0;

        const baseAmount = price * quantity;
        const totalGST = (gstPercent / 100) * baseAmount;
        const cgst = totalGST / 2;
        const sgst = totalGST / 2;
        const totalAmount = baseAmount + totalGST;

        cgstInput.value = cgst.toFixed(2);
        sgstInput.value = sgst.toFixed(2);
        totalPriceInput.value = totalAmount.toFixed(2);
    }

    // Trigger calculation when relevant inputs change
    [productPriceInput, quantityInput, gstSelect].forEach(element =>
        element.addEventListener("input", calculateGST)
    );
});
