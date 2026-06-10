SELECT
    "Risk_Tier",
    COUNT(*) AS total_customers,
    ROUND(AVG("Churn_Probability")::numeric * 100, 1) AS avg_churn_probability_pct,
    ROUND(AVG("Balance")::numeric, 2) AS avg_balance,
    ROUND(SUM("Balance")::numeric, 2) AS total_balance_at_risk
FROM bank_churn_predictions
WHERE "Actual" = 1
GROUP BY "Risk_Tier"
ORDER BY avg_churn_probability_pct DESC;