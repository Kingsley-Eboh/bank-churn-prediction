SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Exited" = 1 THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN "Exited" = 0 THEN 1 ELSE 0 END) AS retained_customers,
    ROUND(AVG("Exited") * 100, 1) AS churn_rate_pct,
    ROUND(AVG("Balance")::numeric, 2) AS avg_balance,
    ROUND(AVG("Age")::numeric, 1) AS avg_age
FROM bank_churn_clean;