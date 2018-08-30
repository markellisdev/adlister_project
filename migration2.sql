DROP DATABASE IF EXISTS petlister_db;
CREATE DATABASE petlister_db;
USE petlister_db;

DROP table if exists ads;
DROP table if exists profiles;
DROP table if exists pet_traits;
DROP table if exists pets;
DROP table if exists traits;
DROP table if exists users;


CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username varchar(50) not null ,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(255) NOT NULL,
  UNIQUE (email),
  PRIMARY KEY (id)
);

CREATE TABLE profiles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_Name VARCHAR(100),
  last_Name VARCHAR(100),
  username VARCHAR (100),
  location VARCHAR(100),
  phone VARCHAR (20),
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE
);

# CREATE TABLE pets (
#   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   name VARCHAR(100),
#   type VARCHAR(100),
#   breed VARCHAR (100),
#   gender VARCHAR(100),
#   age INT (20),
#   PRIMARY KEY (id)
# );

CREATE TABLE ads (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(100),
  description VARCHAR(500),
  cost FLOAT NOT NULL,
  username VARCHAR(50) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id) REFERENCES users(id),
  FOREIGN KEY (id) REFERENCES pets(id)
);

# CREATE TABLE traits (
#   id INT UNSIGNED NOT NULL AUTO_INCREMENT,
#   name VARCHAR(100),
#   type VARCHAR(100),
#   breed VARCHAR (100),
#   gender VARCHAR(100),
#   age INT (20),
#   Trait VARCHAR(100),
#   PRIMARY KEY (id),
#   FOREIGN KEY (traits_id) REFERENCES ads(id)
# );

CREATE TABLE pets (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  type VARCHAR(100),
  breed VARCHAR (100),
  gender VARCHAR(100),
  age INT (20),
  PRIMARY KEY (id)
);

# INSERT INTO traits(Trait)
#     VALUES ("Agressive"),("Loving"),("Friendly")

SELECT * FROM ads