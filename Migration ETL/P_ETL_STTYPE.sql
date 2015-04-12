CREATE OR REPLACE PROCEDURE P_ETL_STTYPE AS
CURSOR EXT_CUR_STTYPE IS 
SELECT * FROM T_EXT_STTYPE;
EXT_ROW EXT_CUR_STTYPE%ROWTYPE;
BEGIN

FOR EXT_ROW IN EXT_CUR_STTYPE LOOP

	INSERT INTO T_MT_STTYPE 
	VALUES 
	(
		SYS_GUID(), 
		EXT_ROW.NAME, 
		EXT_ROW.CODE
	);
END LOOP;
COMMIT;
END P_ETL_STTYPE;