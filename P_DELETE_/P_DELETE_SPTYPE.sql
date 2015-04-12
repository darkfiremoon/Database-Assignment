CREATE OR REPLACE PROCEDURE P_DELETE_SPTYPE(
IN_CD IN T_MT_SPTYPE.CD%TYPE
)
IS
SPTYPE_ID VARCHAR(32); 

BEGIN
select ID INTO SPTYPE_ID from T_MT_SPTYPE WHERE CD = IN_CD;

DELETE FROM T_MT_SUPPLIER WHERE SUPPID = SPTYPE_ID;

DELETE FROM T_MT_SPTYPE WHERE CD = IN_CD;

COMMIT;
END;