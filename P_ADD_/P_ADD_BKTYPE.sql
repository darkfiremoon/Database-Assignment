CREATE OR REPLACE PROCEDURE P_ADD_BKTYPE(
				IN_NAME IN T_MT_BKTYPE.NAME%TYPE,
				IN_CD IN T_MT_BKTYPE.CD%TYPE
)
IS
BEGIN
INSERT INTO T_MT_BKTYPE
VALUES
(
		SYS_GUID(),
		IN_NAME,
		IN_CD
);

COMMIT;

END;