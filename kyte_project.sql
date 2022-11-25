/* Creating all tables*/

CREATE TABLE company (
	brID int NOT NULL,
    brName varchar(50) NOT NULL,
    PRIMARY KEY(brID)
);

CREATE TABLE employees (
	empID int NOT NULL,
    ssn int,
    firstName varchar(50),
    lastName varchar(50),
    ph_No varchar(12) NOT NULL,
    dob varchar(50),
    email varchar(50),
    brID int,
    PRIMARY KEY(empID),
    FOREIGN KEY(brID) REFERENCES company(brID)
);
CREATE TABLE admin (
	empID int NOT NULL,
    posit varchar(50) NOT NULL,
    FOREIGN KEY(empID) REFERENCES employees(empID),
	PRIMARY KEY(empID)		
);

CREATE TABLE driver (
	empID int NOT NULL,
    role varchar(50),
    dr_license varchar(50),
    FOREIGN KEY(empID) REFERENCES employees(empID),
	PRIMARY KEY(empID)	
);

CREATE TABLE custcare (
	empID int NOT NULL,
    posit varchar(50) NOT NULL,
    FOREIGN KEY(empID) REFERENCES employees(empID),
	PRIMARY KEY(empID)		
);

CREATE TABLE branch (
	brID int NOT NULL,
    mngID int,
    street varchar(50),
    city varchar(50),
    state varchar(50),
    zipcode int,
    contact_no varchar(12),
    FOREIGN KEY(brID) REFERENCES company(brID),
	PRIMARY KEY(brID),
    FOREIGN KEY(mngID) REFERENCES employees(empID)
);

CREATE TABLE car (
    carID int NOT NULL,
    brID int NOT NULL,
    brand varchar(50),
    model varchar(50),
    seats int,
    mileage int,
    gear_system varchar(50),
    engine_type varchar(50),
    years_old int,
    PRIMARY KEY(carID),
    FOREIGN KEY(brID) REFERENCES company(brID)    
);

CREATE TABLE customer (
    custID int NOT NULL,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(50),
    dob varchar(50),
    ph_No varchar(12) NOT NULL,
    dr_license varchar(12),
    PRIMARY KEY(custID)
);

CREATE TABLE booking (
	custID int NOT NULL,
    brID int NOT NULL,
    carID int NOT NULL,
    pick_up varchar(50) NOT NULL,
    drop_off varchar(50) NOT NULL,
    price int NOT NULL,
    start_time varchar(50),
    end_time varchar(50),
    FOREIGN KEY(custID) REFERENCES customer(custID),
    FOREIGN KEY(brID) REFERENCES company(brID),
    FOREIGN KEY(carID) REFERENCES car(carID)
);

/* ##################################################################################### */
/* Inserting values into tables*/

/* ##################################################################################### */
/* Checking if the data has been inserted */
select * from company;
select * from branch;
select * from employees;
select * from admin;
select * from driver;
select * from custcare;
select * from customer;
select * from car;
select * from booking;

/* ##################################################################################### */
/* Queries */
/*Q1. The oldest car belongs to which branch?*/

SELECT brID, carID, brand, model, years_old
FROM car 
GROUP BY brID
HAVING MAX(years_old)
ORDER BY years_old DESC LIMIT 1;

/* Q2. What is the most rented car in each branch? */

WITH t1 AS
(SELECT brID, carID, COUNT(carID) AS cnt FROM booking
GROUP BY carID)
SELECT * FROM(
SELECT brID, carID, cnt AS no_times_rented,
ROW_NUMBER() OVER (PARTITION BY brID ORDER BY cnt DESC) AS sno 
FROM t1
ORDER BY brID DESC) t2
WHERE sno = 1;

/* Q3. What is the count of employees in the company? */

SELECT COUNT(*) 
FROM employees;

/* Q4. What is the revenue received from top 5 customers? */

SELECT b.custID, c.firstName, c.lastName, sum(price) 
FROM booking b JOIN customer c ON b.custID = c.custID
GROUP BY b.custID
ORDER BY SUM(price) DESC LIMIT 5;

/* Q5. What is the least amount paid by a customer?*/

SELECT custID, price 
FROM booking 
ORDER BY price LIMIT 1;

/* Q6. Display details of top 5 customers who have used kyte the most?*/

SELECT b.custID, c.firstName, c.lastName, c.email, c.dob, c.ph_No, c.dr_license
FROM booking as b, customer as c
WHERE b.custID = c.custID
GROUP BY b.custID
ORDER BY COUNT(b.custID) DESC LIMIT 5;


/* Q7. Name the branch with most revenue.*/

SELECT brID, sum(price)
FROM booking
GROUP BY brID
ORDER BY SUM(price) DESC
LIMIT 1;

/* Q8. Who is the oldest driver and which location does he work at?*/
SELECT e.firstName, e.lastName, STR_TO_DATE(e.dob,'%m/%d/%Y') as dob, br.city
FROM employees e
JOIN driver d 
ON d.empID = e.empID
JOIN branch br
ON br.brID = e.brID
ORDER BY dob LIMIT 1;
