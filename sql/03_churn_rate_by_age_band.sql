SELECT
    CASE
        WHEN "Age" < 30 THEN 'Under 30'
        WHEN "Age" BETWEEN 30 AND 39 THEN '30 to 39'
        WHEN "Age" BETWEEN 40 AND 49 THEN '40 to 49'
        WHEN "Age" BETWEEN 50 AND 59 THEN '50 to 59'
        ELSE '60 and over'
    END AS age_band,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Exited" = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(AVG("Exited") * 100, 1) AS churn_rate_pct,
    ROUND(AVG("Balance")::numeric, 2) AS avg_balance
FROM bank_churn_clean
GROUP BY age_band
ORDER BY churn_rate_pct DESC;