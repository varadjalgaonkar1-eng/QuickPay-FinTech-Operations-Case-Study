Schema SQL

CREATE TABLE transactions (
    transaction_id VARCHAR(50),
    transaction_date DATE,
    merchant_name VARCHAR(100),
    amount_usd DECIMAL(10, 2),
    status VARCHAR(20),
    risk_score INT,
    gateway_region VARCHAR(10),
    user_id VARCHAR(50)
);

INSERT INTO transactions (transaction_id, transaction_date, merchant_name, amount_usd, status, risk_score, gateway_region, user_id)
VALUES 
('TXN001', '2024-01-01', 'Alpha Mart', 5500.00, 'Captured', 45, 'APAC', 'U123'),
('TXN002', '2024-01-01', 'Beta Shop', 1200.00, 'Failed', 80, 'US', 'U456'),
('TXN003', '2024-01-02', 'Alpha Mart', 7200.00, 'Captured', 30, 'US', 'U789'),
('TXN004', '2024-01-02', 'Gamma Corp', 500.00, 'Chargeback', 95, 'EU', 'U123');


Query SQL

-- Q1
SELECT status, COUNT(*) AS transaction_count 
FROM transactions 
GROUP BY status;

-- Q2
SELECT merchant_name, SUM(amount_usd) AS total_captured_gmv 
FROM transactions 
WHERE status = 'Captured' 
GROUP BY merchant_name;

-- Q3
SELECT merchant_name, SUM(amount_usd) AS total_captured_gmv 
FROM transactions 
WHERE status = 'Captured' 
GROUP BY merchant_name 
ORDER BY total_captured_gmv DESC 
LIMIT 10;

-- Q4
SELECT transaction_date, SUM(amount_usd) AS daily_gmv, COUNT(*) AS success_count 
FROM transactions 
WHERE status = 'Captured' 
GROUP BY transaction_date;

-- Q5
SELECT merchant_name, 
       (COUNT(CASE WHEN status = 'Chargeback' THEN 1 END) * 1.0 / COUNT(*)) AS chargeback_ratio 
FROM transactions 
GROUP BY merchant_name 
HAVING chargeback_ratio > 0.01;

-- Q6
SELECT gateway_region, AVG(risk_score) AS avg_risk, COUNT(*) AS transaction_count 
FROM transactions 
GROUP BY gateway_region 
HAVING avg_risk > 50 AND transaction_count > 20;

-- Q7
SELECT user_id, transaction_date, COUNT(*) AS issue_count 
FROM transactions 
WHERE status IN ('Failed', 'Chargeback') 
GROUP BY user_id, transaction_date 
HAVING issue_count >= 3;

-- Q8
SELECT merchant_name, 
       COUNT(CASE WHEN status = 'Chargeback' THEN 1 END) AS chargeback_count, 
       COUNT(DISTINCT CASE WHEN status = 'Chargeback' THEN user_id END) AS unique_users, 
       SUM(CASE WHEN status = 'Chargeback' THEN amount_usd ELSE 0 END) AS total_chargeback_amount 
FROM transactions 
GROUP BY merchant_name;