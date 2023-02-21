SELECT COALESCE(U.NAME, 'not defined') NAME,
       COALESCE(U.LASTNAME, 'not defined') LASTNAME,
       B.TYPE,
       SUM(B.MONEY) VOLUME,
       COALESCE(C.NAME, 'not defined') CURRENCY_NAME,
       CASE WHEN C.RATE_TO_USD IS NULL THEN 1 ELSE C.RATE_TO_USD END LAST_RATE_TO_USD,
       SUM(B.MONEY) * CASE WHEN C.RATE_TO_USD IS NULL THEN 1 ELSE C.RATE_TO_USD END TOTAL_VOLUME_IN_USD

FROM "user" U
FULL OUTER JOIN BALANCE B ON U.ID = B.USER_ID
FULL OUTER JOIN CURRENCY C ON B.CURRENCY_ID = C.ID
FULL OUTER JOIN (SELECT ID, MAX(UPDATED) AS UPDATED
                 FROM CURRENCY
                 GROUP BY ID) LC ON LC.ID = C.ID
WHERE LC.UPDATED = C.UPDATED OR C.NAME IS NULL
GROUP BY 1,2,3,5,6
ORDER BY 1 DESC ,2,3;
