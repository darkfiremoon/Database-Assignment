--zbbms@20140402 create directory -START
create or replace directory ext_tab_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data';
create or replace directory ext_log_dir as 'C:\Users\LWL\Desktop\Database\Database Assignment\Database-Assignment - Copy (3)\Existing Data\Log Files';
--zbbms@20140402 create directory -END


--zbbms@20140402 drop table - START
DROP TABLE T_EXT_BOOK;
--zbbms@20140402 drop table - END

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