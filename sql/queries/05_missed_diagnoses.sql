SELECT 
    final_diagnosis, COUNT(*) AS misses
FROM intake_questions
WHERE correct = FALSE
GROUP BY final_diagnosis
ORDER BY misses DESC;