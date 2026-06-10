SELECT
    ROUND("Churn_Probability"::numeric * 100, 1) AS churn_probability_pct,
    "Risk_Tier",
    "Age",
    "NumOfProducts" AS num_products,
    "IsActiveMember" AS is_active,
    ROUND("Balance"::numeric, 2) AS balance,
    CASE
        WHEN "Geography_Germany" = TRUE THEN 'Germany'
        WHEN "Geography_Spain" = TRUE THEN 'Spain'
        ELSE 'France'
    END AS geography,
    CASE WHEN "Gender" = 1 THEN 'Male' ELSE 'Female' END AS gender,
    "Actual" AS actually_churned
FROM bank_churn_predictions
ORDER BY "Churn_Probability" DESC
LIMIT 20;