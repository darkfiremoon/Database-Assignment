CREATE OR REPLACE PROCEDURE P_ADD_EMPLOYEE(
      IN_NAME IN T_MT_EMPLOYEE.NAME%TYPE,
	  IN_DOB IN VARCHAR2,
	  IN_ADD IN T_MT_EMPLOYEE.ADDRESS%TYPE,
      IN_PHONE IN T_MT_EMPLOYEE.PHONE%TYPE,
	  IN_EMAIL IN T_MT_EMPLOYEE.EMAIL%TYPE,
	  IN_SALARY IN T_MT_EMPLOYEE.SALARY%TYPE,
	  IN_WK_HR IN T_MT_EMPLOYEE.WORKING_HOURS%TYPE,
	  IN_USRNM IN T_MT_EMPLOYEE.USERNAME%TYPE,
	  IN_EPASS IN T_MT_EMPLOYEE.EPASSWORD%TYPE,
      IN_RCD IN T_MT_ROLE.CD%TYPE,
	  IN_CD IN T_MT_EMPLOYEE.CD%TYPE
) 
IS
DOB DATE;
ROLEID VARCHAR(32);
BEGIN

DOB := TO_DATE(IN_DOB, 'DDMMYYYY');
SELECT ROLE.ID INTO ROLEID FROM T_MT_ROLE ROLE WHERE CD = IN_RCD;


INSERT INTO T_MT_EMPLOYEE
VALUES
(
    SYS_GUID(),
	IN_NAME,
	DOB,
	IN_ADD,
	IN_PHONE,
	IN_EMAIL,
	IN_SALARY,
	IN_WK_HR,
	IN_USRNM,
	IN_EPASS,
	ROLEID,
	IN_CD

);

COMMIT;

END;