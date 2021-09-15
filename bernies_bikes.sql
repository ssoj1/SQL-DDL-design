bike
    model
    code
    price.id

price   
    id
    price

Orders
    1 
    date/timestamp

Line_items
    int primary_key
    order_id
    bike_code
    notes
    bike_price


CREATE TABLE bikes (
    code VARCHAR(4) PRIMARY KEY, 
    model TEXT UNIQUE NOT NULL,
    price NUMERIC(10,2) --REFERENCES price NOT NULL
    );

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    purchase_date TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE line_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders NOT NULL,
    bike_code TEXT REFERENCES bikes NOT NULL,
    notes TEXT NOT NULL DEFAULT '',
    price NUMERIC(10,2) NOT NULL --REFERENCES bikes.price NOT NULL,
);

CREATE TABLE price (
    price NUMERIC(10,2) PRIMARY KEY
    start_date TIMESTAMP WITH TIME ZONE NOT NULL
    end_date TIMESTAMP WITH TIME ZONE --Noted: Use interval type: for the same model no two integers can overlap
    bike_model VARCHAR(4)
);
-- If Bernie wanted to keep track price through time for a particular bike
 