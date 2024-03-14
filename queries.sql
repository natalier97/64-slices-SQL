-- SELECT * FROM orders;

-- - How many drivers she has.
-- SELECT COUNT(driver_id) FROM drivers;


-- - How many deliveries has each store made?
-- SELECT orders.store_id, COUNT(deliveries.order_id) AS delivery_count_for_each_store 
-- FROM orders 
-- JOIN deliveries ON deliveries.order_id = orders.order_id
-- GROUP BY orders.store_id;




-- - How many deliveries has each driver made?
-- SELECT driver_id, COUNT(driver_id) FROM deliveries GROUP BY driver_id;



-- - Which driver did the shortest delivery?
-- SELECT MIN(completed_delivery - started_delivery) AS shortest_delivery, driver_id
-- FROM deliveries
-- GROUP BY driver_id;



-- - Which driver did the longest delivery?
-- SELECT MAX(completed_delivery - started_delivery) AS longest_delivery, driver_id
-- FROM deliveries
-- GROUP BY driver_id;



-- - How much did money did they make on each order?




-- - Which store made the most money?

-- - Which customer spent the most money?

-- - How much money did they make each month?

-- - Which driver, on average, takes the longest?

-- - Which driver, on average, is the quickest?
