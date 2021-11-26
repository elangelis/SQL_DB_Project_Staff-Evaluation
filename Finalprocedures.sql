/*3.1 Ερώτημα*/
DROP PROCEDURE IF EXISTS ApplicationsSearch;
DELIMITER $$
CREATE PROCEDURE ApplicationsSearch(IN a varchar(45))
BEGIN
    DECLARE username_IPAL varchar(12);
    DECLARE ev_fullname VARCHAR(45);
    DECLARE GradeΒ INT;

        SELECT username INTO username_IPAL from employee WHERE fullName=a;
        /* 3.1.Α ΕΡΏΤΗΜΑ */
        SELECT EvID FROM requestevaluation WHERE empl_username=username_IPAL;
        /* 3.1.Β ΕΡΏΤΗΜΑ */
        SELECT EvID,job_id,grade FROM evaluationresult WHERE empl_username=username_IPAL AND grade IS NOT null;

        /* 3.1.Γ ΕΡΏΤΗΜΑ*/
        SELECT u.name AS "FULL NAME",ep.phase1 AS "PHASE 1",ep.phase2 AS "PHASE 2",ep.phase3 AS "PHASE 3" 
        FROM user AS u
        INNER JOIN evaluator AS e ON e.username=u.username
        INNER JOIN evaluationresult AS er ON er.empl_username=e.username AND grade IS NOT null
        INNER JOIN evaluationphases AS ep ON ep.EvID=er.EvID
        WHERE username_IPAL=er.empl_username;
END$$
DELIMITER ;

/*3.2 ΕΡΏΤΗΜΑ */
DROP PROCEDURE IF EXISTS EvPhases;
DELIMITER $$
CREATE PROCEDURE EvPhases (IN JOBID_A int, IN Eval_A varchar(12))
BEGIN

DECLARE GRADE INT;
DECLARE EVID2 INT;
DECLARE FINISHEDFLAG INT;

DECLARE EvPhasesCurs CURSOR FOR
    SELECT EvID  
    FROM evaluationresult as er 
    WHERE ((er.job_id=JOBID_A) AND (er.evaluator=Eval_A));

DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHEDFLAG=1;
OPEN EvPhasesCurs;
SET FINISHEDFLAG=0;
    FETCH EvPhasesCurs INTO EVID2;
    WHILE (FINISHEDFLAG)=0 DO
        UPDATE evaluationresult AS er
        INNER JOIN evaluationphases AS ep ON ep.EvID=er.EvID
        SET  er.grade = ep.phase1 + ep.phase2 + ep.phase3
        WHERE ep.EvID=EVID2 AND  phase1 IS NOT NULL AND phase2 IS NOT NULL AND phase3 IS NOT NULL;
        SELECT EVID2;
        FETCH EvPhasesCurs INTO EVID2;
    END WHILE;
CLOSE EvPhasesCurs;
END$$
DELIMITER;
