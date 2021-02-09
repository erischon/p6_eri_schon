CREATE TABLE user_account (
    id_user         integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_password   varchar(20) NOT NULL,
    register_date   date
);

CREATE TABLE customer (
    id_customer integer GENERATED ALWAYS AS IDENTITY,
    id_user integer,
    first_name varchar(100),
    last_name varchar(100),
    phone_number varchar(10),
    email varchar(100),
    customer_type varchar(50),
    PRIMARY KEY (id_customer),
    CONSTRAINT fk_user
        FOREIGN KEY(id_user)
        REFERENCES user_account(id_user)
);

CREATE TABLE customer_address (
    id_address integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    address_1 varchar(100),
    address_2 varchar(100),
    zip_code varchar(5),
    city varchar(100)
);

CREATE TABLE CustomerAddress (
    id_cust_add integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_address integer REFERENCES customer_address,
    id_customer integer REFERENCES customer
);

CREATE TABLE credit_card (
    id_credit_card integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_customer integer REFERENCES customer,
    credit_card_type varchar(50),
    credit_card_name varchar(50),
    credit_card_number integer,
    credit_card_exp_date date,
    credit_card_crypto integer
);

CREATE TABLE staff (
    id_staff integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user integer REFERENCES user_account,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

CREATE TABLE staff_role (
    id_role integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    role_name varchar(50)
);

CREATE TABLE permission (
    id_permission integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    permission_type varchar(50)
);

CREATE TABLE StaffRole (
    id_staffrole integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_staff integer REFERENCES staff,
    id_role integer REFERENCES staff_role
);

CREATE TABLE RolePermission (
    id_roleperm integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_role integer REFERENCES staff_role,
    id_permission integer REFERENCES permission
);

CREATE TABLE shop (
    id_shop integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    address_1 varchar(100),
    address_2 varchar(100),
    zip_code varchar(5),
    city varchar(100),
    phone_number varchar(10),
    email varchar(100)
);