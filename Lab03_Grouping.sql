--Retrieve a list of employee’s names and the projects names they are working on ordered 
--by department num and within each department, ordered alphabetically by lname, fname.

select e.Fname+' '+e.Lname  [employee names], p.Pname [projects names]
from Employee e
join Works_for w on e.SSN = w.ESSn
join Project p on w.Pno = p.Pnumber
order by e.Dno, e.Lname asc, e.fname asc 


--By (Using Union Function)
 --The name and the gender of the dependence that's gender is Female and depending on 
 --Female Employee.And the male dependence that depends on Male Employee

 select d.Dependent_name, d.Sex
 from Dependent d
 join Employee e on d.ESSN = e.SSN
 where d.Sex= 'F' and e.Sex = 'F'
 union
 select d.Dependent_name, d.Sex
 from Dependent d
 join Employee e on d.ESSN = e.SSN
 where d.Sex= 'M' and e.Sex = 'M'


--For each project, list the project name and the total hours per week (for all employees) 
--spent on that project.

select p.Pname [project name],sum(w.Hours) [hours spent on that project]
from project p
left join Works_for w on p.Pnumber = w.Pno
group by p.Pname


--Display the data of the department which has the smallest employee ID over all employees'ID.

select d.*
from Departments d
join Employee e on d.Dnum = e.Dno
where e.SSN = (select min(SSN) from Employee)


--For each department, retrieve DepartmentName and the max, min & avg salary of its employees.

select d.Dname, max(e.Salary) [Max salary], min(e.Salary) [Min salary], AVG(e.Salary) [Avg salary]
from Employee e 
join Departments d on e.Dno = d.Dnum
group by d.Dname


--List the full name of all managers who have no dependents.

select e.Fname+' '+e.Lname [full name of manager]
from Employee e 
join Departments d on e.SSN =d.MGRSSN
left join Dependent dep on e.SSN = dep.ESSN
where dep.ESSN is null


--For each department if its avg salary is less than the avg salary of all employees, display 
--its number, name and number of its employees.	

select d.Dnum, d.Dname ,count(e.SSN) NumEmployees, avg(e.Salary) AvgDept,
(select avg(Salary) from Employee) AvgAll
from Employee e 
join Departments d on e.Dno = d.Dnum
group by d.Dnum, d.Dname
having (select avg(salary) from Employee) > avg(e.Salary)


--Try to get the max 2 salaries using sub query

select max(salary) TopSalary
from Employee
union 
select max(salary) 
from Employee
where salary < (select max(salary) from Employee)
order by 1 desc


--Display the employee number and name if at least one Get the full name of employees that is
--similar to any dependent name them have dependents (use exists keyword).

select e.SSN, e.Fname + ' ' + e.Lname [full name of employee]
from employee e
where exists (
      select 1
      from Dependent d
      where e.SSN = d.ESSN
      and d.Dependent_name like '%' +e.Fname + ' ' + e.Lname+ '%' )


--In the department table insert new department called "DEPT IT”, with id 100, employee with 
--SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'

insert into Departments 
values ('DEPT IT',100,112233,'2006-11-1')


--Do what is required if you know that: Mrs.Noha Mohamed(SSN=968574) moved to be the manager 
--of the new department (id = 100), and they give you(your SSN =102672) her position (Dept.20) 
--Update data of employee number=102660 to be in your teamwork (he will be supervised by you)

update Departments
set MGRSSN = 102672
where Dnum = 20

update Departments
set MGRSSN = 968574, [MGRStart Date] = '2006-11-1'
where Dnum = 100

update Employee
set Superssn = 102672
where SSN = 102660


--Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344) so try to
--delete his data from your DB in case you know that you will be temporarily in his position.
--Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any 
--employees or works in any projects and handle these cases).

select * from Employee where SSN = 223344
select * from Dependent where ESSN = 223344
select * from Departments where MGRSSN = 223344
select * from Employee where Superssn = 223344
select * from Works_for where ESSn = 223344

update Departments
set MGRSSN = 102672  where MGRSSN = 223344
update Employee 
set Superssn = 102672  where Superssn = 223344
update Works_for 
set ESSn = 102672  where ESSn = 223344

delete from Dependent  where essn = 223344
delete from Employee   where ssn = 223344   


--Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30%

update e  
set e.Salary = e.Salary*1.3
from Employee e
join Works_for w on e.SSN = w.ESSn
join Project p on w.Pno = p.Pnumber
where p.Pname = 'Al Rabwah' 
