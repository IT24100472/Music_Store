<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Page</title>
    <style>
        .payment-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: Arial, sans-serif;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .price-display {
            font-size: 1.2em;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 4px;
        }
        .pay-btn {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1em;
        }
        .pay-btn:hover {
            background-color: #2980b9;
        }
        .card-details {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 10px;
        }
    </style>
</head>
<body>
<div class="payment-container">
    <h2>Payment Details</h2>

    <div class="price-display">
        Total Amount: ${price}
    </div>

    <form action="/cart/paid" method="post">
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <input type="text" id="cardNumber" name="cardNumber"
                   placeholder="1234 5678 9012 3456" maxlength="19" required>
        </div>

        <div class="form-group">
            <label for="cardName">Cardholder Name</label>
            <input type="text" id="cardName" name="cardName"
                   placeholder="John Doe" required>
        </div>

        <div class="card-details">
            <div class="form-group">
                <label for="expiryDate">Expiry Date</label>
                <input type="text" id="expiryDate" name="expiryDate"
                       placeholder="MM/YY" maxlength="5" required>
            </div>

            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv"
                       placeholder="123" maxlength="3" required>
            </div>
        </div>

        <button type="submit" class="pay-btn">Pay ${price}</button>
    </form>
</div>

<script>
    // Auto-format card number
    document.getElementById('cardNumber').addEventListener('input', function(e) {
        let value = e.target.value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
        let matches = value.match(/\d{4,16}/g);
        let match = matches && matches[0] || '';
        let parts = [];
        for (let i = 0; i < match.length; i += 4) {
            parts.push(match.substring(i, i + 4));
        }
        if (parts.length) {
            e.target.value = parts.join(' ');
        } else {
            e.target.value = value;
        }
    });

    // Auto-format expiry date
    document.getElementById('expiryDate').addEventListener('input', function(e) {
        let value = e.target.value.replace(/[^0-9]/g, '');
        if (value.length >= 2) {
            e.target.value = value.substring(0, 2) + '/' + value.substring(2, 4);
        }
    });

    // Restrict CVV to numbers only
    document.getElementById('cvv').addEventListener('input', function(e) {
        e.target.value = e.target.value.replace(/[^0-9]/g, '');
    });
</script>
</body>
</html>