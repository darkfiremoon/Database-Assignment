CREATE OR REPLACE PROCEDURE P_ADD_STTYPE(
				IN_NAME IN T_MT_STTYPE.NAME%TYPE,
				IN_CD IN T_MT_STTYPE.CD%TYPE
)
IS
BEGIN
INSERT INTO T_MT_STTYPE
VALUES
(
		SYS_GUID(),
		IN_NAME,
		IN_CD
);

COMMIT;

END;