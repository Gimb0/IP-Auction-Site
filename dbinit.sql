DROP TABLE users, items, bidhistory;

CREATE TABLE users (
    email TEXT PRIMARY KEY,
    username TEXT NOT NULL,
    name TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE items (
    name TEXT PRIMARY KEY,
    description TEXT,
    category TEXT,
    location TEXT,
    filename TEXT NOT NULL,
    price TEXT NOT NULL,
    endDate TEXT NOT NULL
);

CREATE TABLE bidhistory (
    itemName TEXT PRIMARY KEY,
    username TEXT NOT NULL,
    price TEXT NOT NULL,
    time TEXT
);

INSERT INTO users (email, username, name, password) VALUES ("m.abdo@yahoo.com", "xxx_abdo", "Michael Abdo", "SpringWater");
INSERT INTO users (email, username, name, password) VALUES ("j.dib@msn.com", "xxx_dib", "Joshua Dib", "HpLaptop");
INSERT INTO users (email, username, name, password) VALUES ("gimbo@gimboscloud.com", "gimbo", "Brad Gimbo", "N-O-D-E");

INSERT INTO items (name, description, category, location, filename, price, endDate) VALUES ("MetaBox Laptop", "Laptop that breaks", "Computers/Laptops", "Sydney", "unknown0.jpg", "$1500", "7/11/2019");
INSERT INTO items (name, description, category, location, filename, price, endDate) VALUES ("ESP8266", "TCP/IP stacked circuit", "IOT", "QLD", "unknown1.jpg", "$25", "18/11/2019");

INSERT INTO bidhistory (itemName, username, price, time) VALUES ("MetaBox Laptop", "xxx_abdo", "$1501", "6/11/2019");