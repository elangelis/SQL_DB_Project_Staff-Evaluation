DELIMITER $$
CREATE PROCEDURE ApplicationsSearch(IN username varchar(45))
BEGIN
SELECT EvID FROM requestevaluation WHERE empl_username=username;
SELECT EvID FROM evaluationresult WHERE empl_username=username AND grade>0;
SELECT evaluator FROM evaluationresult WHERE empl_username=username;
IF evaluationresult.grade=null THEN SELECT 'Evaluation in progress'; END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE EvPhases (IN JobID int, IN Evaluator varchar(15))
BEGIN
IF phase1<>null AND phase2<>null AND phase3<>null THEN
SET evaluationresult.grade= evaluationphases.phase1 + evaluationphases.phase2 + evaluationphases.phase3; END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE Evaluations (IN JobID int)
BEGIN
IF grade<>null THEN
SELECT 'Final Tables';
SELECT empl_username,grade FROM evaluationresult WHERE JobID=job_id ORDER BY grade DESC;
ELSEIF grade IS null THEN
SELECT 'Evaluations in progress', COUNT(*) FROM evaluationresult WHERE grade=null; END IF;
END$$
DELIMITER ;
