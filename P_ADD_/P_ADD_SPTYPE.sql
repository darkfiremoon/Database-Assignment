CREATE OR REPLACE PROCEDURE P_ADD_SPTYPE(
				IN_NAME IN T_MT_SPTYPE.NAME%TYPE,
				IN_CD IN T_MT_SPTYPE.CD%TYPE
)
IS
BEGIN
INSERT INTO T_MT_SPTYPE
VALUES
(
		SYS_GUID(),
		IN_NAME,
		IN_CD
);

COMMIT;

END;