--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_DISC;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for discount - START
CREATE TABLE T_EXT_DISC (
TITLE VARCHAR2(50),
DISCTYPE VARCHAR2(20),
AMOUNT NUMBER,
DESCRIPTION VARCHAR2(50),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS (
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'DISCBAD.bad'
		LOGFILE EXT_LOG_DIR:'DISCLOG.log'
		FIELDS RTRIM (
		TITLE (1:30) CHAR(30),
		DISCTYPE(31:50) CHAR(20),
		AMOUNT (51:52) CHAR(2),
		DESCRIPTION (53:102) CHAR(50),
		CODE (103:106) CHAR(4)
		)
	)
	LOCATION('disc.txt')
);

--zbbms@20150402 external table for discount - END