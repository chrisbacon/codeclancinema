DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
	id SERIAL8 primary key,
	name VARCHAR(255),
	funds NUMERIC
);

CREATE TABLE films (
	id SERIAL8 primary key,
	title VARCHAR(255),
	price NUMERIC
);

CREATE TABLE tickets (
	id SERIAL8 primary key,
	film_id INT8 references films(id),
	customer_id INT8 references customers(id)
);