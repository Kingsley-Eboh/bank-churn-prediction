SELECT
    CASE WHEN "Gender" = 1 THEN 'Male' ELSE 'Female' END AS gender,
    CASE
        WHEN "Geography_Germany" = TRUE THEN 'Germany'
        WHEN "Geography_Spain" = TRUE THEN 'Spain'
        ELSE 'France'
    END AS geography,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN "Exited" = 1 THEN 1 ELSE 0 END) AS churned,
    ROUND(AVG("Exited") * 100, 1) AS churn_rate_pct
FROM bank_churn_clean
GROUP BY gender, geography
ORDER BY churn_rate_pct DESC;