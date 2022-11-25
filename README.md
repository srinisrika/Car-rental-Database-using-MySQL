# Car-rental-Database-using-MySQL

<details>
  <summary>Table of Contents</summary>
  <ol>
    
* [About The Project](#about-the-project)
* [Database](#database)
* [Implementation](#implementation)
* [Overview and Future Scope](#overview-and-future-scope)
   
  </ol>
</details>

## About The Project

The project is based on a car rental database called ‘Kyte’. It is set up with a number of local branches that allow a customer
to pick up or return a vehicle from a separate place, as well as a website that permits online reservations. Drivers are hired
by the company to deliver or pick up the car at the customer's selected location.

The database is modelled with requirements for each branch and customer for a booking. The EER and UML diagrams are mapped with
these requirements. This is followed by the creation of a relational model based on the diagrams. A databse is created in MySQL
and NoSQL and multiple queries are implemented. The databse is connected to Python using a connector and multiple visualizations
are plotted for analysis. 

## Database

KYTE is a car rental business that hires out automobiles to the public for short periods of time, typically lasting from several
hours to a few weeks. It is arranged with multiple local branches which allows a user to pick-up or return a vehicle from a
different location with a website that allows online reservations. The company hires drivers to drop-off or pick-up the car at the
customer’s preferred location.

KYTE has a goal of renting cars to customers in an efficient, timely and cost-effective manner. It needs a database system to
support storing data of rentals of different cars. The company has branches all over the country. Each branch has a range of
different cars.

**Requirements:**

The company has branches with a unique branch ID and name. Each branch location has an ID and its address. The branches have
multiple cars and information such as plate number, manufacturer, model, type of engine, etc. are stored. The details of
customers who rent cars from these branches are also stored like name, address, email, phone number, driver’s license, etc. Each
branch has different types of employeessuch as admin, driver, customer care, etc.
When a customer books a car from a specific branch, he/she will be delivered a car. After completion of the trip, a customer can
give a rating for the trip.

On implementing the database, the following rules must be followed:

1. Each branch has only one manager who manages all the employees in that branch.
2. An employee can be a manager for only one branch.
3. A branch can have many cars and a car can belong to only one branch.
4. A customer can book only one car from a branch in a booking.
5. A customer may or may not leave a rating for a booking. A booking can be rated from 1 to 5.

## Implementation

The implementation of this projet is executed using MySQL, NoSQL for creating a database and performing queries and Python for 
data visualization.

## Overview and Future Scope

Kyte car rentals database is a business model database that can be implemented by the company to increase its productivity
and customer satisfaction. This relational model shows a lot of improvement in the revenue with respect to each branch in
the company. It also tells us the importance of the number of employers and drivers within the branch and the cars they own.
The visualizations in python which we have created tell us type of car which is most popular and which is mostly used by the
customers according to their budget. Improvement to the database would be adding the rating from the customers. This would
tell us which car or driver is being liked by most of the customers through a 1-10 rating basis. This way they can also mention
the issues or problems they have come across.









