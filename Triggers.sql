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