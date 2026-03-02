--Display the Department id, name and id and the name of its manager.

select d.Dnum, d.Dname , e.Superssn, Fname+' '+Lname manager_name
from Employee e
join Departments d  
on e.SSN = d.MGRSSN
 

--Display the name of the departments and the name of the projects under its control.

select d.Dnum, p.Pname
from Departments d
join Project p
on d.Dnum = p.Dnum


--Display the full data about all the dependence associated with the name of the employee they
--depend on him/her.

select Fname+' '+Lname  full_name,
d.*
from Employee e
join Dependent d
on e.SSN = d.ESSN


--Display the Id, name and location of the projects in Cairo or Alex city.

select Pnumber, Pname, Plocation 
from  Project 
where Plocation like '%Cairo%'
or Plocation  like '%Alex%'


--Display the Projects full data of the projects with a name starts with "a" letter.

select * 
from  Project 
where Pname like 'a%'


--display all the employees in department 30 whose salary from 1000 to 2000 LE monthly

select Fname+' '+Lname  full_name
from Employee
where Dno = 30
and Salary between 1000 and 2000


--Retrieve the names of all employees in department 10 who works more than or equal10 hours
--per week on "AL Rabwah" project.

select Fname+' '+Lname  full_name
from Employee e
join works_for w
on e.SSN = w.ESSn
join Project p
on w.Pno = p.Pnumber
where Dno = 10
and Hours >= 10
and Pname = 'AL Rabwah'


--Find the names of the employees who directly supervised with Kamel Mohamed.

select y.Fname+' '+y.Lname  full_name
from Employee x
join Employee y
on x.SSN = y.Superssn
where x.Fname = 'Kamel'
and x.Lname = 'Mohamed'



--Retrieve the names of all employees and the names of the projects they are working on,
--sorted by the project name.

select e.Fname+' '+ e.Lname as full_name,
p.Pname as projects
from Employee e 
join Works_for w
on e.SSN = w.ESSn
join Project p
on p.Pnumber = w.Pno
order by p.Pname


--For each project located in Cairo City , find the project number, the controlling department
--name ,the department manager last name ,address and birthdate.

select p.Pnumber [project number], d.Dname [controlling department name], 
e.Lname [department manager last name], e.Address, e.Bdate
from Employee e 
join Departments d
on e.SSN = d.MGRSSN
join Project p
on p.Dnum = d.Dnum
where p.City like 'Cairo'


--Display All Data of the managers

select distinct x.*
from employee x
join employee y 
on x.SSN = y.Superssn


--Display All Employees data and the data of their dependents even if they have no dependents

select e.*, d.*
from Employee e
full join Dependent d
on e.SSN = d.ESSN


--Insert your personal data to the employee table as a new employee in department number 30,
--SSN = 102672, Superssn = 112233, salary=3000.

insert into Employee 
values ('Doaa', 'Hilal', 102672, '2004/8/28', 'Alex, Egypt', 'F', 3000, 112233,30)


--Insert another employee with personal data your friend as new employee in department num 30,
--SSN = 102660, but don’t enter any value for salary or supervisor number to him.

insert into Employee 
values ('Mai', 'Mohamed', 102660, '2004/5/16', 'Alex, Egypt', 'F', NULL, NULL,30)


--Upgrade your salary by 20 % of its last value.

update Employee
set Salary = Salary*1.20
where SSN = 102672