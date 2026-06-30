SELECT
    SUBSTR(declarationDate, 1, 4) AS year,
    incidentType,
    COUNT(DISTINCT disasterNumber) AS disaster_count
FROM disaster_declarations
WHERE SUBSTR(declarationDate, 1, 4) >= '2000'
GROUP BY year, incidentType
ORDER BY year, disaster_count DESC;