# Entities

## User Table

The "User" stores information about users of the system:

**1. id (INT)**: primary key

**2. email (CHAR)**: email address of the user

**3. password (CHAR)**: user's password

**4. role (Foreign Key)**: a foreign key that references the user's role

**5. name (CHAR)**: user's first name

**6. surname (CHAR)**: user's last name

-  **MtO relation with Role**
-  **OtM relation with Transaction**
-  **OtM relation with Review**
-  **OtM relation with Journal**
-  **OtO relation with Card**
-  **MtM relation with Loyality program**

---

## Review Table

The "Review" is used to store reviews and ratings for a particular fuel pump:

**1. id (INT)**: primary key

**2. text (CHAR)**: text content of the review, allowing users to provide feedback or comments

**3. user (Foreign Key)**: a foreign key that references the author of the review

**4. date (DATETIME)**: date when this review has been submitted

**5. dispenser (Foreign Key)**: a foreign key that references a fuel pump, which user decided to leave review for

**6. rating (INT)**: a rating that user leaves, 1-5⭐

-  **MtO relation with User**

---

## Role Table

The "Role" is used to determine which role the user belongs to:

**1. id (INT)**: primary key

**2. name(CHAR)**: naming of this particular role(customer, employee, admin)

-  **OtM relation with User**

---

## Fuel type Table

The "Fuel type" is used for storing, well, fuel type:

**1. id (INT)**: primary key

**2. name(CHAR)**: the type of fuel

-  **OtM relation with Fuel inventory**

---

## Fuel Inventory Table

The "Fuel Inventory" keeps track of the inventory of various fuel types available:

**1. id (INT)**: primary key

**2. fuelType (Foreign Key)**: a foreign key that references the type of fuel stored in the inventory

**3. quantity (FLOAT)**: current quantity of the specified fuel type in the inventory

**4. pricePerUnit (FLOAT)**: records the price per unit (e.g., gallon or liter) of the fuel type. It represents the cost customers pay for each unit of the specified fuel type

-  **MtO relation with Fuel type**
-  **OtM relation with Fuel dispenser**

---

## Fuel Dispenser Table

The "Fuel Dispenser" represents the fuel pump:

**1. id (INT)**: primary key

**2. fuelInventory (Foreign Key)**: a foreign key that references the fuel inventory

**3. status (BOOL)**: the status of the dispenser, which can be either "true" (active) or "false" (out of service)

**4. maintenanceDue (DATETIME)**: the date and time when maintenance is due for the dispenser

-  **MtO relation with Fuel inventory**
-  **OtM relation wuth Transaction**

---

## Transaction Table

The "Transaction" records details of transactions conducted at the gas station, including fuel purchases:

**1. id (INT)**: primary key

**2. dispenser (Foreign Key)**: a foreign key that references the fuel dispenser involved in transaction

**3. user (Foreign Key)**: the customer making the transaction

**4. date (DATETIME)**: the date and time when the transaction took place

**5. totalCost (FLOAT)**: the total cost of the transaction

**6. fuelDispensed (FLOAT)**: the quantity of fuel dispensed in the transaction

-  **MtO relation with Fuel dispenser**
-  **MtO relation with User**

---

## Sales Report Table

The "Sales Report" is used to store sales data and related information for the gas station:

**1. id (INT)**: primary key

**2. fuelSold (FLOAT)**: the total quantity of fuel sold during a specific period

**3. revenue (FLOAT)**: the total revenue generated from the sale of fuel and other items or services

**4. coveringText (CHAR)**: provides a brief description or summary of the sales report

---

## Special Offer Table

The "Special Offer" manages special offers and promotions related to the gas station's loyalty program

**1. id (INT)**: primary key

**2. loyalty (Foreign Key)**: a foreign key that references the loyalty program to which the special offer is associated

**3. expDate (DATETIME)**: represents the expiration date and time of the special offer

**4. text (CHAR)**: stores a brief text description or message related to the special offer.

**5. discount (INT)**: records the discount amount or percentage offered by the special promotion

-  **MtO relation with Loyality program**

---

## Loyality program Table

The "Loyality program" is used for storing info about special promotions

**1. id (INT)**: primary key

**2. name(CHAR)**: the naming of the particular program

**3. rules(CHAR)**: rules needed to be complied with in order for program to be active

-  **MtM relation with User**

---

## Journal Table

The "Journal" is used to log various actions or events within the system:

**1. id (INT)**: primary key

**2. actionType (Foreign Key)**: a foreign key that references the type of action or event being logged in the journal

**3. user (Foreign Key)**: a foreign key that references the user who performed the action or event being logged

**4. date (DATETIME)**: records the date and time when the action or event was logged

-  **MtO relation with Action type**
-  **MtO relation with User**

---

## Action type Table

The "Action type" is used to store different actions that users can perform:

**1. id (INT)**: primary key

**2. action (CHAR)**: stores a particular action

-  **MtO relation with Journal**

---

## Card Table

The "Card" is used by customers to apply discounts:

**1. id (INT)**: primary key

**2. user (Foreign Key)**: a foreign key that references the owner of the card /

**3. discount (FLOAT)**: a value that references the % discount owner gets for purchases

-  **OtO relation with User**
