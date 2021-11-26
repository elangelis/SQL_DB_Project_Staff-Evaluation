/*3.1 Ερώτημα*/
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

/*3.2 ΕΡΏΤΗΜΑ */
DROP PROCEDURE IF EXISTS EvPhases;
DELIMITER $$
CREATE PROCEDURE EvPhases (IN JOBID_A int, IN Eval_A varchar(12))
BEGIN

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
        FETCH EvPhasesCurs INTO EVID2;
    END WHILE;
CLOSE EvPhasesCurs;
SELECT grade AS 'BATHMOLOGIA', Evaluator AS 'AKSIOLOGITIS' FROM evaluationresult AS er WHERE ((er.job_id=JOBID_A) AND (er.evaluator=Eval_A));
END$$
DELIMITER ;

/*3.3 ΕΡΏΤΗΜΑ */


DROP PROCEDURE IF EXISTS Evaluations;
DELIMITER $$
CREATE PROCEDURE Evaluations (IN JOBIDC int)
BEGIN

DECLARE GRADES INT;
DECLARE EVIDB INT;
DECLARE REDFLAG INT;
DECLARE FINISHEDFLAG INT;
DECLARE EXAMPLE INT;

DECLARE ERCURSR CURSOR FOR
    SELECT EvID
    FROM evaluationresult AS er 
    WHERE (er.job_id = JOBIDC);
DECLARE CONTINUE HANDLER FOR NOT FOUND SET FINISHEDFLAG=1;

SET REDFLAG=0;
OPEN ERCURSR;
SET FINISHEDFLAG=0;
FETCH ERCURSR INTO EVIDB;
WHILE (FINISHEDFLAG=0) DO
    SELECT er.grade
    INTO EXAMPLE
    FROM evaluationresult AS er
    WHERE er.EvID=EVIDB;
    IF EXAMPLE IS NULL
        THEN 
            SET REDFLAG=1;
    END IF;
    FETCH ERCURSR INTO EVIDB;
END WHILE;
CLOSE ERCURSR;

IF (REDFLAG=0) THEN 
    SELECT"DEN UPARXOUN NULL";
    SELECT EvID AS "KWDIKOS OLOKLIROMENWN AKSIOLOGISIEWN",job_id AS "KWDIKOS DOULEIAS", grade AS "BATHMOS AKSIOLOGISIS"  
    FROM evaluationresult 
    WHERE (job_id=JOBIDC)
    ORDER BY grade DESC;
   
ELSE
    SELECT EvID AS "OLOKLIROMENES AKSIOLOGISEIS",job_id AS "KWDIKOS DOULEIAS", grade AS "BATHMOS AKSIOLOGISIS"
    FROM evaluationresult 
    WHERE (job_id=JOBIDC) AND (grade IS NOT NULL)
    ORDER BY grade DESC;

    SELECT "UPARXOUN NULL";
    SELECT COUNT(*) AS "AKSIOLOGISEIS POU EKREMOUN:"
    FROM evaluationresult
    WHERE (grade IS NULL) AND (job_id=JOBIDC);
END IF;

END$$
DELIMITER ;