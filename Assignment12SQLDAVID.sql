create database pizza;

-- Customer Info Table
CREATE TABLE `pizza`.`customer_info` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Customer Info Inserts
INSERT INTO `pizza`.`customer_info`
(`customer_id`,`customer_name`,`phone_number`)
VALUES
(1,'Trevor Page','226-777-4982');
INSERT INTO `pizza`.`customer_info`
(`customer_id`,`customer_name`,`phone_number`)
VALUES
(2,'John Doe','879-234-9498');
INSERT INTO `pizza`.`customer_info`
(`customer_id`,`customer_name`,`phone_number`)
VALUES
(3,'David Lobo', '902-542-1289');

-- Order Details Table
CREATE TABLE `pizza`.`orderdetails` (
  `orderDetail_id` int NOT NULL,
  `order_name` varchar(45) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `pizza_id` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Order Details Inserts
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(1,'Trevor Page','2014-09-10 09:47:00',1,1,1);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(2,'Trevor Page','2014-09-10 09:47:00',1,3,1);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(3,'John Doe','2014-09-10 13:20:00',2,2,1);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(4,'John Doe','2014-09-10 13:20:00',2,3,2);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(5,'Trevor Page','2014-09-10 09:47:00',3,3,1);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES
(6,'Trevor Page','2014-09-10 09:47:00',3,4,1);
INSERT INTO `pizza`.`orderdetails`
(`orderDetail_id`,`order_name`,`date_time`,`order_id`,`pizza_id`,`quantity`)
VALUES 
(7, 'David Lobo', '2015-03-23 10:23:00',4,3,1);

-- Pizza Info Table
CREATE TABLE `pizza`.`pizza_info` (
  `pizza_id` int NOT NULL,
  `pizza_name` varchar(45) DEFAULT NULL,
  `pizza_price` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pizza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Pizza Info Inserts
INSERT INTO `pizza`.`pizza_info`
(`pizza_id`,`pizza_name`,`pizza_price`)
VALUES
(1,'pepperoni and cheese',7.99);
INSERT INTO `pizza`.`pizza_info`
(`pizza_id`,`pizza_name`,`pizza_price`)
VALUES
(2,'vegetarian',9.99);
INSERT INTO `pizza`.`pizza_info`
(`pizza_id`,`pizza_name`,`pizza_price`)
VALUES
(3,'Meat lovers',14.99);
INSERT INTO `pizza`.`pizza_info`
(`pizza_id`,`pizza_name`,`pizza_price`)
VALUES
(4,'hawaiian',12.99);

-- Customer to Orders Table
CREATE TABLE `pizza`.`customer_to_orders` (
  `customer_id` int NOT NULL,
  `orderDetail_id` int NOT NULL,
  KEY `customer_id` (`customer_id`),
  KEY `orderDetail_id` (`orderDetail_id`),
  CONSTRAINT `customer_to_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_info` (`customer_id`),
  CONSTRAINT `customer_to_orders_ibfk_2` FOREIGN KEY (`orderDetail_id`) REFERENCES `orderdetails` (`orderDetail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Customer to Orders Inserts
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(1, 1);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(1,2);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(2,3);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(2,4);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(1,5);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(1,6);
INSERT INTO `pizza`.`customer_to_orders`
(`customer_id`,`orderDetail_id`)
VALUES
(3,7);

-- Orders to Pizza Table
CREATE TABLE `pizza`.`orders_to_pizza` (
  `orderDetail_id` int NOT NULL,
  `pizza_id` int NOT NULL,
  KEY `orderDetail_id` (`orderDetail_id`),
  KEY `pizza_id` (`pizza_id`),
  CONSTRAINT `orders_to_pizza_ibfk_1` FOREIGN KEY (`orderDetail_id`) REFERENCES `orderdetails` (`orderDetail_id`),
  CONSTRAINT `orders_to_pizza_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizza_info` (`pizza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Orders to Pizza Insert
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(1,1);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(2,3);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(3,2);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,
`pizza_id`)
VALUES
(4,3);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(5,3);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(6,4);
INSERT INTO `pizza`.`orders_to_pizza`
(`orderDetail_id`,`pizza_id`)
VALUES
(7,3);



-- Selects Section


-- Shows Order, Name, Price, Date
select orderDetail_id, order_name as Name,pizza_price as `Pizza Price`, date(date_time) as Date
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
order by order_name, date_time, quantity, orderDetail_id, pizza_price;


-- Q4 Shows Name, Total amount 
select order_name as 'Order Name', sum(quantity * (Select pizza_price from pizza_info where orderdetails.pizza_id = pizza_info.pizza_id)) as Total
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
group by order_name;

-- Q5 Shows Name, Date & Time, Total
select order_name as 'Order Name', date_time as 'Date & Time', sum(quantity * (Select pizza_price from pizza_info where orderdetails.pizza_id = pizza_info.pizza_id)) as Total
from orderdetails
left join pizza_info on orderdetails.orderDetail_id = pizza_info.pizza_id
group by date_time;


-- test
select * from orderdetails
left join orders_to_pizza on orderdetails.orderDetail_id = orders_to_pizza.orderDetail_id;

select * from customer_info;
select * from customer_to_orders;
select * from orderdetails;
select * from orders_to_pizza;
select * from pizza_info;




