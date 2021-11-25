/*----USER-----*/

INSERT INTO user(username,pass,name,reg_date,email) VALUES ('N.TSIPOURAS',123456789,'NIKOS TSIPOURAS','2000-09-28 08:47:31','n.tsipouras@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('G.THEODOROU',123456789,'GIWRGOS THEODOROU','2000-09-28 08:47:32','g.theodorou@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('A.AGGELI',123456789,'ATHANASIA AGGELI','2000-09-28 08:47:33','a.aggeli@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('H.AGGELIS',123456789,'HLIAS AGGELIS','2000-09-28 08:47:34','h.aggelis@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('G.PAPADOP',123456789,'GIWRGOS PAPADOPOULOS','2000-09-28 08:47:35','g.papadopoulos@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('G.PAPADIMA',123456789,'GEWRGIA PAPADIMA','2000-09-28 08:47:36','g.papadima@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('N.BARDAKI',123456789,'NAGIA BARDAKI','2000-09-28 08:47:37','n.bardaki@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('E.BARDAKI',123456789,'EUA BARDAKI','2000-09-28 08:47:38','e.bardaki@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('T.TSOTRAS',123456789,'THEOFILOS TSOTRAS','2000-09-28 08:47:39','t.tsotras@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('P.MPISKOS',123456789,'PAULOS MPISKOS','2000-09-28 08:47:40','p.mpiskos@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('I.TSOTRA',123456789,'IOANNA TSOTRA','2000-09-28 08:47:41','i.tsotra@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('E.THEODOROU',123456789,'ELISAVET THEODOROU','2000-09-28 08:47:42','e.theodorou@ceid.gr');
INSERT INTO user(username,pass,name,reg_date,email) VALUES ('A.PAPASTAV',123456789,'KATERINA PAPASTAUROU','2000-09-28 08:47:43','k.papastaurou@ceid.gr');


/*----COMPANY-----*/

INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES (123456789,'XOLARGOU','A.E. SPANOUDAKIS',2101234567,'ARISTEIDOU',12,'ATHENS','GREECE');
INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES (123456788,'XOLARGOU','A.E. POLIERGO',2101234567,'ARISTOFANOUS',23,'ATHENS','GREECE');
INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES (123123123,'XOLARGOU','A.E. MANOUSOS',2101231231,'EURIPIDOU',32,'PATRAS','GREECE');
INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES (123123789,'XALANDRIOU','A.E. MITROGLOU',2101231237,'KLAUTHMONOS',34,'PATRAS','GREECE');
INSERT INTO company(AFM,DOY,name,phone,street,num,city,country) VALUES (123123456,'LEUKOSIAS','A.E. PAPADOPOULOS',2101231234,'SOKRATOUS',56,'LEUKOSIA','CYPRUS');


/*----MANAGER-----*/

INSERT INTO manager(managerUsername,exp_years,firm) VALUES ('N.TSIPOURAS',10,123456789);
INSERT INTO manager(managerUsername,exp_years,firm) VALUES ('G.THEODOROU',10,123456788);
INSERT INTO manager(managerUsername,exp_years,firm) VALUES ('A.AGGELI',5,123123123);
INSERT INTO manager(managerUsername,exp_years,firm) VALUES ('N.TSIPOURAS',10,123123789);
INSERT INTO manager(managerUsername,exp_years,firm) VALUES ('G.THEODOROU',10,123123456);

/*----EVALUATOR-----*/

INSERT INTO evaluator(username,exp_years,firm) VALUES ('G.PAPADOP',10,123456789);
INSERT INTO evaluator(username,exp_years,firm) VALUES ('G.PAPADIMA',10,123456788);
INSERT INTO evaluator(username,exp_years,firm) VALUES ('N.BARDAKI',8,123123123);
INSERT INTO evaluator(username,exp_years,firm) VALUES ('E.BARDAKI',7,123123789);
INSERT INTO evaluator(username,exp_years,firm) VALUES ('G.PAPADOP',10,123123456);
INSERT INTO evaluator(username,exp_years,firm) VALUES ('G.PAPADOP',10,123123123);


/*----EMPLOYEE-----*/

INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES ('T.TSOTRAS',NULL,NULL,NULL,NULL);
INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES ('P.MPISKOS',NULL,NULL,NULL,NULL);
INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES ('I.TSOTRA',NULL,NULL,NULL,NULL);
INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES ('E.THEODOROU',NULL,NULL,NULL,NULL);
INSERT INTO employee(username,bio,sistatikes,certificates,awards) VALUES ('A.PAPASTAV',NULL,NULL,NULL,NULL);

/*----ADMINISTRATOR-----*/

INSERT INTO administrator(administrator_username,privilegies) VALUES ('H.AGGELIS','YES');

/*----DEGREE-----*/

INSERT INTO degree(titlos,idryma,bathmida) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','LYKEIO');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('COMPUTER ENGINNEERING & INFORMATICS DEPARTMENT','PANEPISTIMIO PATRWN','UNIV');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('CHEMICAL ENGINEERING','PANEPISTIMIO ATHINWN','UNIV');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('ECONOMICS','PANEPISTIMIO PELOPONISOU','UNIV');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('DATA SCIENCE','PANEPISTIMIO DITIKIS ELLADAS','MASTER');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('DATA SCIENCE AND DATABASES','ETHNIKO METSOVEIO POLITEXNEIO','MASTER');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('ARTIFICIAL INTELLIGENCE','STOCKHOLM UNIVERSITY','PHD');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('MATHEMATICS','ARISTOTELEIO PANEPISTIMIO','PHD');
INSERT INTO degree(titlos,idryma,bathmida) VALUES ('PHYSICS','PANEPISTIMIO THESSALONIKIS','PHD');

/*----HAS_DEGREE-----*/
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','T.TSOTRAS',2001,'19,3');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','P.MPISKOS',2002,'18,5');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','I.TSOTRA',2003,'17,9');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','E.THEODOROU',2004,'20');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('APOLITIRIO LYKEIOU','1O LYKEIO XALANDRIOU','A.PAPASTAV',2005,'18,9');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('COMPUTER ENGINNEERING & INFORMATICS DEPARTMENT','PANEPISTIMIO PATRWN','T.TSOTRAS',2010,'8,8');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('CHEMICAL ENGINEERING','PANEPISTIMIO PATRWN','P.MPISKOS',2011,'8,5');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('ECONOMICS','PANEPISTIMIO PELOPONISOU','I.TSOTRA',2012,'9,2');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('COMPUTER ENGINNEERING & INFORMATICS DEPARTMENT','PANEPISTIMIO PATRWN','E.THEODOROU',2013,'6,9');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('CHEMICAL ENGINEERING','PANEPISTIMIO PATRWN','A.PAPASTAV',2014,'10');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('DATA SCIENCE','PANEPISTIMIO PATRWN','T.TSOTRAS',2014,'10');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('DATA SCIENCE AND DATABASES','ETHNIKO METSOVEIO POLITEXNEIO','E.THEODOROU',2016,'8');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('ARTIFICIAL INTELLIGENCE','STOCKHOLM UNIVERSITY','T.TSOTRAS',2018,'9');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('ARTIFICIAL INTELLIGENCE','STOCKHOLM UNIVERSITY','E.THEODOROU',2020,'9,5');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('MATHEMATICS','ARISTOTELEIO PANEPISTIMIO','I.TSOTRA',2015,'7,6');
INSERT INTO has_degree(degr_title,degr_idryma,empl_usrname,etos,grade) VALUES ('PHYSICS','PANEPISTIMIO PATRWN','A.PAPASTAV',2017,'9,5');


/*----LANGUAGES-----*/

INSERT INTO languages(employee,lang) VALUES ('T.TSOTRAS','EN,GR,FR');
INSERT INTO languages(employee,lang) VALUES ('P.MPISKOS','EN,GR,FR');
INSERT INTO languages(employee,lang) VALUES ('I.TSOTRA','EN,GR,FR,SP');
INSERT INTO languages(employee,lang) VALUES ('E.THEODOROU','EN,GR,SP');
INSERT INTO languages(employee,lang) VALUES ('A.PAPASTAV','EN,GR,');


/*----PROJECT-----*/

INSERT INTO project(empl,num,descr,url) VALUES ('T.TSOTRAS',NULL,'DEFAULT','www.project0001.com');
INSERT INTO project(empl,num,descr,url) VALUES ('T.TSOTRAS',NULL,'DEFAULT','www.project0010.com');
INSERT INTO project(empl,num,descr,url) VALUES ('I.TSOTRA',NULL,'DEFAULT','www.project0100.com');
INSERT INTO project(empl,num,descr,url) VALUES ('I.TSOTRA',NULL,'DEFAULT','www.project1000.com');
INSERT INTO project(empl,num,descr,url) VALUES ('A.PAPASTAV',NULL,'DEFAULT','www.project0002.com');
INSERT INTO project(empl,num,descr,url) VALUES ('E.THEODOROU',NULL,'DEFAULT','www.project0020.com');
INSERT INTO project(empl,num,descr,url) VALUES ('E.THEODOROU',NULL,'DEFAULT','www.project0200.com');
INSERT INTO project(empl,num,descr,url) VALUES ('P.MPISKOS',NULL,'DEFAULT','www.project2000.com');



/*----JOB-----*/

INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0001,'2022-05-25',20000,'manager','ATHENS','G.PAPADOP','2021-11-22 12:58:01','2022-01-01');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0002,'2022-05-25',400000,'manager','ATHENS','G.PAPADIMA','2021-10-22 12:58:02','2022-02-02');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0003,'2022-05-25',800,'IT','PATRAS','N.BARDAKI','2021-09-25 12:58:03','2022-01-02');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0004,'2022-05-25',1200,'code','ATHENS','E.BARDAKI','2021-08-01 12:58:04','2022-02-03');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0005,'2022-01-01',800,'secretary','PATRAS','G.PAPADOP','2021-08-01 12:58:04','2021-12-12');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0006,'2022-01-02',1000,'secretary','ATHENS','G.PAPADIMA','2021-08-01 12:58:04','2021-12-28');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0007,'2022-01-03',2500,'sales manager','ATHENS','N.BARDAKI','2021-07-15 12:58:04','2021-12-15');
INSERT INTO job(id,start_date,salary,position,edra,evaluator,announce_date,submission_date) VALUES (0008,'2022-01-04',30000,'sales manager','PATRAS','E.BARDAKI','2021-07-15 12:58:04','2021-11-28');




