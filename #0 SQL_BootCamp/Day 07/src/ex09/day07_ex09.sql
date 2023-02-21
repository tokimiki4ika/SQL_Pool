SELECT *,
       CASE WHEN FORMULA > AVERAGE THEN TRUE ELSE FALSE END COMPARISON
FROM
(SELECT P.ADDRESS,
       ROUND(MAX(P.AGE) - (MIN(P.AGE) /CAST(MAX(P.AGE) AS NUMERIC)), 2) FORMULA,
       ROUND(SUM(P.AGE) /CAST(COUNT(P.AGE) AS NUMERIC), 2) AVERAGE
FROM PERSON P
GROUP BY P.ADDRESS) AS TMP
ORDER BY 1;
