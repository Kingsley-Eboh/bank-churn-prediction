SELECT
    CASE
        WHEN "Balance" = 0 AND "IsActiveMember" = 0 AND "NumOfProducts" = 1
        THEN 'Dormant'
        ELSE 'Engaged'
    END AS account_status,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Exited" = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(AVG("Exited") * 100, 1) AS churn_rate_pct,
    ROUND(AVG("Balance")::numeric, 2) AS avg_balance
FROM bank_churn_clean
GROUP BY account_status
ORDER BY churn_rate_pct DESC;