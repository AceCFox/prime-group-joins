
 --1. Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" on "customers"."id" = "addresses"."customer_id";

--2. Get all orders and their line items (orders, quantity and product).

SELECT * FROM "orders"
JOIN "line_items" on "orders"."id" = "line_items"."order_id";

--3. Which warehouses have cheetos?

SELECT * FROM "warehouse_product" 
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

--4. Which warehouses have diet pepsi?

SELECT * FROM "warehouse_product" 
JOIN "warehouse" on "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" on "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';


--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", "customers"."last_name", count(*) FROM "orders"
JOIN "addresses" on "orders"."address_id" = "addresses"."id"
JOIN "customers" on "addresses"."customer_id" = "customers"."id"
GROUP BY  "customers"."id";

--6. How many customers do we have?

SELECT count(*) FROM "customers";

--7. How many products do we carry?

SELECT count(*) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM ("quantity") as total FROM  "line_items"
JOIN "products" on "line_items"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi'



--## Stretch~
--9. How much was the total cost for each order?
--10. How much has each customer spent in total?
--11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
