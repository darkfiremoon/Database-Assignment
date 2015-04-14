--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_STATIO;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for stationery - START
CREATE TABLE T_EXT_STATIO (
NAME VARCHAR2(30),
TYPECODE VARCHAR2(4),
PRICE NUMBER(5,2),
STOCK NUMBER,
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'STATIOBAD.bad'
		LOGFILE EXT_LOG_DIR:'STATIOLOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		TYPECODE (31:34) CHAR(4),
		PRICE (35:39) CHAR(5),
		STOCK (40:41) CHAR(2),
		CODE (42:45) CHAR(4)
		)
	)
	LOCATION('stationery.txt')
);
--zzbms@20150402 external table for stationery - END