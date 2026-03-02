--Retrieve a number of students who have a value in their age. 

select count(St_Age) [N of Students]
from dbo.Student 


--Get all instructors Names without repetition.

select distinct Ins_Name
from dbo.Instructor


--Display student with the following Format [Student ID-Student FullName-Department name]
--(use isNull function)
select s.St_Id [Student ID], 
isnull(s.St_Fname,'')+' '+isnull(s.St_Lname,'') [Student FullName], 
isnull(d.Dept_Name,'') [Department name]
from dbo.Student s left join dbo.Department d
on s.Dept_Id = d.Dept_Id


--Display instructor Name and Department Name.
--Note: display all the instructors if they are attached to a department or not.
select i.Ins_Name [instructor Name],
d.Dept_Name [Department name]
from dbo.Instructor i left join dbo.Department d
on i.Dept_Id = d.Dept_Id


--Display student full name and the name of the course he is taking For only courses which 
--have a grade.

select s.St_Fname +' '+ s.St_Lname [Student FullName], c.Crs_Name [Course name]
from Student s
join Stud_Course sc on s.St_Id = sc.St_Id
join Course c on sc.Crs_Id = c.Crs_Id
where sc.Grade is not null


--Display number of courses for each topic name

select t.Top_Name, count(c.Crs_Id) [Their number]
from Course c
join Topic t on c.Top_Id = t.Top_Id
group by t.Top_Name


--Display max and min salary for instructors

select MAX(Salary) [max salary], Min(Salary) [min salary]
from Instructor


--Display instructors who have salaries less than the average salary of all instructors.

select Ins_Name
from Instructor
where Salary < (select avg(Salary) from Instructor)


--Display the Department name that contains the instructor who receives the minimum salary.

SELECT i.Ins_Name, d.Dept_Name [Department name]
from Instructor i
join Department d on i.Dept_Id = d.Dept_Id
where Salary = (select MIN(Salary) from Instructor)


-- Select max two salaries in the instructor table. 

select distinct top (2) Salary
from Instructor
order by Salary desc


--Select instructor name & his salary but if there is no salary display instructor
--bonus keyword. “use coalesce Function”

select Ins_Name, 
coalesce(cast( Salary as varchar(30)),'instructor bonus')
from Instructor


--Select Average Salary for instructors 

select AVG(salary) 'AverageSalary'
from Instructor


--Select Student first name and the data of his supervisor 

select St_Fname, i.*
from Student s 
left join Instructor i on s.St_super = i.Ins_Id


--Write query to select the highest 2 salaries in Each Department for instructors who have 
--salaries. “using one of Ranking Functions”

select *
from (select *,
      DENSE_RANK() over (partition by Dept_id order by salary desc) as 'DR'
      from Instructor) as NewTable
where DR in (1,2)


-- Write query to select a random student from each department.“using one of Ranking Funcs”

select *
from (select *,
      row_number() over (partition by dept_id order by newid()) as 'RN'
      from Student) as NewTable
where RN=1










