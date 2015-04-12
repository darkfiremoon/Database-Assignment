create or replace 
PROCEDURE P_DELETE_CUSTOMER(
IN_CD IN T_MT_CUSTOMER.CD%TYPE
)
IS
<<<<<<< HEAD
<<<<<<< HEAD

=======
CUSTOMER_ID VARCHAR(32);
>>>>>>> parent of c679cb3... ah

BEGIN
select ID INTO CUSTOMER_ID from T_MT_CUSTOMER WHERE CD = IN_CD;

<<<<<<< HEAD
=======

BEGIN
>>>>>>> origin/master
=======
DELETE FROM T_MT_CUSTOMER WHERE ID = CUSTOMER_ID;
>>>>>>> parent of c679cb3... ah

DELETE FROM T_MT_CUSTOMER WHERE CD = IN_CD;

COMMIT;
END;
