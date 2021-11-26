DROP PROCEDURE IF EXISTS ApplicationsSearch;
DELIMITER $$
CREATE PROCEDURE ApplicationsSearch(IN a varchar(45))
BEGIN
    DECLARE username_IPAL varchar(12);
    DECLARE GradeB INT;

    SELECT username INTO username_IPAL from employee WHERE fullName=a;
        
        /* 3.1.Α ΕΡΏΤΗΜΑ */
        SELECT re.EvID as "sinolo aitisewn",u.name as "evaluator fullname"
        FROM requestevaluation AS re 
        INNER JOIN evaluationresult AS er ON er.EvID=re.EvID
        INNER JOIN user AS u ON u.username=er.evaluator
        WHERE re.empl_username=username_IPAL;

        SELECT "OLOKLIROMENES AKSIOLOGISEIS";
        /* 3.1.Β ΕΡΏΤΗΜΑ MAZI ME 3.1.Γ ΕΡΏΤΗΜΑ */
        SELECT er.EvID AS "KWDIKOS AKSIOLOGISIS",er.job_id AS "KWDIKOS THESIS ERGASIAS",er.grade AS"GRADE:" ,u.name AS"evaluator fullname"
        FROM evaluationresult AS er 
        INNER JOIN user AS u ON u.username=er.evaluator
        WHERE   empl_username=username_IPAL 
                AND grade IS NOT NULL ;
        
        
        SELECT "AKSIOLOGISEIS SE EKSELIKSI ";
        /*3.1.Δ ΕΡΏΤΗΜΑ */
        SELECT  er.EvID AS "KWDIKOS AKSIOLOGISIS",
                er.job_id AS "KWDIKOS THESIS ERGASIAS",
                ep.phase1 AS "PHASE 1:",
                ep.phase2 AS "PHASE 2:",
                ep.phase3 AS "PHASE 3:",
                u.name AS "evaluator fullname"
        FROM evaluationresult AS er
        INNER JOIN evaluationphases AS ep ON er.EvID=ep.EvID
        INNER JOIN user AS u ON u.username=er.evaluator
        WHERE   empl_username=username_IPAL
                AND er.grade IS NULL;
        
END$$
DELIMITER ;
CALL ApplicationsSearch('THEOFILOS TSOTRAS');


/*3.2 ΕΡΏΤΗΜΑ */
DROP PROCEDURE IF EXISTS EvPhases;
DELIMITER $$
CREATE PROCEDURE EvPhases (IN JOBID_A int, IN Eval_A varchar(12))
BEGIN

DECLARE GRADES INT;
DECLARE EVIDB INT;
DECLARE FINISHEDFLAG INT;

DECLARE EvPhasesCurs CURSOR FOR
    SELECT EvID  
    FROM evaluationresult as er 
    WHERE ((er.job_id=JOBID_A) AND (er.evaluator=Eval_A));
DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHEDFLAG=1;

OPEN EvPhasesCurs;
SET FINISHEDFLAG=0;
    FETCH EvPhasesCurs INTO EVIDB;
    WHILE (FINISHEDFLAG)=0 DO
        UPDATE evaluationresult AS er
        INNER JOIN evaluationphases AS ep ON ep.EvID = er.EvID
        SET  er.grade = ep.phase1 + ep.phase2 + ep.phase3
        WHERE ep.EvID=EVIDB;
        SELECT EVIDB;
        FETCH EvPhasesCurs INTO EVIDB;
    END WHILE;
CLOSE EvPhasesCurs;
END$$
DELIMITER ;
CALL EvPhases(0004,"E.BARDAKI");
CALL EvPhases(0005,"G.PAPADOP");
select * from evaluationresult;
select * from evaluationphases;



/*3.3 ΕΡΏΤΗΜΑ */

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
