SELECT
    relationship_type, COUNT(*) AS count
FROM question_edges
GROUP BY relationship_type
ORDER BY count DESC;