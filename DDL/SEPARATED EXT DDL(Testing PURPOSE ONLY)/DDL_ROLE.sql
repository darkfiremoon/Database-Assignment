--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_ROLE;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for role -START
CREATE TABLE T_EXT_ROLE(
ROLE  VARCHAR2(30),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS (
			RECORDS DELIMITED BY NEWLINE
			BADFILE EXT_LOG_DIR:'ROLEBAD.bad'
			LOGFILE EXT_LOG_DIR:'ROLELOG.log'	
			FIELDS RTRIM (
			ROLE (1:20) CHAR(20),
			CODE (21:24) CHAR(4)
			)
	)
	LOCATION('role.txt')
);
--zbbms@20140402 external table for role -END