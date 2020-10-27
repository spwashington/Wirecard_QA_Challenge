Feature: Payment
    - API should be able to create a new payment order with a valid access key
    - API should be able to create a new payment with a valid access key
    - In Wirecard account dashboard user can manager yours payment order

    Background: Open account dashboard
        When access account sandbox site
        Given a valid account with "your_sandbox_email" and "your_sandbox_password"
        Then can be accessed wirecard dashboard

    @PayOrder
    Scenario: Create a new payment order with API Request
        Given json body: "createPaymentOrder.json"
        Then api send a post request to create a payment order and return code "201" with status "CREATED" and a valid order id
        And is possible check this payment order in wirecard account dashboard and status is "Aguardando"

    @Pay
    Scenario: Create a new payment
        Given json body: "createPayment.json" 
        Then api send a post request to create a payment to orderId: "ORD-1ZUA54GDNNXZ" and return code "201" with status "IN_ANALYSIS" and a valid order id
        And is possible check this payment in wirecard account dashboard and status is "Pago"