drop database if exists paperplane;
create database paperplane;

use paperplane;


create table client (
    id int primary key auto_increment,
    name varchar(255) ,
    age int ,
    email varchar(255)  , 
    phone_nb bigint  ,
    address varchar(255) ,
);

create table command (
    id int primary key auto_increment,
	client_id int ,
    total_price decimal(10,2),
    command_date timestamp,
    expedition_date timestamp,
    delivery_date timestamp,
    constraint foreign key (client_id) references client(id)
);

create table category (
    id int primary key auto_increment,
    name varchar(255)  
);

create table supplier (
    id int primary key auto_increment,
    name varchar(255) ,
    address varchar(255) ,
    email varchar(255)  ,
    phone_nb bigint  ,
    constraint check (email LIKE '%_@__%.__%')  -- Ajout d'une contrainte permettant de vérifier si le mail est valide.
);

create table product (
    id int primary key auto_increment,
    name varchar(255)  ,
    description varchar(255),
    price decimal(10,2) ,
    quantity int,
    category_id int ,
    constraint foreign key (category_id) references category(id)
);

create table product_cmd (
    id int primary key auto_increment,
    product_id int ,
    command_id int ,
    quantity int ,
    constraint foreign key (product_id) references product(id),
    constraint foreign key (command_id) references command(id),
    constraint  (command_id, product_id)
);

create table supplier_product(
    id int primary key auto_increment,
    supplier_id int ,
    product_id int ,
    constraint foreign key (supplier_id) references supplier(id),
    constraint foreign key (product_id) references product(id),
    constraint  (supplier_id, product_id)
);

DELIMITER |

CREATE TRIGGER calculate_total_price_after_insert
AFTER INSERT ON product_cmd
FOR EACH ROW
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(p.price * pc.quantity)
    INTO total
    FROM product p
    JOIN product_cmd pc ON p.id = pc.product_id
    WHERE pc.command_id = NEW.command_id;
    UPDATE command
    SET total_price = total
    WHERE id = NEW.command_id;
END |

DELIMITER ;
