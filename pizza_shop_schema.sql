DROP TABLE IF EXISTS available_toppings;
DROP TABLE IF EXISTS available_pizzas;
DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS drivers;


CREATE TABLE available_pizzas(
    id SERIAL PRIMARY KEY,
    pizza_type VARCHAR(15) NOT NULL,
    cost INTEGER NOT NULL
);

CREATE TABLE available_toppings(
    id SERIAL PRIMARY KEY,
    topping_name VARCHAR(50) NOT NULL,
    cost_per_pizza INTEGER NOT NULL
);

CREATE TABLE stores(
    id SERIAL PRIMARY KEY,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(25) NOT NULL,
    zip VARCHAR(15) NOT NULL,
    country VARCHAR(5) NOT NULL
);

CREATE TABLE drivers(
    id SERIAL PRIMARY KEY,
    store_id INTEGER NOT NULL,
    full_name VARCHAR(50) NOT NULL
);

CREATE TABLE deliveries(
    driver_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    started_delivery TIME NOT NULL,
    completed_delivery TIME NOT NULL
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    date DATE NOT NULL,
    pizza_type VARCHAR(15) NOT NULL,
    store_id INTEGER NOT NULL,
    toppings INTEGER[]
);



\COPY customers FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/customers.csv' WITH CSV HEADER;

\COPY deliveries FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/deliveries.csv' WITH CSV HEADER;

\COPY available_pizzas FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/available_pizzas.csv' WITH CSV HEADER;

\COPY drivers FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/drivers.csv' DELIMITER ',' CSV HEADER;

\COPY available_toppings FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/available_toppings.csv' WITH CSV HEADER;

\COPY stores FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/stores.csv' WITH CSV HEADER;

/* special delimiter | */
\COPY orders FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/orders.csv' DELIMITER '|' CSV HEADER;