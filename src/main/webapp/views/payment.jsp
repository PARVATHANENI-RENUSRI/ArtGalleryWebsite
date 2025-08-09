<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello World - Razorpay Payment Gateway</title>
    <!-- Include Razorpay script -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f9f9f9;
        }
        #paymentForm {
            text-align: center;
            margin-top: 50px;
        }
        #payButton {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #payButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div id="paymentForm">
        <h2>Hello World - Razorpay Payment</h2>
        <button type="button" id="payButton">Pay Now</button>
    </div>

    <script>
        document.getElementById('payButton').onclick = function (e) {
            e.preventDefault();

            // Fetch the order details from backend
            fetch('CreateOrderServlet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ amount: 500 }) // Example amount: 500 INR
            })
            .then(response => response.json())
            .then(order => {
                var options = {
                    key: "your_razorpay_key_id", // Replace with your Razorpay Key ID
                    amount: order.amount, // Amount in paise
                    currency: "INR",
                    name: "Hello World Store",
                    description: "Payment Gateway Integration",
                    order_id: order.id,
                    handler: function (response) {
                        // Send payment verification details to backend
                        fetch('VerifyPaymentServlet', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({
                                paymentId: response.razorpay_payment_id,
                                orderId: response.razorpay_order_id,
                                signature: response.razorpay_signature
                            })
                        })
                        .then(res => res.json())
                        .then(data => {
                            alert(data.message);
                        });
                    },
                    prefill: {
                        name: "Customer Name",
                        email: "customer@example.com",
                        contact: "9999999999"
                    }
                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
            });
        };
    </script>

</body>
</html>
