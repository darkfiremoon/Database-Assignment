CREATE OR REPLACE FUNCTION F_RET_EMPLOYEE
RETURN SYS_REFCURSOR
IS
E_CUR SYS_REFCURSOR;
BEGIN

OPEN E_CUR FOR
SELECT 
E.CD,
E.NAME,
E.DOB,
E.ADDRESS,
E.PHONE,
E.EMAIL,
E.SALARY,
E.WORKING_HOURS,
E.USERNAME,
E.EPASSWORD,
R.ROLE
FROM T_MT_EMPLOYEE E
INNER JOIN T_MT_ROLE R
ON E.ROLE_ID = R.ID;

RETURN E_CUR;
END;