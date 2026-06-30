SELECT
    state,
    incidentType,
    COUNT(DISTINCT disasterNumber) AS disaster_count,
    MIN(SUBSTR(declarationDate, 1, 4)) AS first_year,
    MAX(SUBSTR(declarationDate, 1, 4)) AS last_year,
    MAX(SUBSTR(declarationDate, 1, 4)) - 
    MIN(SUBSTR(declarationDate, 1, 4)) + 1 AS years_of_data,
    ROUND(COUNT(DISTINCT disasterNumber) * 1.0 / 
        (MAX(SUBSTR(declarationDate, 1, 4)) - 
         MIN(SUBSTR(declarationDate, 1, 4)) + 1), 3) 
        AS disasters_per_year
FROM disaster_declarations
WHERE SUBSTR(declarationDate, 1, 4) >= '2000'
GROUP BY state, incidentType
ORDER BY disaster_count DESC;