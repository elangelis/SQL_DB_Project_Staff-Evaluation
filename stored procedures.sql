DELIMITER $$
CREATE PROCEDURE ApplicationsSearch(username varchar(45))
BEGIN
SELECT EvID FROM requestevaluation WHERE empl_username=username;
SELECT EvID FROM evaluationresult WHERE empl_username=username AND grade>0;
SELECT evaluator FROM evaluationresult WHERE empl_username=username;
IF evaluationresult.grade=null THEN SELECT 'Evaluation in progress'; END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Evaluations (JobID int)
BEGIN
IF grade<>null THEN
SELECT 'Final Tables';
SELECT empl_username,grade FROM evaluation result WHERE JobID=job_id ORDER BY grade DESC;
ELSEIF grade IS null THEN
SELECT 'Evaluations in progress' + COUNT(*) FROM evaluationresult WHERE grade=null; END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `Evaluations` (JobID int)
BEGIN
IF grade<>null THEN
SELECT 'Final Tables'
SELECT empl_username,grade FROM evaluationresult WHERE JobID=job_id ORDER BY grade DESC;
ELSEIF grade IS null THEN
SELECT 'Evaluations in progress',COUNT(*) FROM evaluationresult WHERE grade=null END IF;
END$$
DELIMITER ;
