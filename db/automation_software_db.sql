
CREATE DATABASE automation_software_db_test;
\c automation_software_db_test;

CREATE TABLE DISCOUNTS (
DISCOUNT_ID SERIAL PRIMARY KEY,
DISCOUNT_CODE VARCHAR (16) NOT NULL,
DISCOUNT_PERCENT INT NOT NULL,
DISCOUNT_DESC VARCHAR (125) NOT NULL
); 

CREATE TABLE ROLE (
ROLE_ID SERIAL PRIMARY KEY,
ROLE_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE STAFF (
STAFF_ID SERIAL PRIMARY KEY,
STAFF_FNAME VARCHAR (25) NOT NULL,
STAFF_LNAME VARCHAR (35) NOT NULL,
ROLE_ID INT NOT NULL REFERENCES ROLE(ROLE_ID)
);

CREATE TABLE ITEMS (
ITEM_ID SERIAL PRIMARY KEY,
ITEM_NAME VARCHAR (50) NOT NULL,
ITEM_COST DECIMAL NOT NULL, 
ITEM_CALORIES INT NOT NULL,
DISCOUNT_ID INT NOT NULL REFERENCES DISCOUNTS(DISCOUNT_ID)
);

CREATE TABLE ORDERS (
ORDER_ID SERIAL PRIMARY KEY,
DATE_TIME DATE NOT NULL,
DISCOUNT_ID INT NOT NULL,
STAFF_ID INT NOT NULL REFERENCES STAFF(STAFF_ID) 
);

CREATE TABLE ORDERS_ITEMS (
ITEM_ID INT NOT NULL,
ORDER_ID INT NOT NULL,
PRIMARY KEY (ITEM_ID, ORDER_ID),
FOREIGN KEY (ITEM_ID) REFERENCES ITEMS (ITEM_ID),
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
);

CREATE TABLE ROLE_STAFF (
ROLE_ID INT NOT NULL,
STAFF_ID INT NOT NULL,
PRIMARY KEY (ROLE_ID, STAFF_ID),
FOREIGN KEY (ROLE_ID) REFERENCES ROLE(ROLE_ID),
FOREIGN KEY (STAFF_ID) REFERENCES STAFF(STAFF_ID)
);


