SELECT
    CASE
        WHEN TMP.PERSON_NAME IS NULL
            THEN '-'
            ELSE TMP.PERSON_NAME
    END,
       TMP.VISIT_DATE,
    CASE
        WHEN TMP.PIZZERIA_NAME IS NULL
            THEN '-'
            ELSE TMP.PIZZERIA_NAME
    END
FROM (SELECT P.NAME PERSON_NAME,
       PV.VISIT_DATE,
       PZ.NAME PIZZERIA_NAME
FROM PERSON_VISITS PV
    INNER JOIN GENERATE_SERIES('2022-01-01'::timestamp, '2022-01-3'::timestamp, '1 day'::interval) VALUE
        ON VALUE = PV.VISIT_DATE
    FULL OUTER JOIN PERSON P ON PV.PERSON_ID = P.ID
    FULL OUTER JOIN PIZZERIA PZ ON PZ.ID = PV.PIZZERIA_ID) TMP
ORDER BY 1, 2, 3;
