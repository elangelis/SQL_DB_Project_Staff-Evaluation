USE staffevaluation;
/*______________________________________PARENT TABLES__________________________________*/
DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    username varchar(12) DEFAULT "unknown" NOT NULL,
    pass varchar(10) NOT NULL,
    name varchar(25) DEFAULT "unknown" NOT NULL,
    reg_date datetime,
    email varchar (30)DEFAULT "unknown" NOT NULL,
    PRIMARY KEY (username),
    UNIQUE(email)
);

DROP TABLE IF EXISTS degree;
CREATE TABLE degree
(

    titlos varchar(50) NOT NULL,
    idryma varchar(40) NOT NULL,
    bathmida ENUM("LYKEIO","UNIV","MASTER","PHD"),
    PRIMARY KEY (titlos),
    UNIQUE(idryma)
);

DROP TABLE IF EXISTS job;
CREATE TABLE job
(
    id int(4) NOT NULL,
    start_date date,
    salary float(6,1),
    position varchar(40),
    edra varchar(45),
    evaluator varchar(12),
    announce_date datetime,
    submission_date date,
    PRIMARY KEY(id),

    CONSTRAINT WHICHEVL 
    FOREIGN KEY (evaluator) REFERENCES evaluator(username)   
);

DROP TABLE IF EXISTS company;
CREATE TABLE company
(
    AFM char(9) NOT NULL,
    DOY varchar(15),
    name varchar(35),
    phone bigint(16),
    street varchar(15),
    num tinyint(4),
    city varchar(15),
    country varchar(15),
    PRIMARY KEY (AFM)
);

DROP TABLE IF EXISTS antikeim;
CREATE TABLE antikeim
(
    title varchar(36) NOT NULL,
    descr tinytext,
    belongs_to varchar(36) NOT NULL,
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
    FOREIGN KEY (managerUsername) REFERENCES user(username),

    CONSTRAINT FIRMAFM                      
    FOREIGN KEY (firm) REFERENCES company(AFM)

);

DROP TABLE IF EXISTS evaluator;
CREATE TABLE evaluator
(
    username varchar(12) NOT NULL,
    exp_years tinyint(4) DEFAULT "0" NOT NULL,
    firm char(9) NOT NULL,

    CONSTRAINT EVLTRUSR                      
    FOREIGN KEY (username) REFERENCES user(username),

    CONSTRAINT FIRMAFM2                     
    FOREIGN KEY (firm) REFERENCES company(AFM) 

);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    username varchar(12) NOT NULL,
    bio text,
    sistatikes varchar(35),
    certificates varchar(35),
    awards varchar(35),

    CONSTRAINT EMPLUSR                      
    FOREIGN KEY (username) REFERENCES user(username)
    
);

DROP TABLE IF EXISTS needs;
CREATE TABLE needs
(
     job_id int(4) NOT NULL,
    antikeim_title varchar(36) NOT NULL,

    CONSTRAINT NDSANTIK
    FOREIGN KEY(antikeim_title) REFERENCES antikeim(title),

    CONSTRAINT JOBNEEDS
    FOREIGN KEY(job_id) REFERENCES job(id)

);

DROP TABLE IF EXISTS project;
CREATE TABLE project
(
    empl varchar(12)NOT NULL,
    num tinyint(4)NOT NULL,
    descr text,
    url varchar(60),
    PRIMARY KEY(num),

    CONSTRAINT PROJEMPL
    FOREIGN KEY(empl) REFERENCES employee(username)

);

DROP TABLE IF EXISTS languages;
CREATE TABLE languages
(
    employee varchar(12)NOT NULL,
    lang set("EN","FR","SP","GR"),
    PRIMARY KEY(lang),

    CONSTRAINT LANGEMPL
    FOREIGN KEY(employee) REFERENCES employee(username)

);

DROP TABLE IF EXISTS requestevaluation;
CREATE TABLE requestevaluation
(
    empl_username varchar(12)NOT NULL,
    job_id int(4)NOT NULL,

    CONSTRAINT EMPLRQSTSEVAL
    FOREIGN KEY(empl_username) REFERENCES employee(username),

    CONSTRAINT FORJOB
    FOREIGN KEY (job_id) REFERENCES job(id)
    
);

DROP TABLE IF EXISTS evaluationresult;
CREATE TABLE evaluationresult
(
    Evlid int(4) NOT NULL,
    empl_username varchar(12)NOT NULL,
    job_id int(4)NOT NULL,
    grade int(4),
    comments varchar(255),

    CONSTRAINT WHCHJOB
    FOREIGN KEY (job_id) REFERENCES job(id),
    
    CONSTRAINT WHCHEMPL
    FOREIGN KEY (empl_username) REFERENCES employee(username)
);


DROP TABLE IF EXISTS has_degree;
CREATE TABLE has_degree 
(
    degr_title varchar(50),
    degr_idryma varchar(40),
    empl_usrname varchar(12),
    etos year,
    grade float (3,1),

    CONSTRAINT WHCHDEGREE
    FOREIGN KEY (degr_title) REFERENCES degree(titlos),

    CONSTRAINT WHRDEGREE
    FOREIGN KEY (degr_idryma) REFERENCES degree(idryma),

    CONSTRAINT WHCHEMPL2
    FOREIGN KEY (empl_usrname) REFERENCES employee(username)
);

DROP TABLE IF EXISTS administrator;
CREATE TABLE admininstrator
(
    administrator_username varchar(12),
    




)