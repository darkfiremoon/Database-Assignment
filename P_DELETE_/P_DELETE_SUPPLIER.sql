create or replace
PROCEDURE P_DELETE_SUPPLIER(
IN_CD IN T_MT_SUPPLIER.CD%TYPE
)
IS
BEGIN
DELETE FROM T_MT_SUPPLIER WHERE CD = IN_CD;

COMMIT;
END;
