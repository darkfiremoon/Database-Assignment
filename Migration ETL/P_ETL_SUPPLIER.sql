CREATE OR REPLACE PROCEDURE P_ETL_SUPPLIER AS
CURSOR EXT_CUR_SUPPLIER IS 
SELECT exts.*, extstype.ID as SUPPID 
FROM T_EXT_SUPPLIER exts
LEFT JOIN T_MT_SPTYPE extstype on exts.supptype = extstype.CD;
EXT_ROW EXT_CUR_SUPPLIER%ROWTYPE;
BEGIN

FOR EXT_ROW IN EXT_CUR_SUPPLIER LOOP

	INSERT INTO T_MT_SUPPLIER 
	VALUES 
	(
		SYS_GUID(), 
		EXT_ROW.NAME,
		EXT_ROW.SUPPID,
		EXT_ROW.ADDRESS, 
		EXT_ROW.CODE
	);
END LOOP;
COMMIT;
END P_ETL_SUPPLIER;