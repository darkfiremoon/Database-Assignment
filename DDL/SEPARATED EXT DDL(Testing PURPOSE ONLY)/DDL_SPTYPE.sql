--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_SPTYPE;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for supplier type - START
CREATE TABLE T_EXT_SPTYPE (
NAME VARCHAR2(30),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'SPTYPEBAD.bad'
		LOGFILE EXT_LOG_DIR:'SPTYPELOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		CODE (31:34) CHAR(4)
		)
	)
	LOCATION('supplier_type.txt')
);
--zzbms@20150402 external table for supplier type - END