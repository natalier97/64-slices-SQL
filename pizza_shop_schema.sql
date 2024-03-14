DROP TABLE IF EXISTS available_toppings;
DROP TABLE IF EXISTS available_pizzas;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS stores CASCADE;
DROP TABLE IF EXISTS drivers CASCADE;
DROP TABLE IF EXISTS deliveries CASCADE;
DROP TABLE IF EXISTS orders CASCADE;


CREATE TABLE available_pizzas(
    pizza_id SERIAL PRIMARY KEY,
    pizza_type VARCHAR(15) NOT NULL UNIQUE
        CHECK(pizza_type in ('small', 'medium', 'large')),
    cost INTEGER NOT NULL
);

CREATE TABLE available_toppings(
    toppigns_id SERIAL PRIMARY KEY,
    topping_name VARCHAR(50) NOT NULL UNIQUE
        CHECK(topping_name ~ '^[A-Za-z -ñ]+$'), --only letters & spaces & ñ & -
    cost_per_pizza INTEGER NOT NULL
);

CREATE TABLE stores(
    store_id SERIAL PRIMARY KEY,
    location VARCHAR(50) NOT NULL
        -- CHECK(location ~ '^[\w]+\s*,\s*[\w]+$') --string of words with ', followed by a comma & another string
);

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(25) NOT NULL,
    zip VARCHAR(15) NOT NULL,
    country VARCHAR(5) NOT NULL
);

CREATE TABLE drivers(
    driver_id SERIAL PRIMARY KEY,
    store_id INTEGER NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);



CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    date DATE NOT NULL,
    pizza_type VARCHAR(15) NOT NULL,
    store_id INTEGER NOT NULL,
    toppings INTEGER[],
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE deliveries(
    driver_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    started_delivery TIME NOT NULL,
    completed_delivery TIME NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);



\COPY available_pizzas FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/available_pizzas.csv' WITH CSV HEADER;

\COPY available_toppings FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/available_toppings.csv' WITH CSV HEADER;

\COPY stores FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/stores.csv' WITH CSV HEADER;

\COPY customers FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/customers.csv' WITH CSV HEADER;

\COPY drivers FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/drivers.csv' DELIMITER ',' CSV HEADER;

/* special delimiter | */
\COPY orders FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/orders.csv' DELIMITER '|' CSV HEADER;

\COPY deliveries FROM '/home/natalie/code_platoon/assignments/7th-week-assignments/64-slices-1-SQL/stage-1/data/deliveries.csv' WITH CSV HEADER;




