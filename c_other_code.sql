-- modification du length pour phone_number
alter table customer alter column phone_number TYPE varchar(20);
alter table shop alter column phone_number TYPE varchar(20);

-- j'efface la table customer pour y remettre le .csv
truncate customer cascade;

-- un customer doit avoir au moins un prénom
alter table customer alter column first_name SET NOT NULL;

-- integer pas assez long pour credit_card_number
alter table credit_card alter column credit_card_number TYPE int8;

-- mise à jour de user
INSERT INTO user_account (user_password, register_date)
    VALUES ('123', '10/02/2021');

INSERT INTO permission (permission_type)
    VALUES ('cmd_status');

-- mise à jour de la table ingedient
alter table ingredient drop id_shop;
alter table ingredient drop stock;

-- mise à jour de la table OtherStock
alter table other_stock drop id_shop;
alter table other_stock drop stock;

-- j'ai oublié la pâte...
INSERT INTO ingredient (ingredient_name, stock_type)
    VALUES ('farine', 'kg');
INSERT INTO ingredient (ingredient_name, stock_type)
    VALUES ('sel', 'g');
INSERT INTO ingredient (ingredient_name, stock_type)
    VALUES ('levure', 'g');
INSERT INTO ingredient (ingredient_name, stock_type)
    VALUES ('huile d olive', 'cl');

INSERT INTO ingredient (ingredient_name, stock_type)
    VALUES ('pâte à pizza', 'unité');

-- modification du type pour la quantité de RecipeIngredient
alter table recipeingredient alter column ingredient_quantity TYPE decimal(6, 2);

-- ajout d'un customer staff
INSERT INTO customer (first_name, customer_type)
    VALUES ('staff', 'staff');

-- modification de the_order et order_status (déplacement de id_staff)
alter table the_order drop id_staff;
alter table order_status add column id_staff integer REFERENCES staff;
alter table order_status rename column order_date to status_time;