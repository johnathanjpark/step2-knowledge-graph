SELECT
    error_type,
    COUNT(*) AS count
FROM intake_questions
WHERE correct = FALSE
GROUP BY error_type
ORDER BY count DESC;