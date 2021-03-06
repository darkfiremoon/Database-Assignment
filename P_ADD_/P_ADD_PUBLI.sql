CREATE OR REPLACE PROCEDURE P_ADD_PUBLI(
   IN_NAME IN T_MT_PUBLI.NAME%TYPE,
   IN_ADDRESS IN T_MT_PUBLI.ADDRESS%TYPE,
   IN_PHONE IN T_MT_PUBLI.PHONE%TYPE,
   IN_EMAIL IN T_MT_PUBLI.EMAIL%TYPE,
   IN_WEBSITE IN T_MT_PUBLI.WEBSITE%TYPE,
   IN_CD IN T_MT_DISCOUNT.CD%TYPE
)
IS


BEGIN

INSERT INTO T_MT_PUBLI
VALUES
( 
   SYS_GUID,
   IN_NAME,
   IN_ADDRESS,
   IN_PHONE,
   IN_EMAIL,
   IN_WEBSITE,
   IN_CD
);

COMMIT;

END;