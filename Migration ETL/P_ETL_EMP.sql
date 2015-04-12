CREATE OR REPLACE PROCEDURE P_ETL_EMP AS
CURSOR EXT_CUR_EMP IS
SELECT
EMP.*,
MTROLE.ID AS ROLE_ID
FROM T_EXT_EMP EMP
LEFT JOIN T_MT_ROLE MTROLE
ON EMP.ROLE = MTROLE.ROLE;
EXT_ROW EXT_CUR_EMP%ROWTYPE;

BEGIN
FOR EXT_ROW IN EXT_CUR_EMP LOOP

INSERT INTO T_MT_EMPLOYEE
VALUES
(
SYS_GUID(),
EXT_ROW.NAME,
EXT_ROW.DOB,
EXT_ROW.ADDRESS,
EXT_ROW.PHONE,
EXT_ROW.EMAIL,
EXT_ROW.SALARY,
EXT_ROW.WORKING_HOURS,
EXT_ROW.USERNAME,
EXT_ROW.EPASSWORD,
EXT_ROW.ROLE_ID,
EXT_ROW.CODE
);
END LOOP;
COMMIT;
END;