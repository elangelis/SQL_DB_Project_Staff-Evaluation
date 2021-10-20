USE staffevaluation;

DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    username varchar(12) NOT NULL,
    pass varchar(10) NOT NULL,
    name varchar(25) NOT NULL,
    reg_date datetime,
    email varchar (30),
    PRIMARY KEY (username)
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

DROP TABLE IF EXISTS manager;
CREATE TABLE manager
(
    managerUsername varchar(12) NOT NULL,
    exp_years tinyint(4),
    firm char(9),
    PRIMARY KEY (managerUsername),
    CONSTRAINT USERID
    FOREIGN KEY (managerUsername)
    REFERENCES user(username),
    CONSTRAINT firmAFM
    FOREIGN KEY (firm)
    REFERENCES company(AFM)

);



DROP TABLE IF EXISTS evaluator;
CREATE TABLE evaluator
(
    username varchar(12) NOT NULL,
    exp_years tinyint(4),
    firm char(9),
    PRIMARY KEY (username),
     CONSTRAINT USERID1
    FOREIGN KEY (username)
    REFERENCES user(username),
    CONSTRAINT Afmetairias
    FOREIGN KEY (firm)
    REFERENCES company(AFM)

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
    CONSTRAINT USERID2
    FOREIGN KEY (username) REFERENCES user(username)

);

DROP TABLE IF EXISTS antikeim;
CREATE TABLE antikeim
(
    title varchar(36),
    descr tinytext,
    belongs_to varchar(36),
    PRIMARY KEY (title)
);


DROP TABLE IF EXISTS needs;
CREATE TABLE needs
(
     job_id int(4),
    antikeim_title varchar(36),
    
);

DROP TABLE IF EXISTS project;
CREATE TABLE project
(
    empl varchar(12),
    num tinyint(4),
    descr text,
    url varchar(60),

);

DROP TABLE IF EXISTS languages;
CREATE TABLE languages
(
    employee varchar(12),
    lang set("EN","FR","SP","GR"),

);


DROP TABLE IF EXISTS requestevaluation;
CREATE TABLE requestevaluation
(
    empl_username varchar(12),
    job_id int(4),

);

DROP TABLE IF EXISTS job;
CREATE TABLE job
(
    id int(4),
    start_date date,
    salary float(6,1),
    position varchar(40),
    edra varchar(45),
    evaluator varchar(12),
    announce_date datetime,
    submission_date date,

);

DROP TABLE IF EXISTS degree;
CREATE TABLE degree
(
    titlos varchar(50),
    idryma varchar(40),
    bathmida enum("LYKEIO","UNIV","MASTER","PHD"),

);

DROP TABLE IF EXISTS has_degree;
CREATE TABLE has_degree
(
    degr_title varchar(50),
    degr_idryma varchar(40),
    empl_username varchar(12),
    etos year(4),
    grade float (3,1)

);

DROP TABLE IF EXISTS evaluationresult;
CREATE TABLE evaluationresult
(
    Evld int(4),
    empl_username varchar(12),
    job_id int(4),
    grade int(4),
    comments varchar(255),

);