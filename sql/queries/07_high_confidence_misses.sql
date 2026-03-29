SELECT
    final_diagnosis, COUNT(*) AS high_confidence_misses
FROM intake_questions
WHERE correct = FALSE AND confidence = 'high'
GROUP BY final_diagnosis
ORDER BY high_confidence_misses DESC;