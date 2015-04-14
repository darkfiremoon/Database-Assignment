--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_AUTHOR;
--zbbms@20140402 drop table - END

--zbbms@20150409 external table for author - START
CREATE TABLE T_EXT_AUTHOR (
NAME VARCHAR2(50),
ADDRESS VARCHAR2(80), 
PHONE VARCHAR2(10), 
EMAIL VARCHAR2(30),             
CODE VARCHAR2(4) 
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
 DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
	RECORDS DELIMITED BY NEWLINE
	BADFILE EXT_LOG_DIR:'AUTHORBAD.bad'
	LOGFILE EXT_LOG_DIR:'AUTHORLOG.log'
		FIELDS RTRIM (
		NAME (1:50) CHAR(50),
		ADDRESS (51:130) CHAR(80),
		PHONE (131:140) CHAR(10),
		EMAIL (141:170) CHAR(30),
		CODE (171:174) CHAR(4)
		)
	)
 LOCATION('author.txt')
);
--zbbms@20150409 external table for author  -  END 
