SELECT
    "NumOfProducts" AS num_products,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Exited" = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(AVG("Exited") * 100, 1) AS churn_rate_pct,
    ROUND(SUM(CASE WHEN "Exited" = 1 THEN "Balance" ELSE 0 END)::numeric, 2) AS balance_at_risk
FROM bank_churn_clean
GROUP BY num_products
ORDER BY num_products;