--
-- Copyright 2010-2017 Boxfuse GmbH
--
-- INTERNAL RELEASE. ALL RIGHTS RESERVED.
--
-- Must
-- be
-- exactly
-- 13 lines
-- to match
-- community
-- edition
-- license
-- length.
--

DROP USER FLYWAY CASCADE;
DROP USER FLYWAY_AUX CASCADE;
DROP USER "flyway_proxy" CASCADE;

-- drop flashback archive if possible
DECLARE
  l_flg NUMBER;
BEGIN
  SELECT COUNT(*) INTO l_flg FROM V$OPTION WHERE PARAMETER = 'Flashback Data Archive' AND VALUE = 'TRUE';
  IF l_flg > 0 THEN
    EXECUTE IMMEDIATE 'DROP FLASHBACK ARCHIVE FLYWAY_FBA';
  END IF;
END;
/