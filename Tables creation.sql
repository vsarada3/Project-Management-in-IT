CREATE TABLE projects_table (
    project_id int
    CONSTRAINT projects_tid_pk PRIMARY KEY,
    client_id int not null, 
    project_name varchar2(100),
    project_start_date date,
    project_end_date date,
    project_status char(15)
);

drop table projects_table;

CREATE TABLE clients_table (
    client_id int
    CONSTRAINT clients_tid_pk PRIMARY KEY,
    client_name varchar(20) NOT NULL, 
    client_location_id char(2)
);

drop table clients_table;


CREATE TABLE DEPARTMENTS_TABLE (
    department_id int
    CONSTRAINT departments_tpk PRIMARY KEY,
    department_name varchar2(20),
    location_id int 
    constraint departments_loc_fk REFERENCES locations_table(location_id)
    );
    
create table employee_table
(
Employee_ID int
CONSTRAINT employees_tpk PRIMARY KEY,
First_name varchar2(20) NOT NULL,
Last_name varchar2(20) NOT NULL,
phone_number char(10),
employee_email varchar2(40),
Hire_date date NOT NULL,
Termination_date date,
Salary int,
manager_ID int NOT NULL,
department_ID int,
location_ID int,
CONSTRAINT employees_pn_uk UNIQUE(phone_number)
);

create table manager_table
(
Manager_ID int
CONSTRAINT manager_tpk PRIMARY KEY,
first_Name varchar2(20) NOT NULL,
last_name varchar2(20) NOT NULL,
manager_phonenumber char(10),
manager_email varchar2(40),
manager_salary int,
dept_ID int,
position_ID int,
location_id int,
hire_date date NOT NULL,
Termination_Date date,
CONSTRAINT manager_pn_uk UNIQUE(manager_phonenumber)
);

CREATE TABLE project_employees_table (
    project_emp_id int,
    employee_emp_id int
);

alter table project_employees_table
add constraint proj_emp_tpk primary key (project_emp_id,employee_emp_id);

ALTER TABLE project_employees_table
ADD CONSTRAINT proj_emp_tfk1
FOREIGN KEY (project_emp_id)
REFERENCES projects_table(project_id);

ALTER TABLE project_employees_table
ADD CONSTRAINT proj_emp_tfk2
FOREIGN KEY (employee_emp_id)
REFERENCES employee_table(employee_id);

CREATE TABLE LOCATIONS_TABLE (
    location_id int
    CONSTRAINT locations_tid_pk PRIMARY KEY,
    location_name char(2)
);

drop table LOCATIONS_TABLE;