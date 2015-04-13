create or replace
PROCEDURE P_ETL_AUTHOR AS
CURSOR EXT_CUR_AUTHOR IS
SELECT EXAU.*, MTAU.ID AS MTAUID 
FROM T_EXT_AUTHOR EXAU
LEFT JOIN T_MT_AUTHOR MTAU
ON EXAU.CODE = MTAU.CD;

EXT_ROW EXT_CUR_AUTHOR%ROWTYPE;
BEGIN

FOR EXT_ROW IN EXT_CUR_AUTHOR LOOP


	IF EXT_ROW.MTAUID IS NULL THEN
	INSERT INTO T_MT_AUTHOR
	VALUES
	(
		SYS_GUID(),
		EXT_ROW.NAME,
		EXT_ROW.ADDRESS,
		EXT_ROW.PHONE,
		EXT_ROW.EMAIL,
		EXT_ROW.CODE
	);
	ELSE
	UPDATE T_MT_AUTHOR
	SET NAME = EXT_ROW.NAME,
		ADDRESS = EXT_ROW.ADDRESS,
		PHONE = EXT_ROW.PHONE,
		EMAIL = EXT_ROW.EMAIL
	WHERE CD = EXT_ROW.CODE;
	END IF;
END LOOP;
COMMIT;
END P_ETL_AUTHOR;