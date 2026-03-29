SELECT
    final_diagnosis, error_type, COUNT(*) AS count
FROM intake_questions
WHERE correct = FALSE
GROUP BY final_diagnosis, error_type
ORDER BY count DESC;