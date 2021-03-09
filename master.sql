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

CREATE TABLE DEPT_LOCATIONS (
    Dnumber             INTEGER                 NOT NULL,
    Dlocation           VARCHAR(15)             NOT NULL,

    PRIMARY KEY(Dnumber, Dlocation),
    FOREIGN KEY(Dnumber) REFERENCES DEPARTMENT(Dnumber)
                        ON DELETE CASCADE
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

insert into DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
values  ('Headquarters', 1, '888665555', '1981-06-19'),
        ('Administration', 4, '987654321', '1995-01-01'),
        ('Research', 5, '333445555', '1988-05-22');
		
insert into DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
values  ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
        ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
        ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
        ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
        ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
        ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
        ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');
		
insert into DEPT_LOCATIONS (Dnumber, Dlocation)
values  (1, 'Houston'),
        (4, 'Stratford'),
        (5, 'Bellaire'),
        (5, 'Sugarland'),
        (5, 'Houston');
		
insert into EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
values  ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5),
        ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5),
        ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4),
        ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4),
        ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', 38000.00, '333445555', 5),
        ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5),
        ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '987654321', 4),
        ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, null, 1);
		
insert into PROJECT (Pname, Pnumber, Plocation, Dnum)
values  ('ProductX', 1, 'Bellaire', 5),
        ('ProductY', 2, 'Sugarland', 5),
        ('ProductZ', 3, 'Houston', 5),
        ('Computerization', 10, 'Stafford', 4),
        ('Reorganization', 20, 'Houston', 1),
        ('Newbenefits', 30, 'Stafford', 4);
		
insert into WORKS_ON (Essn, Pno, Hours)
values  ('123456789', 1, 32.5),
        ('123456789', 2, 7.5),
        ('666884444', 3, 40.0),
        ('453453453', 1, 20.0),
        ('453453453', 2, 20.0),
        ('333445555', 2, 10.0),
        ('333445555', 3, 10.0),
        ('333445555', 10, 10.0),
        ('333445555', 20, 10.0),
        ('999887777', 30, 30.0),
        ('999887777', 10, 10.0),
        ('987987987', 30, 5.0),
        ('987987987', 10, 35.0),
        ('987654321', 30, 20.0),
        ('987654321', 20, 15.0),
        ('888665555', 20, null);