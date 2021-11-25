USE staffevaluation;
/*______________________________________PARENT TABLES__________________________________*/
DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    username varchar(12) DEFAULT "unknown" NOT NULL,
    pass varchar(10) NOT NULL,
    name varchar(25) DEFAULT "unknown" NOT NULL,
    reg_date datetime DEFAULT NULL,
    email varchar (30) DEFAULT "unknown" NOT NULL,
    PRIMARY KEY (username),
    UNIQUE(email)
);

DROP TABLE IF EXISTS degree;
CREATE TABLE degree
(

    titlos varchar(50) NOT NULL,
    idryma varchar(40) NOT NULL,
    bathmida ENUM("LYKEIO","UNIV","MASTER","PHD") DEFAULT NULL,
    PRIMARY KEY (titlos),
    UNIQUE(idryma)
);



DROP TABLE IF EXISTS company;
CREATE TABLE company
(
    AFM char(9) NOT NULL,
    DOY varchar(15) NOT NULL,
    name varchar(35) DEFAULT NULL,
    phone bigint(16) DEFAULT NULL,
    street varchar(15) DEFAULT NULL,
    num tinyint(4) DEFAULT NULL,
    city varchar(15) DEFAULT NULL,
    country varchar(15) DEFAULT NULL,
    PRIMARY KEY (AFM)
);

DROP TABLE IF EXISTS antikeim;
CREATE TABLE antikeim
(
    title varchar(36) NOT NULL,
    descr tinytext DEFAULT NULL,
    belongs_to varchar(36) DEFAULT "no upper category",
    PRIMARY KEY (title)
);

/*_____________________________________CHILD TABLES___________________________________*/

DROP TABLE IF EXISTS manager;
CREATE TABLE manager
(
    managerUsername varchar(12) NOT NULL,
    exp_years tinyint(4) DEFAULT "0" NOT NULL,
    firm char(9) DEFAULT "0" NOT NULL,

    CONSTRAINT MNGRUSR                      
    FOREIGN KEY (managerUsername) REFERENCES user(username)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT FIRMAFM                      
    FOREIGN KEY (firm) REFERENCES company(AFM)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS evaluator;
CREATE TABLE evaluator
(
    username varchar(12) NOT NULL,
    exp_years tinyint(4) DEFAULT "0" NOT NULL,
    firm char(9) NOT NULL,

    CONSTRAINT EVLTRUSR                      
    FOREIGN KEY (username) REFERENCES user(username)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT FIRMAFM2                     
    FOREIGN KEY (firm) REFERENCES company(AFM)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    username varchar(12) NOT NULL,
    bio text DEFAULT NULL,
    sistatikes varchar(35) DEFAULT NULL,
    certificates varchar(35) DEFAULT NULL,
    awards varchar(35) DEFAULT NULL,

    CONSTRAINT EMPLUSR                      
    FOREIGN KEY (username) REFERENCES user(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS job;
CREATE TABLE job
(
    id int(4) NOT NULL,
    start_date date DEFAULT NULL,
    salary float(6,1) DEFAULT NULL,
    position varchar(40) DEFAULT NULL,
    edra varchar(45) DEFAULT NULL,
    evaluator varchar(12) DEFAULT NULL,
    announce_date datetime DEFAULT NULL,
    submission_date date DEFAULT NULL,
    PRIMARY KEY(id),

    CONSTRAINT WHICHEVL 
    FOREIGN KEY (evaluator) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS needs;
CREATE TABLE needs
(
     job_id int(4) NOT NULL,
    antikeim_title varchar(36) NOT NULL,

    CONSTRAINT NDSANTIK
    FOREIGN KEY(antikeim_title) REFERENCES antikeim(title)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT JOBNEEDS
    FOREIGN KEY(job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS project;
CREATE TABLE project
(
    empl varchar(12)NOT NULL,
    num tinyint(4) AUTO_INCREMENT,
    descr text DEFAULT "no entry yet",
    url varchar(60) NOT NULL,
    PRIMARY KEY(num),
    UNIQUE (url),

    CONSTRAINT PROJEMPL
    FOREIGN KEY(empl) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS languages;
CREATE TABLE languages
(
    employee varchar(12)NOT NULL,
    lang set("EN","FR","SP","GR") NOT NULL,
    PRIMARY KEY(employee),

    CONSTRAINT LANGEMPL
    FOREIGN KEY(employee) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS requestevaluation;
CREATE TABLE requestevaluation
(
    empl_username varchar(12)NOT NULL,
    job_id int(4)NOT NULL,
    EvID int NOT NULL,
    PRIMARY KEY (EvID),

    CONSTRAINT EMPLRQSTSEVAL
    FOREIGN KEY(empl_username) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT FORJOB
    FOREIGN KEY (job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE
    
);

DROP TABLE IF EXISTS evaluationphases;
CREATE TABLE evaluationphases
(
    EvID int (4),
    phase1 int (4),
    phase2 int (4),
    phase3 int (4),
    
    FOREIGN KEY (EvID) REFERENCES requestevaluation(EvID)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CHECK ((phase1>=0) AND (phase1<=4) AND (phase2>=0) AND (phase2<=4) AND (phase3>=0) AND (phase3<=2))

);

DROP TABLE IF EXISTS evaluationresult;
CREATE TABLE evaluationresult
(
    EvId int(4) NOT NULL,
    empl_username varchar(12) NOT NULL,
    job_id int(4) NOT NULL,
    grade int(4) DEFAULT NULL,
    comments varchar(255) DEFAULT "no entry yet",
    evaluator varchar(15) DEFAULT NULL,

    CONSTRAINT EVALUATOR 
    FOREIGN KEY (evaluator) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT WHICHEVID 
    FOREIGN KEY (EvId) REFERENCES requestevaluation (EvID)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT WHCHJOB
    FOREIGN KEY (job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    
    CONSTRAINT WHCHEMPL
    FOREIGN KEY (empl_username) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);


DROP TABLE IF EXISTS has_degree;
CREATE TABLE has_degree 
(
    degr_title varchar(50) DEFAULT NULL,
    degr_idryma varchar(40) DEFAULT NULL,
    empl_usrname varchar(12) DEFAULT NULL,
    etos year DEFAULT NULL,
    grade float (3,1) DEFAULT NULL,

    CONSTRAINT WHCHDEGREE
    FOREIGN KEY (degr_title) REFERENCES degree(titlos)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT WHRDEGREE
    FOREIGN KEY (degr_idryma) REFERENCES degree(idryma)
    ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT WHCHEMPL4
    FOREIGN KEY (empl_usrname) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS administrator;
CREATE TABLE administrator
(
    administrator_username varchar(12) NOT NULL,
    privilegies set("YES","NO"),
    PRIMARY KEY(administrator_username),
    
    CONSTRAINT ADMNUSR
    FOREIGN KEY (administrator_username) REFERENCES user(username)
    ON UPDATE CASCADE ON DELETE CASCADE

);

DROP TABLE IF EXISTS log;
CREATE TABLE log
(
    user varchar(12),
    change_id VARCHAR(12),
    type_of_change VARCHAR(12),
    table_of_change varchar(12),
    day_of_change DATE,
    time_of_change TIMESTAMP,
    success set("yes","no"),
    details varchar(40),
    PRIMARY KEY change_id,

    CONSTRAINT WHICHUSR2
    FOREIGN KEY user REFERENCES user(username)

);
