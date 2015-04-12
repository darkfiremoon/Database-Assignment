CREATE OR REPLACE PROCEDURE P_DELETE_PUBLI(
IN_CD IN T_MT_STTYPE.CD%TYPE
)
IS
PUBLI_ID VARCHAR(32); 

BEGIN
select ID INTO PUBLI_ID from T_MT_PUBLI WHERE CD = IN_CD;

DELETE FROM T_MT_BOOK WHERE PID = PUBLI_ID;

DELETE FROM T_MT_PUBLI WHERE CD = IN_CD;

COMMIT;
END;