create or replace PROCEDURE P_UPDATE_CUST (
		IN_TYPE IN VARCHAR2,
                IN_CD IN T_MT_CUSTOMER.CD%TYPE,
                IN_VALUE IN VARCHAR2
)
IS
update_sql varchar2(225);
CURSOR C_CUST IS
SELECT * FROM T_MT_CUSTOMER;
BEGIN

update_sql :=  'UPDATE T_MT_CUSTOMER SET ' || IN_TYPE  || 
                    '= :1 WHERE CD = :2' ;

execute immediate update_sql using IN_VALUE,IN_CD;

END P_UPDATE_CUST;
