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
  