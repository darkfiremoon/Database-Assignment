create or replace 
PROCEDURE P_DELETE_CUSTOMER(
IN_CD IN T_MT_CUSTOMER.CD%TYPE
)
IS


BEGIN


DELETE FROM T_MT_CUSTOMER WHERE CD = IN_CD;

COMMIT;
END;
