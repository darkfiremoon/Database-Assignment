create or replace
PROCEDURE P_DELETE_STATIO(
IN_CD IN T_MT_STATIO.CD%TYPE
)
IS
BEGIN
DELETE FROM T_MT_STATIO WHERE CD = IN_CD;

COMMIT;
END;
