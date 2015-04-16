create or replace
PROCEDURE P_ADD_TRANSACTION (
	IN_CUST_CD IN T_MT_CUSTOMER.CD%TYPE,
	IN_EMP_CD IN T_MT_EMPLOYEE.CD%TYPE,
	IN_ITEM_CD     IN T_MT_ITEM.CD%TYPE,
	IN_DISC_CD IN T_MT_DISCOUNT.CD%TYPE,
	IN_TT_CD IN T_MT_TRANTYPE.CD%TYPE,
	IN_DT_COM IN VARCHAR2
)
IS
DATE_COMMENCE DATE;
TOTAL NUMBER;
CUST_ID VARCHAR2(32);
EMP_ID VARCHAR2(32);
ITEM_ID VARCHAR2(32);
PRODUCT_ID VARCHAR2(32);
STATIO_ID VARCHAR2(32);
STATIO_CD VARCHAR(4);
STATIO_PRICE VARCHAR2(32);
BK_ID VARCHAR2(32);
BK_PRICE NUMBER;
DISC_ID VARCHAR2(32);
DISC_AMT NUMBER;
CODE VARCHAR(4);
TT_ID VARCHAR(32);
BEGIN

SELECT CUST.ID INTO CUST_ID FROM T_MT_CUSTOMER CUST WHERE CUST.CD = IN_CUST_CD;
SELECT EMP.ID INTO EMP_ID FROM T_MT_EMPLOYEE EMP WHERE EMP.CD = IN_EMP_CD;
SELECT ITEM.ID, ITEM.PRODUCT_ID  INTO ITEM_ID,PRODUCT_ID FROM T_MT_ITEM ITEM WHERE ITEM.CD = IN_ITEM_CD;
SELECT STATIO.CD INTO STATIO_CD FROM T_MT_STATIO STATIO WHERE STATIO.ID = PRODUCT_ID;
SELECT DISC.ID, DISC.AMOUNT INTO DISC_ID, DISC_AMT FROM T_MT_DISCOUNT DISC WHERE DISC.CD = IN_DISC_CD;
IF STATIO_CD LIKE 'S%' THEN 
SELECT STATIO.ID, STATIO.PRICE INTO STATIO_ID, STATIO_PRICE FROM T_MT_STATIO STATIO WHERE STATIO.ID = PRODUCT_ID;
TOTAL := (STATIO_PRICE *((100-DISC_AMT)/100));
ELSE
SELECT BK.ID, BK.PRICE INTO BK_ID, BK_PRICE FROM T_MT_BOOK BK WHERE BK.ID = PRODUCT_ID;
TOTAL := (BK_PRICE * ((100-DISC_AMT)/100));
END IF;

DATE_COMMENCE := TO_DATE(IN_DT_COM, 'DDMMYYYY');


SELECT 'T' || COUNT(ID) INTO CODE FROM T_TRANSACTION;
SELECT TT.ID INTO TT_ID FROM T_MT_TRANTYPE TT WHERE TT.CD = IN_TT_CD;

INSERT INTO T_TRANSACTION
VALUES
(
  SYS_GUID(),
  CUST_ID,
  EMP_ID,
  ITEM_ID,
  DISC_ID,
  TT_ID,
  DATE_COMMENCE,
  TOTAL,
  CODE
);
COMMIT;
END;
