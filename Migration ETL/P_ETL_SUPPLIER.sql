CREATE OR REPLACE PROCEDURE P_ETL_SUPPLIER AS
CURSOR EXT_CUR_SUPPLIER IS 
SELECT exts.*, extstype.ID as SUPPID, mts.ID as MTSUPPID
FROM T_EXT_SUPPLIER exts
LEFT JOIN T_MT_SUPPLIER mts
ON exts.CODE = mts.CD
LEFT JOIN T_MT_SPTYPE extstype 
ON exts.supptype = extstype.CD;
EXT_ROW EXT_CUR_SUPPLIER%ROWTYPE;
BEGIN

FOR EXT_ROW IN EXT_CUR_SUPPLIER LOOP

	IF EXT_ROW.MTSUPPID IS NULL THEN
	INSERT INTO T_MT_SUPPLIER 
	VALUES 
	(
		SYS_GUID(), 
		EXT_ROW.NAME,
		EXT_ROW.SUPPID,
		EXT_ROW.ADDRESS, 
		EXT_ROW.CODE
	);
	ELSE
	UPDATE T_MT_SUPPLIER
	SET NAME = EXT_ROW.NAME,
		SUPPID = EXT_ROW.SUPPID,
		ADDRESS = EXT_ROW.ADDRESS
		WHERE CD = EXT_ROW.CODE;
	END IF;
END LOOP;
COMMIT;
END P_ETL_SUPPLIER;