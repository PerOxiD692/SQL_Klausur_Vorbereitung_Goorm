-- Vorbereitung der Datenbank
DROP DATABASE IF EXISTS mydb;
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;
SHOW DATABASES;

-- Erstellen der Tabellen customers + orders
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `id` INT NOT NULL,
  `cst_name` VARCHAR(45) NOT NULL,
  `cst_firstname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` INT NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `customers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_customers_idx` (`customers_id` ASC),
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customers_id`)
    REFERENCES `mydb`.`customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Ausgabe Struktur + Inhalt
SELECT * FROM customers;
SELECT * FROM orders;

-- Erstellen der Tabelle Adressbook
CREATE TABLE IF NOT EXISTS `mydb`.`adressbook` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `vorname` VARCHAR(45) NOT NULL,
  `plz` INT NOT NULL,
  `ort` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Ausgabe Struktur + Inhalt
DESCRIBE adressbook;
SELECT * FROM adressbook;

-- INSERTS für adressbook
INSERT INTO `mydb`.`adressbook` (`id`, `name`, `vorname`, `plz`, `ort`) VALUES (DEFAULT, "Müller", "Peter", 12991, "Berlin");
INSERT INTO `mydb`.`adressbook` (`id`, `name`, `vorname`, `plz`, `ort`) VALUES (DEFAULT, "Ay", "Yildiz", 63325, "Langen");
INSERT INTO `mydb`.`adressbook` (`id`, `name`, `vorname`, `plz`, `ort`) VALUES (DEFAULT, "Sommer", "Petra", 70137, "Stuttgart");

-- Ausgabe Inhalt adressbook
SELECT * FROM adressbook;

-- Ausgabe Inhalt adressbook gefiltert nach vorname fängt mit "Pet" an
SELECT 
	name AS "Name",
    vorname AS "Vorname"
FROM adressbook
WHERE vorname LIKE "Pet%";