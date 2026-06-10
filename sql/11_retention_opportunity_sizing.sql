SELECT
    "Risk_Tier",
    COUNT(*) AS total_customers,
    ROUND(AVG("Churn_Probability")::numeric * 100, 1) AS avg_churn_probability_pct,
    ROUND(SUM("Balance")::numeric, 2) AS total_balance,
    ROUND(SUM("Balance")::numeric * 0.20, 2) AS balance_saved_if_20pct_retained
FROM bank_churn_predictions
GROUP BY "Risk_Tier"
ORDER BY avg_churn_probability_pct DESC;