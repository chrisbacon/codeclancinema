DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
	id SERIAL8 primary key,
	name VARCHAR(255),
	funds INT8
);

CREATE TABLE films (
	id SERIAL8 primary key,
	title VARCHAR(255),
	price INT2
);

CREATE TABLE tickets (
	id SERIAL8 primary key,
	film_id INT8 references films(id),
	customer_id INT8 references customers(id)
);