
CodeClan - Solo Project 1, Programming & Web Fundamentals

Money Cashboard - MoCa

Introduction

This was the first of four projects during my course at CodeClan. The project lasted for one week (10/03/2017 - 01/12/2017), utilising the following technologies and design patterns:

-Ruby (with Sinatra web framework/DSL)
-SQL (with PostgreSQL object-relational database management system)
-HTML/CSS
-Object oriented programming (OOP)
-Test driven development (TDD)
-Databases with CRUD actions
-Representational state transfer architecture (RESTful development/MVC)
-Model-view-controller architecture (MVC)

The project brief was to create a budgeting app used for tracking and categorising personal expenses.
Main features are the ability to create and display Transactions ( which should include a shop name, e.g. Tesco, and a value ) with associated Categories (e.g. 'food', 'clothes') and track and display the total sum of expenses.

MVP:
- Create new transactions
- Display a list of all transactions
- Display total amount spent
- Display total amount spent by tag

Extensions:
- Display list of purchases per tag
- Display list of purchases per shop
- Display sum of purchases per shop
- CRUD actions for the transactions
- Show a warning when the total expenditure is over budget
- Show a warning when the total expenditure in each tag is over a user-defined budget.
- Search and display the list of transactions by date

In creating this web app my intention was to consolidate and utilise as much of the information that I have learned thus far as possible, while adding on knowledge on UX and design patterns. Money Cashboard has all of the functionality specified in the brief, as well as multiple other features; creating a fully-featured product with a professional feel and clean interface.

While planning the project I particularly focused on applying the principle of single responsibility both in back-end(Ruby Classes and Methods) and front-end(Controllers, Views), targeting to resolve functionality in all levels and provide a clean and consistent product. I feel that I achieved my goals and created a simple but slick looking web application with enough functionality to benefit the user, providing mild user flows to help them to achieve their budgeting objectives.

Moving Forward, I would like to add the following functionality in future versions:
Further chronological transaction analysis - between given dates, previous 7 days, previous month, per month etc.
Income MVC collection - input future or past incoming transactions and balance those against transactions and budgets.
Pie-charts, graphics and other forms of data display.
Multiple search options: per category, per date, per shop, and/or combined fields
Add locations - google map api and be able to show shops
Develop vibrant user notifications
Create social block for users: pictures and commends

More ideas developed in my UX brief in the same repository
