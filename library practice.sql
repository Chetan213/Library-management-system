SELECT * FROM members;
SELECT * FROM branch;
SELECT * FROM employees;
select * from books;
SELECT * FROM issued_status;
SELECT * FROM return_status;

--1.Show member names and registration dates only.
select member_name,reg_date from members;
--2.List all branches with their contact numbers.
select branch_id,contact_no from branch;
--3.Display all employees working in branch B001
select *from employees where branch_id ='B001'; 
--4.Show all books that are currently available (status = 'yes').
select * from books where status ='yes';
--5.Find members who registered after 1st Jan 2022.
select * from members where reg_date>'2022-01-01';
--6.Display employees whose salary is greater than 50,000.
select * from employees where salary>'50000';
--7.Show all books belonging to the History category.
select * from books where category='History';
--8.List books with rental price between 5 and 7.
select * from books where rental_price between 5 and 7;
--9.Display employees ordered by salary (highest to lowest).
select emp_id,emp_name,salary from employees order by  salary desc;
--10.Count total number of members.
select count(*) from members;
--11.Find the average salary of employees.
select round(avg(salary),2) from employees;
--12.Find the maximum rental price of books.
select max(rental_price) from books;
--13.Count how many books are available (status = 'yes').
select count(*) from books where status='yes';
--14.Find total number of books in each category.
select category, count (*) AS total_books from books group by category;
--15.Display issued books along with member name.
select i.issued_book_name,m.member_name 
from issued_status i join members m
on i.issued_member_id=m.member_id;
--16.Show issued book title, member name, and issue date.
select i.issued_book_name,m.member_name,i.issued_date
from issued_status i
join members m
on i.issued_member_id=m.member_id;
--17.Find which employee issued “Animal Farm”.
SELECT e.emp_name FROM issued_status i
JOIN employees e 
ON i.issued_emp_id = e.emp_id
WHERE i.issued_book_name = 'Animal Farm';
--18.Display member name, book name, and employee name for all issued books
select m.member_name,i.issued_book_name,e.emp_name
from issued_status i
join members m on i.issued_member_id=m.member_id
join employees e on i.issued_emp_id=e.emp_id;
--19.Employee name with branch address
select e.emp_name, b.branch_address
from employees e
join branch b
on e.branch_id=b.branch_id;
--20.Find members who have issued more than one book.
SELECT m.member_name, COUNT(*) AS total_issued
FROM issued_status i
JOIN members m ON i.issued_member_id = m.member_id
GROUP BY m.member_name
HAVING COUNT(*) > 1;
--21.Find employees whose salary is higher than the average salary.
select * from employees where salary>(select avg(salary) from employees);
--22.Find books that were never issued.
SELECT * FROM books
WHERE isbn NOT IN (
SELECT issued_book_isbn FROM issued_status);
--23.Find members who have not returned their issued books.
select * from issued_status
where issued_id not in
(select issued_id from return_status);
--24.Find the employee who issued the maximum number of books.
select issued_emp_id, count(*)
from issued_status group by issued_emp_id
order by count(*)desc limit 1 ;
--25.Show number of books issued by each member.
select issued_member_id,count(*)
from issued_status
group by issued_member_id;
--26.Display employees who issued more than 3 books.
SELECT e.emp_name, COUNT(*) AS total_issued
FROM issued_status i
JOIN employees e ON i.issued_emp_id = e.emp_id
GROUP BY e.emp_name
HAVING COUNT(*) > 3;
--27.Find category-wise count of issued books.
SELECT b.category, COUNT(*) 
FROM issued_status i
JOIN books b 
ON i.issued_book_isbn = b.isbn
GROUP BY b.category;
--28.Show branches having more than 2 employees.
select branch_id,count(*)
from employees
group by branch_id
having count(*)>2;
--29.Find members who issued books in March 2024 only.
select distinct issued_member_id
from issued_status
where issued_date between '2024-03-01' and '2024-03-31';
--30.Find books issued but not yet returned.
select * from issued_status
where issued_id not in(select issued_id from return_status);
--31.Calculate how many days each book was kept before return.
SELECT i.issued_id,r.return_date - i.issued_date AS days_kept
FROM issued_status i
JOIN return_status r 
ON i.issued_id = r.issued_id;
--32.Show late returns (books returned after 30 days).
SELECT i.issued_id FROM issued_status i
JOIN return_status r 
ON i.issued_id = r.issued_id
WHERE r.return_date - i.issued_date >30;
--33.Display books issued in April 2024.
select * from issued_status
where issued_date between '2024-04-01' and '2024-04-30';
--34.Find members who issued books from History category.
SELECT DISTINCT m.member_name
FROM issued_status i
JOIN books b ON i.issued_book_isbn = b.isbn
JOIN members m ON i.issued_member_id = m.member_id
WHERE b.category = 'History';
--35. Find the most popular book (issued maximum times).
SELECT issued_book_name, COUNT(*) 
FROM issued_status
GROUP BY issued_book_name
ORDER BY COUNT(*) DESC
LIMIT 1;
--36.Find the most active member (highest issues).
SELECT issued_member_id, COUNT(*) 
FROM issued_status
GROUP BY issued_member_id
ORDER BY COUNT(*) DESC
LIMIT 1;
--37.Find the top 3 employees who issued the most books.
SELECT issued_emp_id, COUNT(*) 
FROM issued_status
GROUP BY issued_emp_id
ORDER BY COUNT(*) DESC
LIMIT 3;
--38.Find members who issued books from more than 3 categories.
SELECT i.issued_member_id
FROM issued_status i
JOIN books b ON i.issued_book_isbn = b.isbn
GROUP BY i.issued_member_id
HAVING COUNT(DISTINCT b.category) > 3;
--39.Show branch-wise total book issues..
SELECT e.branch_id, COUNT(*) 
FROM issued_status i
JOIN employees e ON i.issued_emp_id = e.emp_id
GROUP BY e.branch_id;

--End of Project;
