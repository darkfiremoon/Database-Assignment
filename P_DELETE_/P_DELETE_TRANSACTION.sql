create or replace
PROCEDURE P_DELETE_TRANSACTION(
IN_CD IN T_TRANSACTION.CD%TYPE
)
IS
BEGIN
DELETE FROM T_TRANSACTION WHERE CD = IN_CD;

COMMIT;
END;
