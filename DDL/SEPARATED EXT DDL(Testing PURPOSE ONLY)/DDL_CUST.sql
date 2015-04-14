--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_CUST;
--zbbms@20140402 drop table - END

--zbbms@20150402 external table for customer - START
CREATE TABLE T_EXT_CUST (
NAME VARCHAR2(50),
DOB DATE,
ADDRESS VARCHAR2(80), 
PHONE VARCHAR2(20), 
EMAIL VARCHAR2(30), 
MEMBERSHIP_PERIOD NUMBER,       
JOIN_DATE DATE,         
USERNAME VARCHAR2(20), 
CPASSWORD VARCHAR2(20),
CODE VARCHAR2(4) 
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
 DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
	RECORDS DELIMITED BY NEWLINE
	BADFILE EXT_LOG_DIR:'CUSTBAD.bad'
	LOGFILE EXT_LOG_DIR:'CUSTLOG.log'
		FIELDS RTRIM (
		NAME (1:20) CHAR(20),
		DOB (21:28) CHAR(8) DATE_FORMAT DATE mask "DDMMYYYY",
		ADDRESS (29:78) CHAR(50),
		PHONE (79:88) CHAR(10),
		EMAIL (89:118) CHAR(30),
		MEMBERSHIP_PERIOD (119:120) CHAR(2),
		JOIN_DATE (121:128) CHAR(8) DATE_FORMAT DATE mask "DDMMYYYY",
		USERNAME (129:138) CHAR(10),
		CPASSWORD (139:148) CHAR(10),
		CODE (149:152) CHAR(4)
		)
	)
 LOCATION('cust.txt')
);
--zbbms@20150402 external table for customer - END