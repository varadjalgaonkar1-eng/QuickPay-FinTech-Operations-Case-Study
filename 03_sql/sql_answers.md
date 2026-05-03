SQL Answers
Q1
Query
SQL
SELECT status, COUNT(*) AS transaction_count FROM transactions GROUP BY status;
Result Summary
This query provides a high-level breakdown of all transaction statuses. It helps the operations team understand the distribution between successful (Captured), Failed, and Chargeback transactions.

Q2
Query
SQL
SELECT merchant_name, SUM(amount_usd) AS total_captured_gmv FROM transactions WHERE status = 'Captured' GROUP BY merchant_name;
Result Summary
By filtering for 'Captured' status, this query calculates the actual realized revenue (Gross Merchandise Value) for each merchant, excluding failed or disputed attempts.

Q3
Query
SQL
SELECT merchant_name, SUM(amount_usd) AS total_captured_gmv FROM transactions WHERE status = 'Captured' GROUP BY merchant_name ORDER BY total_captured_gmv DESC LIMIT 10;
Result Summary
Identifies the top 10 performing merchants by revenue. This is essential for the business team to identify high-value partners and prioritize support for them.

Q4
Query
SQL
SELECT transaction_date, SUM(amount_usd) AS daily_gmv, COUNT(*) AS success_count FROM transactions WHERE status = 'Captured' GROUP BY transaction_date;
Result Summary
This provides a daily performance trend. Monitoring daily success counts alongside GMV helps detect sudden drops in gateway performance or technical issues.

Q5
Query
SQL
SELECT merchant_name, (COUNT(CASE WHEN status = 'Chargeback' THEN 1 END) * 1.0 / COUNT(*)) AS chargeback_ratio FROM transactions GROUP BY merchant_name HAVING chargeback_ratio > 0.01;
Result Summary
Identifies merchants with a chargeback rate higher than 1%. High chargeback ratios are a major red flag for fraud or poor service and require immediate investigation.

Q6
Query
SQL
SELECT gateway_region, AVG(risk_score) AS avg_risk, COUNT(*) AS transaction_count FROM transactions GROUP BY gateway_region HAVING avg_risk > 50 AND transaction_count > 20;
Result Summary
Helps isolate high-risk regions. By filtering for regions with an average risk score over 50 and a significant volume (>20 txns), we can identify where to tighten fraud rules.

Q7
Query
SQL
SELECT user_id, transaction_date, COUNT(*) AS issue_count FROM transactions WHERE status IN ('Failed', 'Chargeback') GROUP BY user_id, transaction_date HAVING issue_count >= 3;
Result Summary
Detects potential "Card Testing" or account takeover behavior by flagging users who experience 3 or more failures or disputes on a single day.

Q8
Query
SQL
SELECT merchant_name, COUNT(CASE WHEN status = 'Chargeback' THEN 1 END) AS chargeback_count, COUNT(DISTINCT CASE WHEN status = 'Chargeback' THEN user_id END) AS unique_users, SUM(CASE WHEN status = 'Chargeback' THEN amount_usd ELSE 0 END) AS total_chargeback_amount FROM transactions GROUP BY merchant_name;
Result Summary
Provides a detailed risk profile per merchant by showing the total volume of disputes, the financial impact (amount), and how many unique customers were affected.
