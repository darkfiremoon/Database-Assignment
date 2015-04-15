CREATE OR REPLACE PROCEDURE P_CURR_REPORT (
CUR_REPORT OUT SYS_REFCURSOR
)
IS
FIRST_DATE DATE;

BEGIN
FIRST_DATE := TRUNC(SYSDATE, 'MONTH');

OPEN CUR_REPORT FOR
SELECT
VW.EMP_CD,
VW.EMP_NAME,
SUM(VW.TOTAL_PAYMENT) AS TOTAL_PROFIT

FROM VW_SALES VW
WHERE VW.DATE_COMMENCE BETWEEN FIRST_DATE AND SYSDATE
GROUP BY VW.EMP_CD, VW.EMP_NAME
ORDER BY VW.EMP_CD;

END;