DELIMITER $
DROP TRIGGER IF EXISTS ai_job$
CREATE TRIGGER ai_job AFTER INSERT ON job FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Insert', 'Job', now());
END$
DROP TRIGGER IF EXISTS au_job$
CREATE TRIGGER au_job AFTER UPDATE ON job FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Update', 'Job', now());
END$
DROP TRIGGER IF EXISTS ad_job$
CREATE TRIGGER ad_job AFTER DELETE ON job FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Delete', 'Job', now());
END$

DROP TRIGGER IF EXISTS ai_employee$
CREATE TRIGGER ai_employee AFTER INSERT ON employee FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Insert', 'Employee', now());
END$
DROP TRIGGER IF EXISTS au_employee$
CREATE TRIGGER au_employee AFTER UPDATE ON employee FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Update', 'Employee', now());
END$
DROP TRIGGER IF EXISTS ad_employee$
CREATE TRIGGER ad_employee AFTER DELETE ON employee FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Delete', 'Employee', now());
END$

DROP TRIGGER IF EXISTS ai_request$
CREATE TRIGGER ai_request AFTER INSERT ON requestevaluation FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Insert', 'RequestEvaluation', now());
END$
DROP TRIGGER IF EXISTS au_request$
CREATE TRIGGER au_request AFTER UPDATE ON requestevaluation FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Update', 'RequestEvaluation', now());
END$
DROP TRIGGER IF EXISTS ad_request$
CREATE TRIGGER ad_request AFTER DELETE ON requestevaluation FOR EACH ROW
BEGIN
INSERT INTO log (`Event`, `Table_Target`, `Date`)
VALUES ('Delete', 'RequestEvaluation', now());
END $

DROP TRIGGER IF EXISTS bu_company$
CREATE TRIGGER bu_company BEFORE UPDATE ON company FOR EACH ROW 
BEGIN
IF NEW.AFM<>OLD.AFM THEN SET NEW.AFM=OLD.AFM; END IF;
IF NEW.DOY<>OLD.DOY THEN SET NEW.DOY=OLD.DOY; END IF;
IF NEW.name<>OLD.name THEN SET NEW.name=OLD.name; END IF;
END $

DROP TRIGGER IF EXISTS bu_user$
CREATE TRIGGER bu_user BEFORE UPDATE ON user FOR EACH ROW 
BEGIN
IF NEW.username<>OLD.username THEN 
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'This update is not permited'; END IF;
END $

DROP TRIGGER IF EXISTS bu_project$
CREATE TRIGGER bu_project
BEFORE INSERT ON project FOR EACH ROW
BEGIN
   DECLARE entry int;
   SELECT IFNULL(MAX(p.num), 0) + 1 INTO entry FROM project AS p WHERE p.empl = NEW.empl;
   SET NEW.num = entry;
END$
DELIMITER ;
