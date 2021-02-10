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