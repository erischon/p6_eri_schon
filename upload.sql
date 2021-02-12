COPY user_account(user_password, register_date)
FROM 'C:\Users\Public\p6-data\user_account.csv'
DELIMITER ','
CSV HEADER;

COPY customer(id_user, first_name, last_name, phone_number, email, customer_type)
FROM 'C:\Users\Public\p6-data\customer.csv'
DELIMITER ','
CSV HEADER;

COPY customer_address(address_1, address_2, zip_code, city)
FROM 'C:\Users\Public\p6-data\customer_address.csv'
DELIMITER ','
CSV HEADER;

COPY customeraddress(id_address, id_customer)
FROM 'C:\Users\Public\p6-data\customeraddress.csv'
DELIMITER ','
CSV HEADER;

COPY credit_card(id_customer, credit_card_type, credit_card_name, credit_card_number, credit_card_exp_date, credit_card_crypto)
FROM 'C:\Users\Public\p6-data\credit_card.csv'
DELIMITER ','
CSV HEADER;

COPY shop(address_1, address_2, zip_code, city, phone_number, email)
FROM 'C:\Users\Public\p6-data\shop.csv'
DELIMITER ','
CSV HEADER;

COPY staff(id_user, id_shop, first_name, last_name, email)
FROM 'C:\Users\Public\p6-data\staff.csv'
DELIMITER ','
CSV HEADER;

COPY staff_role(role_name)
FROM 'C:\Users\Public\p6-data\staff_role.csv'
DELIMITER ','
CSV HEADER;

COPY StaffRole(id_staff, id_role)
FROM 'C:\Users\Public\p6-data\staffrole.csv'
DELIMITER ','
CSV HEADER;

COPY permission(permission_type)
FROM 'C:\Users\Public\p6-data\permission.csv'
DELIMITER ','
CSV HEADER;

COPY Rolepermission(id_role, id_permission)
FROM 'C:\Users\Public\p6-data\rolepermission.csv'
DELIMITER ','
CSV HEADER;

COPY ingredient(ingredient_name, stock_type)
FROM 'C:\Users\Public\p6-data\ingredient.csv'
DELIMITER ','
CSV HEADER;

COPY shopingredient(id_ingredient, id_shop, quantity)
FROM 'C:\Users\Public\p6-data\shopingredient.csv'
DELIMITER ','
CSV HEADER;

COPY other_stock(stock_name, stock_type)
FROM 'C:\Users\Public\p6-data\other_stock.csv'
DELIMITER ','
CSV HEADER;

COPY ShopOtherStock(id_otherstock, id_shop, quantity)
FROM 'C:\Users\Public\p6-data\shopotherstock.csv'
DELIMITER ','
CSV HEADER;

COPY categorie(cat_name)
FROM 'C:\Users\Public\p6-data\categorie.csv'
DELIMITER ','
CSV HEADER;
