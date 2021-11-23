CREATE TRIGGER ai_job AFTER INSERT ON job
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Insert', 'Job', now());
CREATE TRIGGER au_job AFTER UPDATE ON job
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Update', 'Job', now());
CREATE TRIGGER ad_job AFTER DELETE ON job
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Delete', 'Job', now());

CREATE TRIGGER ai_employee AFTER INSERT ON employee
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Insert', 'Employee', now());
CREATE TRIGGER au_employee AFTER UPDATE ON employee
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Update', 'Employee', now());
CREATE TRIGGER ad_employee AFTER DELETE ON employee
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Delete', 'Employee', now());

CREATE TRIGGER ai_request AFTER INSERT ON requestevaluation
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Insert', 'RequestEvaluation', now());
CREATE TRIGGER au_request AFTER UPDATE ON requestevaluation
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Update', 'RequestEvaluation', now());
CREATE TRIGGER ad_request AFTER DELETE ON requestevaluation
FOR EACH ROW
INSERT INTO log (`Event`, `Table`, `Date`)
VALUES ('Delete', 'RequestEvaluation', now());

DELIMITER $$
CREATE TRIGGER bu_company BEFORE UPDATE ON company FOR EACH ROW 
BEGIN
IF NEW.AFM<>OLD.AFM THEN SET NEW.AFM=OLD.AFM; END IF;
IF NEW.DOY<>OLD.DOY THEN SET NEW.DOY=OLD.DOY; END IF;
IF NEW.name<>OLD.name THEN SET NEW.name=OLD.name; END IF;
END $$

DELIMITER $$
CREATE TRIGGER bu_user BEFORE UPDATE ON user FOR EACH ROW 
BEGIN
IF NEW.username<>OLD.username THEN 
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'This update is not permited'; END IF;
END $$
