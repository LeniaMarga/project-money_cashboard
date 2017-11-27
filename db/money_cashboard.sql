DROP TABLE transactions;
DROP TABLE categories;
DROP TABLE shops;

CREATE TABLE shops(
  id SERIAL8 PRIMARY KEY,
  shop_name VARCHAR(255),
  location VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL8 PRIMARY KEY,
  tag_name VARCHAR(255),
  amount_limit NUMERIC
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  category_id INT4 REFERENCES categories(id),
  shop_id INT4 REFERENCES shops(id),
  title VARCHAR(255),
  price NUMERIC,
  date_input DATE
);
