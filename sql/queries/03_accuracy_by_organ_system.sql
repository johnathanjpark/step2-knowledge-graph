SELECT
    organ_system,
    COUNT(*) AS total,
    ROUND(100.0*AVG(CASE WHEN correct THEN 1.0 ELSE 0.0 END)) AS accuracy_pct
FROM intake_questions
GROUP BY organ_system
ORDER BY accuracy_pct DESC;