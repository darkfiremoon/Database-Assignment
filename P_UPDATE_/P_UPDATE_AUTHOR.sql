create or replace PROCEDURE P_UPDATE_AUTHOR (
		IN_TYPE IN VARCHAR2,
        IN_VALUE IN VARCHAR2,
        IN_CD IN T_MT_AUTHOR.CD%TYPE
)
IS
update_sql varchar2(225);
BEGIN

update_sql :=  'UPDATE T_MT_AUTHOR SET ' || IN_TYPE  || 
                    '= :1 WHERE CD = :2' ;

execute immediate update_sql using IN_VALUE,IN_CD;

END P_UPDATE_AUTHOR;
