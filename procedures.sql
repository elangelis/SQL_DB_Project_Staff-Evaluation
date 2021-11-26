DROP PROCEDURE IF EXISTS ApplicationsSearch;
DELIMITER $$
CREATE PROCEDURE ApplicationsSearch(IN a varchar(45))
BEGIN
    DECLARE username_IPAL varchar(12);
    DECLARE ev_fullname VARCHAR(45);
    DECLARE Grade INT;

        SELECT username INTO username_IPAL from employee WHERE fullName=a;
        /* 3.1.Α ΕΡΏΤΗΜΑ */
        SELECT EvID FROM requestevaluation WHERE empl_username=username_IPAL;
        /* 3.1.Β ΕΡΏΤΗΜΑ */
        SELECT EvID,job_id FROM evaluationresult WHERE empl_username=username_IPAL AND grade<>null;

        /* 3.1.Γ ΕΡΏΤΗΜΑ*/
        SELECT u.name AS "FULL NAME",ep.phase1 AS "PHASE 1",ep.phase2 AS "PHASE 2",ep.phase3 AS "PHASE 3" 
        FROM user AS u
        INNER JOIN evaluator AS e ON e.username=u.username
        INNER JOIN evaluationresult AS er ON er.empl_username=e.username AND grade<>null
        INNER JOIN evaluationphases AS ep ON ep.EvID=er.EvID
        WHERE username_IPAL=er.empl_username;
END$$
DELIMITER ;
CALL ApplicationsSearch('THEOFILOS TSOTRAS');


/*3.2 ΕΡΏΤΗΜΑ */
DROP PROCEDURE IF EXISTS EvPhases;
DELIMITER $$
CREATE PROCEDURE EvPhases (IN JOBID_A int, IN Eval_A varchar(12))
BEGIN

DECLARE GRADE INT;
DECLARE EVID INT;
DECLARE FINISHEDFLAG INT;

DECLARE EvPhasesCurs CURSOR FOR
    SELECT EvID  
    FROM evaluationresult as er 
    WHERE ((er.job_id=JOBID_A) AND (er.evaluator=Eval_A));

DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHEDFLAG=1;
OPEN EvPhasesCurs;
SET FINISHEDFLAG=0;
    FETCH EvPhasesCurs INTO EVID;
    WHILE (FINISHEDFLAG)=0 DO
        UPDATE evaluationresult AS er
        INNER JOIN evaluationphases AS ep ON ep.EvID=er.EvID
        SET  er.grade = ep.phase1 + ep.phase2 + ep.phase3,
            GRADE= phase1 + phase2 + phase3
        WHERE ep.EvID=EVID AND  (phase1<>NULL) AND (phase2<>NULL) AND (phase3<>NULL) ;
        SELECT GRADE;
        SELECT EVID;
        FETCH EvPhasesCurs INTO EVID;
    END WHILE;
CLOSE EvPhasesCurs;
END$$
DELIMITER ;
CALL EvPhases(0001,"G.PAPADOP");
select * from evaluationresult  LIMIT 5;
select * from evaluationphases LIMIT 5;




/*SELECT ep.phase1,ep.phase2,ep.phase3
FROM evaluationphases
INNER JOIN */

UPDATE evaluationresult AS er
INNER JOIN evaluationphases AS ep ON ep.EvID=er.EvID
WHERE   ( 
        IF(ep.phase1<>null AND ep.phase2<>null AND ep.phase3<>null)
            THEN
                SET GRADE=ep.phase1+ep.phase2+ep.phase3;
                UPDATE evaluationresult SET grade=GRADE
        END IF;
        )
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





/* 3.1.Γ ΕΡΏΤΗΜΑ προσπαθεια με cursor */ 

DECLARE finishedflag INT(4);                                                                               
DECLARE CURSOR ev_fullnameCURS                                                                  
CURSOR FOR
SELECT evaluator FROM requestevaluation WHERE empl_username=username_IPAL AND grade<>NULL;        
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finishedflag=1;
    OPEN ev_fullnameCURS;
        SET finishedflag=0;
        REPEAT
            FETCH ev_fullnameCURS INTO EVALUATOR_NAME;
                 IF (finishedflag=0) THEN 
                    SELECT ev_fullname AS "Evaluator Full Name: /n";
                END IF;        
             UNTIL (finishedflag=1)
        END REPEAT;
    CLOSE ev_fullnameCURS;
SELECT 'Evaluation in progress';
                    SELECT EvID,phase1,phase2,phase3 from evaluationphases
                    INNER JOIN evaluationresult ON evaluationresult.grade=NULL;
                END IF;
