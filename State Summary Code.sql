SELECT
    state,
    COUNT(DISTINCT disasterNumber) AS total_disasters,
    COUNT(DISTINCT incidentType) AS incident_diversity,
    ROUND(COUNT(DISTINCT disasterNumber) * 1.0 /
        (MAX(SUBSTR(declarationDate, 1, 4)) -
         MIN(SUBSTR(declarationDate, 1, 4)) + 1), 2)
        AS disasters_per_year,
    ROUND(COUNT(DISTINCT incidentType) * 1.0 /
        COUNT(DISTINCT disasterNumber) * 100, 1)
        AS diversity_score
FROM disaster_declarations
WHERE SUBSTR(declarationDate, 1, 4) >= '2000'
GROUP BY state
ORDER BY total_disasters DESC;