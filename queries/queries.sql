SELECT
  *
FROM
  transaction;

SELECT
  name
FROM
  users
WHERE
  LOWER(name) LIKE 'm%';

SELECT
  surname
FROM
  users
WHERE
  UPPER(surname) LIKE '%Z%';

SELECT
  id,
  maintenance_due
FROM
  fuel_dispenser
ORDER BY
  maintenance_due DESC;

SELECT
  *
FROM
  card
LIMIT
  5;

SELECT
  *
FROM
  users
LIMIT
  10 OFFSET 50;

SELECT
  SUM(total_cost)
FROM
  transaction;

SELECT
  MIN(rating)
FROM
  review;

SELECT
  *
FROM
  fuel_inventory
WHERE
  quantity > 5000;

SELECT
  DISTINCT fuel_inventory_id
FROM
  fuel_dispenser;

SELECT
  *
FROM
  sales_report
WHERE
  fuel_sold BETWEEN 4000
  AND 5000;

SELECT
  *
FROM
  fuel_dispenser
WHERE
  fuel_inventory_id IN (3, 4, 5);

SELECT
  name,
  quantity
FROM
  fuel_inventory inv
  INNER JOIN fuel_type ftype ON inv.fuel_type_id = ftype.id;

--------------
SELECT
  users.surname,
  SUM(transaction.total_cost) as total
FROM
  users
  JOIN transaction ON users.id = transaction.user_id
WHERE
  transaction.date >= current_date - interval '30 days'
GROUP BY
  users.surname
HAVING
  SUM(transaction.total_cost) > 100;

SELECT
  users.surname,
  transaction.total_cost AS most_spent
FROM
  users
  INNER JOIN transaction ON transaction.user_id = users.id
WHERE
  total_cost = (
    SELECT
      MAX(total_cost)
    FROM
      transaction
  );


------ JOINS
SELECT
  fuel_dispenser.status,
  fuel_inventory.price_per_unit
FROM
  fuel_dispenser
  INNER JOIN fuel_inventory ON fuel_dispenser.fuel_inventory_id = fuel_inventory.id;

SELECT
  fuel_dispenser.status,
  fuel_inventory.price_per_unit
FROM
  fuel_dispenser
  LEFT OUTER JOIN fuel_inventory ON fuel_dispenser.fuel_inventory_id = fuel_inventory.id;

SELECT
  fuel_dispenser.status,
  fuel_inventory.price_per_unit
FROM
  fuel_dispenser
  CROSS JOIN fuel_inventory;

SELECT
  fuel_dispenser.status,
  fuel_inventory.price_per_unit
FROM
  fuel_dispenser 
  FULL JOIN fuel_inventory ON fuel_dispenser.fuel_inventory_id = fuel_inventory.id;


------ GROUP BY
SELECT
  fuel_dispenser_id,
  AVG(total_cost) AS avg_bill
FROM
  transaction
GROUP BY
  fuel_dispenser_id
HAVING
  AVG(total_cost) > (
    SELECT
      AVG(total_cost)
    FROM
      transaction
  );


------ PARTITION BY
SELECT
  user_id,
  id,
  total_cost,
  SUM(total_cost) OVER (PARTITION BY user_ id) AS user_total
FROM
  transaction;

SELECT
  id,
  fuel_dispenser_id,
  fuel_dispensed,
  ROW_NUMBER() OVER (
    PARTITION BY fuel_dispenser_id
    ORDER BY
      fuel_dispensed DESC
  )
FROM
  transaction;


------ PARTITION BY LIST
CREATE TABLE oil_extracted (
  id SERIAL,
  amount INT,
  region VARCHAR(50),
  PRIMARY KEY (id, region)
) PARTITION BY LIST (region);

CREATE TABLE Africa PARTITION OF oil_extracted FOR
VALUES
  IN ('Africa');

CREATE TABLE Europe PARTITION OF oil_extracted FOR
VALUES
  IN ('Europe');

CREATE TABLE Asia PARTITION OF oil_extracted FOR
VALUES
  IN ('Asia');


------ HAVING
SELECT
  date,
  SUM(total_cost) AS daily_sales
FROM
  transaction
GROUP BY
  date
HAVING
  SUM(total_cost) > (
    SELECT
      AVG(total_cost)
    FROM
      transaction
  );


------ UNION
SELECT
  revenue AS money
FROM
  sales_report
UNION
SELECT
  total_cost AS money
FROM
  transaction;


------ EXISTS
SELECT
  name,
  surname
FROM
  users
WHERE
  EXISTS (
    SELECT
      1
    FROM
      review
    WHERE
      users.id = review.user_id
      AND review.rating = 5
  );

SELECT
  name
FROM
  users
WHERE
  EXISTS (
    SELECT
      1
    FROM
      transaction
    WHERE
      users.id = transaction.user_id
      AND transaction.date > '2022-01-01'
  );


------ INDEX EXPLAIN
CREATE INDEX name_index ON users(name);
EXPLAIN
SELECT
  name
FROM
  users
WHERE
  name LIKE 'F%';
DROP INDEX name_index;


------ INSERT INTO SELECT
CREATE TABLE vip_users (surname VARCHAR(50));

INSERT INTO
  vip_users(surname)
SELECT
  surname
FROM
  users;


------ CASE
SELECT
  id AS order_id,
  user_id,
  date,
  CASE
    WHEN total_cost > 100 THEN 'High cost'
    ELSE 'Low cost'
  END AS trans_status
FROM
  transaction;