--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\user\Documents\GitHub\Database-Assignment\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\user\Documents\GitHub\Database-Assignment\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_CUST;
DROP TABLE T_EXT_EMP;
DROP TABLE T_EXT_BOOK;
DROP TABLE T_EXT_DISC;
DROP TABLE T_EXT_ROLE;
DROP TABLE T_EXT_PUBLI;
DROP TABLE T_EXT_AUTHOR;
DROP TABLE T_EXT_STATIO;
DROP TABLE T_EXT_STTYPE;
DROP TABLE T_EXT_BKTYPE;
DROP TABLE T_EXT_SUPPLIER;
DROP TABLE T_EXT_SPTYPE;
DROP TABLE T_EXT_TRANTYPE;
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

--zbbms@20150402 external table for book - START
CREATE TABLE T_EXT_BOOK (
TITLE VARCHAR2(50),
DESCRIPTION VARCHAR2(50),
AUTHORCD VARCHAR2(4),
PUBLISHERCD VARCHAR2(4),
BKTYPECD VARCHAR2(4),
PRICE NUMBER(5,2),
STOCK NUMBER,
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'BOOKBAD.bad'
		LOGFILE EXT_LOG_DIR:'BOOKLOG.log'
		FIELDS RTRIM (
		TITLE (1:50) CHAR(50),
		DESCRIPTION (51:100) CHAR(50),
		AUTHORCD (101:104) CHAR(4),
		PUBLISHERCD (105:108) CHAR(4),
		BKTYPECD (109:112) CHAR(4),
		PRICE (113:117) CHAR(5),
		STOCK (118:119) CHAR(2),
		CODE (120:123) CHAR(4)
		)
	)
	LOCATION('book.txt')
);
--zzbms@20150402 external table for book - END

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

--zbbms@20150409 external table for publication - START
CREATE TABLE T_EXT_PUBLI (
NAME VARCHAR2(50),
ADDRESS VARCHAR2(80), 
PHONE VARCHAR2(10), 
EMAIL VARCHAR2(30),             
WEBSITE VARCHAR2(30),
CODE VARCHAR2(4) 
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
 DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
	RECORDS DELIMITED BY NEWLINE
	BADFILE EXT_LOG_DIR:'PUBLIBAD.bad'
	LOGFILE EXT_LOG_DIR:'PUBLILOG.log'
		FIELDS RTRIM (
		NAME (1:50) CHAR(50),
		ADDRESS (51:130) CHAR(80),
		PHONE (131:140) CHAR(10),
		EMAIL (141:170) CHAR(30),
		WEBSITE (171:200) CHAR(30),
		CODE (201:214) CHAR(4)
		)
	)
 LOCATION('publi.txt')
);
--zbbms@20150409 external table for publication - END

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

--zbbms@20150402 external table for stationery type - START
CREATE TABLE T_EXT_STTYPE (
NAME VARCHAR2(30),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'STTYPEBAD.bad'
		LOGFILE EXT_LOG_DIR:'STTYPELOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		CODE (31:34) CHAR(4)
		)
	)
	LOCATION('stationery_type.txt')
);
--zzbms@20150402 external table for stationery type - END

--zbbms@20150402 external table for book type - START
CREATE TABLE T_EXT_BKTYPE (
NAME VARCHAR2(30),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'BKTYPEBAD.bad'
		LOGFILE EXT_LOG_DIR:'BKTYPELOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		CODE (31:34) CHAR(4)
		)
	)
	LOCATION('book_type.txt')
);
--zzbms@20150402 external table for book type - END

--zbbms@20150402 external table for supplier  - START
CREATE TABLE T_EXT_SUPPLIER (
NAME VARCHAR2(30),
ADDRESS VARCHAR2(80),
SUPPTYPE VARCHAR2(4),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'SUPPLIERBAD.bad'
		LOGFILE EXT_LOG_DIR:'SUPPLIERLOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		ADDRESS (31:110) CHAR(80),
		SUPPTYPE (111:114) CHAR(4),
		CODE (115:118) CHAR(4)
		)
	)
	LOCATION('supplier.txt')
);
--zzbms@20150402 external table for supplier  - END

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

--zbbms@20150402 external table for transaction - START
CREATE TABLE T_EXT_TRANTYPE (
NAME VARCHAR2(30),
CODE VARCHAR2(4)
)
ORGANIZATION EXTERNAL 
(TYPE ORACLE_LOADER
	DEFAULT DIRECTORY EXT_TAB_DIR
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY NEWLINE
		BADFILE EXT_LOG_DIR:'TRANTYPEBAD.bad'
		LOGFILE EXT_LOG_DIR:'TRANTYPELOG.log'
		FIELDS RTRIM (
		NAME (1:30) CHAR(30),
		CODE (31:34) CHAR(4)
		)
	)
	LOCATION('transaction_type.txt')
);
--zzbms@20150402 external table for transaction type - END