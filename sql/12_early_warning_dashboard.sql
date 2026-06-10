SELECT
    CASE
        WHEN "Age" < 30 THEN 'Under 30'
        WHEN "Age" BETWEEN 30 AND 39 THEN '30 to 39'
        WHEN "Age" BETWEEN 40 AND 49 THEN '40 to 49'
        WHEN "Age" BETWEEN 50 AND 59 THEN '50 to 59'
        ELSE '60 and over'
    END AS age_band,
    "NumOfProducts" AS num_products,
    "IsActiveMember" AS is_active,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Predicted_Tuned" = 1 THEN 1 ELSE 0 END) AS predicted_churners,
    ROUND(AVG("Churn_Probability")::numeric * 100, 1) AS avg_churn_probability_pct
FROM bank_churn_predictions
GROUP BY age_band, num_products, is_active
HAVING AVG("Churn_Probability") > 0.5
ORDER BY avg_churn_probability_pct DESC
LIMIT 15;