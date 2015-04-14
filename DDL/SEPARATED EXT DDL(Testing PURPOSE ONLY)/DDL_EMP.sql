--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_EMP;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for employee - START
CREATE TABLE T_EXT_EMP (
NAME VARCHAR2(50),
DOB DATE,
ADDRESS VARCHAR2(80), 
PHONE VARCHAR2(20), 
EMAIL VARCHAR2(30), 
SALARY NUMBER(7,2),       
WORKING_HOURS NUMBER,         
USERNAME VARCHAR2(20), 
EPASSWORD VARCHAR2(20),
ROLE VARCHAR2(10),
CODE VARCHAR2(4) 
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
 DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
	RECORDS DELIMITED BY NEWLINE
	BADFILE EXT_LOG_DIR:'EMPBAD.bad'
	LOGFILE EXT_LOG_DIR:'EMPLOG.log'
		FIELDS RTRIM (
		NAME (1:20) CHAR(20),
		DOB (21:28) CHAR(8) DATE_FORMAT DATE mask "DDMMYYYY",
		ADDRESS (29:78) CHAR(50),
		PHONE (79:88) CHAR(10),
		EMAIL (89:118) CHAR(30),
		SALARY (119:125) CHAR(7),
		WORKING_HOURS (126:127) CHAR(2),
		USERNAME (128:137) CHAR(10),
		EPASSWORD (138:147) CHAR(10),
		ROLE (148:157) CHAR(10),
		CODE (158:161) CHAR(4)
		)
	)
 LOCATION('emp.txt')
);
--zbbms@20150402 external table for employee - END
--zbbms@20150402 external table for discount - END