/*----ANTIKEIM-----*/

INSERT INTO antikeim(title,descr,belongs_to) VALUES ('SALES',NULL,'DEFAULT');
INSERT INTO antikeim(title,descr,belongs_to) VALUES ('IT',NULL,'DEFAULT');
INSERT INTO antikeim(title,descr,belongs_to) VALUES ('CODE',NULL,'IT');
INSERT INTO antikeim(title,descr,belongs_to) VALUES ('OFFICE',NULL,'DEFAULT');
INSERT INTO antikeim(title,descr,belongs_to) VALUES ('MANAGER',NULL,'DEFAULT');
INSERT INTO antikeim(title,descr,belongs_to) VALUES ('SALES MANAGER',NULL,'SALES');



/*----NEEDS-----*/

INSERT INTO needs(job_id,antikeim_title) VALUES (0001,'MANAGER');
INSERT INTO needs(job_id,antikeim_title) VALUES (0002,'MANAGER');
INSERT INTO needs(job_id,antikeim_title) VALUES (0003,'IT');
INSERT INTO needs(job_id,antikeim_title) VALUES (0004,'CODE');
INSERT INTO needs(job_id,antikeim_title) VALUES (0005,'OFFICE');
INSERT INTO needs(job_id,antikeim_title) VALUES (0006,'OFFICE');
INSERT INTO needs(job_id,antikeim_title) VALUES (0007,'SALES MANAGER');
INSERT INTO needs(job_id,antikeim_title) VALUES (0008,'SALES MANAGER');



