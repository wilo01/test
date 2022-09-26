-- Using the below tables, write an sql query to bring department description 
-- that has the biggest salary costs 

-- create a table
CREATE TABLE km_person (
  person_id number PRIMARY KEY,
  person_name varchar2 NOT NULL,
  departament_id varchar2 NOT NULL
);

CREATE TABLE km_departament (
  departament_id varchar2 PRIMARY KEY,
  departament_description varchar2 NOT NULL
);

CREATE TABLE km_salaries (
  person_id number PRIMARY KEY,
  salary number NOT NULL
);
-- insert some values
INSERT INTO km_person VALUES (1, 'John Rerilly', 'A');
INSERT INTO km_person VALUES (2, 'Peter Jones', 'A');
INSERT INTO km_person VALUES (3, 'Alan Johnson', 'B');
INSERT INTO km_person VALUES (4, 'Henry Kelly', 'C');
INSERT INTO km_person VALUES (5, 'Patrick Williams', 'D');

INSERT INTO km_departament VALUES ('A', 'Sales');
INSERT INTO km_departament VALUES ('B', 'IT');
INSERT INTO km_departament VALUES ('C', 'Management');
INSERT INTO km_departament VALUES ('D', 'HR');

INSERT INTO km_salaries VALUES (1, '17000');
INSERT INTO km_salaries VALUES (2, '18000');
INSERT INTO km_salaries VALUES (3, '19000');
INSERT INTO km_salaries VALUES (4, '25000');
INSERT INTO km_salaries VALUES (5, '24000');

-- fetch some values
-- Select * from km_person;
-- Select * from km_departament;
-- Select * from km_salaries;
select * 
from km_person as a
left join km_departament as b on a.departament_id = b.departament_id
left join km_salaries as c on a.person_id = c.person_id;

select departament_description, sum(salary) as Salary
from km_person as a
left join km_departament as b on a.departament_id = b.departament_id
left join km_salaries as c on a.person_id = c.person_id
group by departament_description
order by salary desc;


select departament_description, salary
from km_person as a
left join km_departament as b on a.departament_id = b.departament_id
left join km_salaries as c on a.person_id = c.person_id
order by salary desc;

select top 1 departament_description, sum(salary) as Salary
from km_person as a
left join km_departament as b on a.departament_id = b.departament_id
left join km_salaries as c on a.person_id = c.person_id
group by departament_description
order by salary desc;
