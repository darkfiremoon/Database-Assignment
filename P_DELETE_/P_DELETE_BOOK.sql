create or replace
PROCEDURE P_DELETE_BOOK(
IN_CD IN T_MT_BOOK.CD%TYPE
)
IS
BEGIN
DELETE FROM T_MT_BOOK WHERE CD = IN_CD;

COMMIT;
END;
