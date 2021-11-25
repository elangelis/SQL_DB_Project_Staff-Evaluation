DROP DATABASE IF EXISTS staffevaluation;
CREATE DATABASE staffevaluation;
USE staffevaluation;
CREATE TABLE user (
  username varchar(12) NOT NULL DEFAULT 'unknown',
  pass varchar(10) NOT NULL,
  name varchar(25) NOT NULL DEFAULT 'unknown',
  reg_date datetime DEFAULT NULL,
  email varchar(30) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (username),
  UNIQUE KEY email (email)
) ;
CREATE TABLE company (
  AFM char(9) NOT NULL,
  DOY varchar(15) DEFAULT NULL,
  name varchar(35) DEFAULT NULL,
  phone bigint DEFAULT NULL,
  street varchar(15) DEFAULT NULL,
  num tinyint DEFAULT NULL,
  city varchar(15) DEFAULT NULL,
  country varchar(15) DEFAULT NULL,
  PRIMARY KEY (AFM)
);
CREATE TABLE antikeim (
  title varchar(36) NOT NULL,
  descr tinytext,
  belongs_to varchar(36) DEFAULT 'no upper category',
  PRIMARY KEY (title)
);
CREATE TABLE degree (
  titlos varchar(50) NOT NULL,
  idryma varchar(40) NOT NULL,
  bathmida enum('LYKEIO','UNIV','MASTER','PHD') DEFAULT NULL,
  PRIMARY KEY (titlos),
  UNIQUE KEY idryma (idryma)
);
CREATE TABLE employee (
  username varchar(12) NOT NULL,
  bio text,
  sistatikes varchar(35) DEFAULT NULL,
  certificates varchar(35) DEFAULT NULL,
  awards varchar(35) DEFAULT NULL,
  WorkingFor char(9) DEFAULT NULL,
  fullName varchar(45) DEFAULT NULL,
  CONSTRAINT EMPLUSR FOREIGN KEY (username) REFERENCES user (username),
  CONSTRAINT EMPLWRK FOREIGN KEY (WorkingFor) REFERENCES company (AFM)
);
CREATE TABLE manager (
  managerUsername varchar(12) NOT NULL,
  exp_years tinyint NOT NULL DEFAULT '0',
  firm char(9) NOT NULL DEFAULT '0',
  CONSTRAINT FIRMAFM FOREIGN KEY (firm) REFERENCES company (AFM),
  CONSTRAINT MNGRUSR FOREIGN KEY (managerUsername) REFERENCES user (username)
);
CREATE TABLE evaluator (
  username varchar(12) NOT NULL,
  exp_years tinyint NOT NULL DEFAULT '0',
  firm char(9) NOT NULL,
  CONSTRAINT EVLTRUSR FOREIGN KEY (username) REFERENCES user (username),
  CONSTRAINT FIRMAFM2 FOREIGN KEY (firm) REFERENCES company (AFM)
);
CREATE TABLE job (
  id int NOT NULL,
  start_date date DEFAULT NULL,
  salary float(6,1) DEFAULT NULL,
  position varchar(40) DEFAULT NULL,
  edra varchar(45) DEFAULT NULL,
  evaluator varchar(12) DEFAULT NULL,
  announce_date datetime DEFAULT NULL,
  submission_date date DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT EVLTUSR FOREIGN KEY (evaluator) REFERENCES evaluator (username)
);
CREATE TABLE requestevaluation (
  empl_username varchar(12) NOT NULL,
  job_id int NOT NULL,
  EvID int AUTO_INCREMENT,
  PRIMARY KEY (EvID),
  CONSTRAINT EMPLRQSTSEVAL FOREIGN KEY (empl_username) REFERENCES employee (username),
  CONSTRAINT FORJOB FOREIGN KEY (job_id) REFERENCES job (id)
);
CREATE TABLE evaluationphases (
  EvID int NOT NULL,
  phase1 int DEFAULT NULL,
  phase2 int DEFAULT NULL,
  phase3 int DEFAULT NULL,
  FOREIGN KEY (EvID) REFERENCES requestevaluation (EvID),
  CHECK ((phase1 >= 0) and (phase1 <= 4) and (phase2 >= 0) and (phase2 <= 4) and (phase3 >= 0) and (phase3 <= 2))
);
CREATE TABLE evaluationresult (
  Evld int NOT NULL,
  empl_username varchar(12) NOT NULL,
  job_id int NOT NULL,
  grade int DEFAULT NULL,
  comments varchar(255) DEFAULT NULL,
  evaluator varchar(15) DEFAULT NULL,
  CONSTRAINT EVALUATOR FOREIGN KEY (evaluator) REFERENCES evaluator (username),
  CONSTRAINT WHCHEMPL FOREIGN KEY (empl_username) REFERENCES employee (username),
  CONSTRAINT WHCHEVID FOREIGN KEY (Evld) REFERENCES requestevaluation (EvID),
  CONSTRAINT WHCHJOB FOREIGN KEY (job_id) REFERENCES job (id)
);
CREATE TABLE has_degree (
  degr_title varchar(50) DEFAULT NULL,
  degr_idryma varchar(40) DEFAULT NULL,
  empl_usrname varchar(12) DEFAULT NULL,
  etos year DEFAULT NULL,
  grade float(3,1) DEFAULT NULL,
  CONSTRAINT WHCHDEGREE FOREIGN KEY (degr_title) REFERENCES degree (titlos),
  CONSTRAINT WHCHEMPL2 FOREIGN KEY (empl_usrname) REFERENCES employee (username),
  CONSTRAINT WHRDEGREE FOREIGN KEY (degr_idryma) REFERENCES degree (idryma)
);
CREATE TABLE languages (
  employee varchar(12) NOT NULL,
  lang set('EN','FR','SP','GR') NOT NULL,
  PRIMARY KEY (lang),
  CONSTRAINT LANGEMPL FOREIGN KEY (employee) REFERENCES employee (username)
);
CREATE TABLE needs (
  job_id int NOT NULL,
  antikeim_title varchar(36) NOT NULL,
  CONSTRAINT JOBNEEDS FOREIGN KEY (job_id) REFERENCES job (id),
  CONSTRAINT NDSANTIK FOREIGN KEY (antikeim_title) REFERENCES antikeim (title)
);
CREATE TABLE project (
  empl varchar(12) NOT NULL,
  num tinyint NOT NULL,
  descr text,
  url varchar(60) DEFAULT NULL,
  PRIMARY KEY (num),
  CONSTRAINT PROJEMPL FOREIGN KEY (empl) REFERENCES employee (username)
);
CREATE TABLE log (
ID int auto_increment,
Event varchar(50) NOT NULL,
Table_Target varchar (50) NOT NULL,
Date timestamp,
PRIMARY KEY (ID)
);
