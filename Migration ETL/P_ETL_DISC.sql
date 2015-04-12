CREATE OR REPLACE PROCEDURE P_ETL_DISC AS
CURSOR EXT_CUR_DISC IS
SELECT * FROM T_EXT_DISC;
EXT_ROW EXT_CUR_DISC%ROWTYPE;

BEGIN
FOR EXT_ROW IN EXT_CUR_DISC LOOP
INSERT INTO T_MT_DISCOUNT
VALUES
(
SYS_GUID(),
EXT_ROW.TITLE,
EXT_ROW.DISCTYPE,
EXT_ROW.AMOUNT,
EXT_ROW.DESCRIPTION,
EXT_ROW.CODE
);
END LOOP;
COMMIT;
END;