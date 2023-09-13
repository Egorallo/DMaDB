### Entities

## User

The "User" stores information about users of the system:

**1. email (CHAR)**: email address of the user

**2. password (CHAR)**: user's password

**3. role (Foreign Key)**: a foreign key that references the user's role

**4. name (CHAR)**: user's first name.

**5. surname (CHAR)**: user's last name.

-  **MtO relation with Review, Role**
-  **OtM relation with Transaction**

---

## Review

The "Review" is used to store reviews and ratings for a particular fuel pump:

**1. text (CHAR)**: text content of the review, allowing users to provide feedback or comments

**2. author (Foreign Key)**: a foreign key that references the author of the review

**2. date (DATETIME)**: date when this review has been submitted

**3. dispenser (Foreign Key)**: a foreign key that references a fuel pump, which user decided to leave review for

**4. rating (INT)**: a rating that user leaves, 1-5⭐

---

## Role

The "Role" is used to determine which role the user belongs to:

**1. name(CHAR)**: naming of this particular role(customer, employee, admin)

---

## Fuel type

The "Fuel type" is used for storing, well, fuel type:

**1. name(CHAR)**: the type of fuel

---

## Fuel Inventory

The "Fuel Inventory" keeps track of the inventory of various fuel types available:

**1. fuelType (Foreign Key)**: a foreign key that references the type of fuel stored in the inventory

**2. quantity (FLOAT)**: current quantity of the specified fuel type in the inventory

**3. pricePerUnit (FLOAT)**: records the price per unit (e.g., gallon or liter) of the fuel type. It represents the cost customers pay for each unit of the specified fuel type

-  **MtO relation with Fuel type**

---

## Fuel Dispenser Table

The "Fuel Dispenser" represents the fuel pump:

**1. dispenserID (INT)**: serves as the unique identifier for each fuel dispenser unit

**2. fuelInv (Foreign Key)**: a foreign key that references the fuel inventory

**3. dispenserStatus (BOOL)**: the status of the dispenser, which can be either "true" (active) or "false" (out of service)

**4. maintenanceDue (DATETIME)**: the date and time when maintenance is due for the dispenser

---

## Transaction Table

The "Transaction" records details of transactions conducted at the gas station, including fuel purchases:

**1. transactionId (INT)**: a unique identifier for each transaction

**2. dispenser (Foreign Key)**: a foreign key that references the fuel dispenser involved in transaction

**3. customer (Foreign Key)**: the customer making the transaction

**4. date (DATETIME)**: the date and time when the transaction took place

**5. totalCost (FLOAT)**: the total cost of the transaction

**6. fuelDispensed (FLOAT)**: the quantity of fuel dispensed in the transaction

-  **MtO relation with Fuel dispenser**

---

## Sales Report

The "Sales Report" is used to store sales data and related information for the gas station:

**1. fuelSold (FLOAT)**: the total quantity of fuel sold during a specific period

**2. revenue (FLOAT)**: the total revenue generated from the sale of fuel and other items or services

**3. coveringText (CHAR)**: provides a brief description or summary of the sales report

---

## Special Offer Table

The "Special Offer" manages special offers and promotions related to the gas station's loyalty program

**1. loyalty (Foreign Key)**: a foreign key that references the loyalty program to which the special offer is associated

**2. expDate (DATETIME)**: represents the expiration date and time of the special offer

**3. text (CHAR)**: stores a brief text description or message related to the special offer.

**4. discount (INT)**: records the discount amount or percentage offered by the special promotion

-  **MtO relation with Loyality program**

---

## Loyality program

The "Loyality program" is used for storing info about special promotions

**1. name(CHAR)**: the naming of the particular program
**2. rules(CHAR)**: rules needed to be complied with in order for program to be active

-  **MtM relation with User**

---

## Journal

The "Journal" is used to log various actions or events within the system:

**1. actionType (Foreign Key)**: a foreign key that references the type of action or event being logged in the journal

**2. user (Foreign Key)**: a foreign key that references the user who performed the action or event being logged

**3. date (DATETIME)**: records the date and time when the action or event was logged

-  **MtO relation with Action type**

---

## Action type

The "Action type" is used to store different actions that users can perform:

**1. action (CHAR)**: stores a particular action

---

## Card

The "Card" is used by customers to apply discounts:

**1. owner (Foreign Key)**: a foreign key that references the owner of the card / **OtO relation with User**

**2. discount (CHAR)**: a value that references the % discount owner gets for purchases
