a. Group Details
Group 7:
Joshua Dib - 18993745
Michael Abdo - 19003405
Bradley Semlitzky - 19033567 

b. Tehnical Design

System Technologies
The web application functionality is implemented using Java Server Pages. The rest of the web application is implemented using HTML and CSS.

Program Structure:
WEB-INF/
		lib/ - JAVA DRIVERS
web/ - *.jsp files
assets/ - contains images and other data files
dbinit.sql - Initaialize SQL database
ip-auction.db - SQLite database

Database design:
	users Table
email TEXT PRIMARY KEY
username TEXT NOT NULL
name TEXT NOT NULL
password TEXT NOT NULL

	items Table
name TEXT PRIMARY KEY
description TEXT
category TEXT
location TEXT
filename TEXT NOT NULL
startPrice DOUBLE NOT NULL
curPrice DOUBLE NOT NULL
startDate DATE NOT NULL
endDate DATE NOT NULL
itemOwner TEXT NOT NULL Foreign Key

	bidhistory Table
bidID INTEGER PRIMARY KEY
itemName TEXT
username TEXT NOT NULL
price TEXT NOT NULL
date TEXT NOT NULL


	Files and purpose 
Header: consistent file for all files 
addBid: page to get proposed bid and update the price 
index: a list view of the available auction items where users can filter and select an item to view 
itemCreate: page to create a new item 
itemEdit: page to update and pull data compared to the Create page 
itemView: lists the details, history, and allows user to bid on an item 
itemSave: either sends and update or insert statement 
login_check: sees if a user input is valid and sets error attributes 
login_success: logs the user in a sets up the session variables 
login: page for user to login 
logout: logout the user and reset the session variables 
register_check: sees if a user input is valid and sets error attributes 
register_success: registers the user once validation is passed 
register: page for user to register

	Auction Functions:
Registration: name, details (should be saved on server) - Implmented  
List of auction cars: ID, name, description, vendor, starting time, closing time (should be saved on server) - Implmented 
Registered person can bid - Implmented 
New bidding > current highest bidding - Implmented 
A bidder can place a bid after an auction starting time - Implmented 
A bidder cannot place bid after an auction’s closing time - Implmented 
Creation of auction items - Implmented 


c. Instructions for compiling:

Copy all files and folders to tomcat root folder.
Linux : /usr/local/tomcat/webapps/jsptut/
Windows: /xampp/tomcat/webapps/jsptut/

In Browser:
localhost:8080/jsptut/web/*

d. Other features
Item categories, Reserved price, Bidding history etc – Implmented (Bidding history, Item Categories, Item Views