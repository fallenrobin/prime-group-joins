-- 1. Get all customers and their addresses.

SELECT "customers".first_name, "customers".last_name, 
"addresses".street, "addresses".city, "addresses".state, "addresses".zip
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;


-- 2. Get all orders and their line items (orders, quantity and product).

SELECT "orders".id, "line_items".order_id, "line_items".quantity, "line_items".product_id
FROM "orders"
JOIN "line_items" ON "line_items".id = "orders".id;


-- 3. Which warehouses have cheetos?


-- 4. Which warehouses have diet pepsi?


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers".first_name, "customers".last_name, count("orders".address_id)
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "addresses".customer_id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;


-- 6. How many customers do we have?

SELECT count("customers".id) FROM "customers";


-- 7. How many products do we carry?

SELECT count("products".id) FROM "products";


-- 8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM("warehouse_product".on_hand) 
FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;

