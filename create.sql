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
    titlos varchar(50),
    idryma varchar(40),
    bathmida ENUM("LYKEIO","UNIV","MASTER","PHD"),
    PRIMARY KEY (titlos,idryma)
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
    PRIMARY KEY(id)
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
    title varchar(36),
    descr tinytext,
    belongs_to varchar(36),
    PRIMARY KEY (title,belongs_to)
);

/*_____________________________________CHILD TABLES___________________________________*/

DROP TABLE IF EXISTS manager;
CREATE TABLE manager
(
    managerUsername varchar(12) NOT NULL,
    exp_years tinyint(4) DEFAULT "0" NOT NULL,
    firm char(9) DEFAULT "0" NOT NULL,
    PRIMARY KEY (managerUsername),

    CONSTRAINT MNGRUSR                      
    FOREIGN KEY (managerUsername) REFERENCES user(username)
    ,

    CONSTRAINT FIRMAFM                      
    FOREIGN KEY (firm) REFERENCES company(AFM)
    
);

DROP TABLE IF EXISTS evaluator;
CREATE TABLE evaluator
(
    username varchar(12) NOT NULL,
    exp_years tinyint(4) DEFAULT "0" NOT NULL,
    firm char(9),
    PRIMARY KEY (username),

    CONSTRAINT EVLTRUSR                      
    FOREIGN KEY (username) REFERENCES user(username)
    ,

    CONSTRAINT FIRMAFM2                     
    FOREIGN KEY (firm) REFERENCES company(AFM) 
    
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    username varchar(12),
    bio text,
    sistatikes varchar(35),
    certificates varchar(35),
    awards varchar(35),
    PRIMARY KEY (username),

    CONSTRAINT EMPLUSR                      
    FOREIGN KEY (username) REFERENCES user(username)
    
);

DROP TABLE IF EXISTS needs;
CREATE TABLE needs
(
     job_id int(4),
    antikeim_title varchar(36),
    PRIMARY KEY(job_id,antikeim_title),

    CONSTRAINT NDSANTIK
    FOREIGN KEY(antikeim_title) REFERENCES antikeim(title),

    CONSTRAINT JOBNEEDS
    FOREIGN KEY(job_id) REFERENCES job(id)

);

DROP TABLE IF EXISTS project;
CREATE TABLE project
(
    empl varchar(12),
    num tinyint(4),
    descr text,
    url varchar(60),
    PRIMARY KEY(empl,num),

    CONSTRAINT PROJEMPL
    FOREIGN KEY(empl) REFERENCES employee(username)

);

DROP TABLE IF EXISTS languages;
CREATE TABLE languages
(
    employee varchar(12),
    lang set("EN","FR","SP","GR"),
    PRIMARY KEY(employee,lang),

    CONSTRAINT LANGEMPL
    FOREIGN KEY(employee) REFERENCES employee(username)

);

DROP TABLE IF EXISTS requestevaluation;
CREATE TABLE requestevaluation
(
    empl_username varchar(12),
    job_id int(4),
    PRIMARY KEY(empl_username,job_id),
    
    CONSTRAINT EMPLRQSTSEVAL
    FOREIGN KEY(empl_username) REFERENCES employee(username),

    CONSTRAINT FORJOB
    FOREIGN KEY (job_id) REFERENCES job(id)
    
);

DROP TABLE IF EXISTS has_degree;
CREATE TABLE has_degree 
(
    degr_title varchar(50),
    degr_idryma varchar(40),
    empl_usrname varchar(12),
    etos year,
    grade float (3,1),
    PRIMARY KEY(degr_title,degr_idryma,empl_usrname),

    CONSTRAINT WHCHDEGREE
    FOREIGN KEY (degr_title) REFERENCES degree(titlos),

    CONSTRAINT WHRDEGREE
    FOREIGN KEY (degr_idryma) REFERENCES degree(idryma),

    CONSTRAINT WHCHEMPL
    FOREIGN KEY (empl_usrname) REFERENCES employee(username)
);
   
   
DROP TABLE IF EXISTS evaluationresult;
CREATE TABLE evaluationresult
(
    Evld int(4),
    empl_username varchar(12)NOT NULL,
    job_id int(4),
    grade int(4),
    comments varchar(255),
    PRIMARY KEY(Evld,empl_username),

    CONSTRAINT WHCHJOB
    FOREIGN KEY (job_id) REFERENCES job(id),
    
    CONSTRAINT WHCHEMPL
    FOREIGN KEY (Evld) REFERENCES employee(username)
);

    