/*----REQUESTEVALUATION-----*/

INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0001);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0001);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0001);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0001);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0001);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0002);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0002);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0002);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0002);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0002);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0003);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0003);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0003);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0003);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0003);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0004);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0004);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0004);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0004);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0004);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0005);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0005);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0005);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0005);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0005);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0006);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0006);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0006);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0006);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0006);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0007);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0007);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0007);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0007);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0007);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('T.TSOTRAS',0008);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('P.MPISKOS',0008);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('I.TSOTRA',0008);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('E.THEODOROU',0008);
INSERT INTO requestevaluation(empl_username,job_id) VALUES ('A.PAPASTAV',0008);


/*----EVALUATIONRESULT-----*/

INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0001,'T.TSOTRAS',0001,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0002,'P.MPISKOS',0001,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0003,'I.TSOTRA',0001,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0004,'E.THEODOROU',0001,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0005,'A.PAPASTAV',0001,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0006,'T.TSOTRAS',0002,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0007,'P.MPISKOS',0002,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0008,'I.TSOTRA',0002,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0009,'E.THEODOROU',0002,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0010,'A.PAPASTAV',0002,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0011,'T.TSOTRAS',0003,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0012,'P.MPISKOS',0003,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0013,'I.TSOTRA',0003,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0014,'E.THEODOROU',0003,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0015,'A.PAPASTAV',0003,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0016,'T.TSOTRAS',0004,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0017,'P.MPISKOS',0004,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0018,'I.TSOTRA',0004,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0019,'E.THEODOROU',0004,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0020,'A.PAPASTAV',0004,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0021,'T.TSOTRAS',0005,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0022,'P.MPISKOS',0005,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0023,'I.TSOTRA',0005,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0024,'E.THEODOROU',0005,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0025,'A.PAPASTAV',0005,NULL,'DEFAULT','G.PAPADOP');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0026,'T.TSOTRAS',0006,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0027,'P.MPISKOS',0006,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0028,'I.TSOTRA',0006,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0029,'E.THEODOROU',0006,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0030,'A.PAPASTAV',0006,NULL,'DEFAULT','G.PAPADIMA');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0031,'T.TSOTRAS',0007,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0032,'P.MPISKOS',0007,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0033,'I.TSOTRA',0007,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0034,'E.THEODOROU',0007,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0035,'A.PAPASTAV',0007,NULL,'DEFAULT','N.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0036,'T.TSOTRAS',0008,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0037,'P.MPISKOS',0008,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0038,'I.TSOTRA',0008,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0039,'E.THEODOROU',0008,NULL,'DEFAULT','E.BARDAKI');
INSERT INTO evaluationresult(Evld,empl_username,job_id,grade,comments,evaluator) VALUES (0040,'A.PAPASTAV',0008,NULL,'DEFAULT','E.BARDAKI');

/*----EVALUATIONPHASES-----*/

INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0001,0,0,0);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0002,1,1,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0003,2,3,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0004,2,2,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0005,2,3,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0006,3,1,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0007,4,1,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0008,4,2,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0009,1,2,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0010,2,3,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0011,0,3,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0012,4,2,0);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0013,3,3,0);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0014,2,3,0);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0015,1,4,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0016,3,4,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0017,4,4,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0018,4,3,2);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0019,4,2,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0020,3,1,1);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0021,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0022,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0023,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0024,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0025,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0026,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0027,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0028,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0029,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0030,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0031,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0032,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0033,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0034,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0035,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0036,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0037,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0038,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0039,NULL,NULL,NULL);
INSERT INTO evaluationphases(EvID,phase1,phase2,phase3) VALUES (0040,NULL,NULL,NULL);

