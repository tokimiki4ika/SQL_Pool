WITH male AS (
    SELECT PZ.NAME PIZZERIA_NAME
    FROM PERSON_ORDER PO
        INNER JOIN PERSON P ON P.ID = PO.PERSON_ID
        INNER JOIN MENU M ON PO.MENU_ID = M.ID
        INNER JOIN PIZZERIA PZ ON PZ.ID = M.PIZZERIA_ID
    WHERE P.GENDER = 'male'),
    female AS (
    SELECT PZ.NAME PIZZERIA_NAME
    FROM PERSON_ORDER PO
        INNER JOIN PERSON P ON P.ID = PO.PERSON_ID
        INNER JOIN MENU M ON PO.MENU_ID = M.ID
        INNER JOIN PIZZERIA PZ ON PZ.ID = M.PIZZERIA_ID
    WHERE P.GENDER = 'female')
(SELECT * FROM male
 EXCEPT
 SELECT * FROM female)
UNION
(SELECT * FROM female
 EXCEPT
 SELECT * FROM male)
ORDER BY 1;
