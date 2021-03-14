-- TABLE
CREATE TABLE DEPARTMENT (
    Dname               VARCHAR(15)             NOT NULL,
    Dnumber             INTEGER                 NOT NULL,
    Mgr_ssn             CHAR(9)                 NOT NULL DEFAULT '888665555',
    Mgr_start_date      DATE,

    CONSTRAINT DEPTPK
        PRIMARY KEY(Dnumber),
    CONSTRAINT DEPTSK
        UNIQUE(Dname),
    CONSTRAINT DEPTMGRFK
        FOREIGN KEY(Mgr_ssn) REFERENCES EMPLOYEE(Ssn)
                        ON DELETE SET DEFAULT
                        ON UPDATE CASCADE
);
CREATE TABLE DEPENDENT (
    Essn                CHAR(9)                 NOT NULL,
    Dependent_name      VARCHAR(15)             NOT NULL,
    Sex                 CHAR,
    Bdate               DATE,
    Relationship        VARCHAR(8),

    PRIMARY KEY(Essn, Dependent_name),
    CONSTRAINT DEPENDEMPFK FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE DEPT_LOCATIONS (
    Dnumber             INTEGER                 NOT NULL,
    Dlocation           VARCHAR(15)             NOT NULL,

    PRIMARY KEY(Dnumber, Dlocation),
    FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT(Dnumber)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE
);
CREATE TABLE EMPLOYEE (
    Fname               VARCHAR(15)             NOT NULL,
    Minit               CHAR,
    Lname               VARCHAR(15)             NOT NULL,
    Ssn                 CHAR(9)                 NOT NULL,
    Bdate               DATE,
    Address             VARCHAR(30),
    Sex                 CHAR,
    Salary              DECIMAL(10,2),
    Super_ssn           CHAR(9),
    Dno                 INTEGER                 NOT NULL DEFAULT 1,

    CONSTRAINT EMPPK
        PRIMARY KEY(Ssn),
    CONSTRAINT EMPSUPERFK
        FOREIGN KEY(Super_ssn) REFERENCES EMPLOYEE(Ssn)
                      ON DELETE SET NULL
                      ON UPDATE CASCADE,
    CONSTRAINT EMPDEPTFK
        FOREIGN KEY(Dno) REFERENCES DEPARTMENT(Dnumber)
                      ON DELETE SET DEFAULT
                      ON UPDATE CASCADE
);
CREATE TABLE PROJECT (
    Pname               VARCHAR(15)             NOT NULL,
    Pnumber             INTEGER                 NOT NULL,
    Plocation           VARCHAR(15),
    Dnum                INTEGER                 NOT NULL,

    CONSTRAINT PROJPK PRIMARY KEY(Pnumber),
    CONSTRAINT PROJSK UNIQUE(Pname),
    CONSTRAINT PROJDEPTFK FOREIGN KEY(Dnum) REFERENCES DEPARTMENT(Dnumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE WORKS_ON (
    Essn                CHAR(9)                 NOT NULL,
    Pno                 INTEGER                 NOT NULL,
    Hours               DECIMAL(3,1),

    PRIMARY KEY(Essn, Pno),
    CONSTRAINT WORKSEMPFK FOREIGN KEY(Essn) REFERENCES EMPLOYEE(Ssn)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT WORKSPROJFK FOREIGN KEY(Pno) REFERENCES PROJECT(Pnumber)
        ON DELETE CASCADE ON UPDATE CASCADE
);
 
-- INDEX
 
-- TRIGGER
 
-- VIEW
 
