CREATE TABLE user_account (
    id_user         integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_password   varchar(20) NOT NULL,
    register_date   date
);

CREATE TABLE customer (
    id_customer integer GENERATED ALWAYS AS IDENTITY,
    id_user integer,
    first_name varchar(100) NOT NULL,
    last_name varchar(100),
    phone_number varchar(20),
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
    credit_card_number int8,
    credit_card_exp_date date,
    credit_card_crypto integer
);

CREATE TABLE shop (
    id_shop integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    address_1 varchar(100),
    address_2 varchar(100),
    zip_code varchar(5),
    city varchar(100),
    phone_number varchar(20),
    email varchar(100)
);

CREATE TABLE staff (
    id_staff integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_user integer REFERENCES user_account,
    id_shop integer REFERENCES shop,
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

CREATE TABLE ingredient (
    id_ingredient integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_shop integer REFERENCES shop,
    ingredient_name varchar(50),
    stock_type varchar(10),
    stock integer
);

CREATE TABLE other_stock (
    id_otherstock integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_shop integer REFERENCES shop,
    stock_name varchar(50),
    stock_type varchar(10),
    stock integer
);

CREATE TABLE categorie (
    id_categorie integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    cat_name varchar(50)
);

CREATE TABLE vat (
    id_vat integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vat_rate decimal(5, 2)
);

CREATE TABLE recipe (
    id_recipe integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    recipe_name varchar(50),
    description text
);

CREATE TABLE RecipeIngredient (
    id_recipeing integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_ingredient integer REFERENCES ingredient,
    id_recipe integer REFERENCES recipe,
    ingredient_quantity integer
);

CREATE TABLE product (
    id_product integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_categorie integer REFERENCES categorie,
    id_recipe integer REFERENCES recipe,
    id_vat integer REFERENCES vat,
    product_name varchar(100),
    unit_price decimal(6, 2),
    is_available bool
);

CREATE TABLE ProductOtherStock (
    id_prodothsto integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_otherstock integer REFERENCES other_stock,
    id_product integer REFERENCES product,
    otherprod_quantity integer
);

CREATE TABLE status_list (
    id_status integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    status_name varchar(50)
);

CREATE TABLE order_type (
    id_type integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type_name varchar(50)
);

CREATE TABLE billing_mode (
    id_billmode integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    bm_name varchar(50)
);

CREATE TABLE the_order (
    id_order integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    order_number varchar(16),
    id_customer integer REFERENCES customer,
    id_staff integer REFERENCES staff,
    id_shop integer REFERENCES shop,
    id_type integer REFERENCES order_type,
    order_date timestamp,
    total_price decimal(6, 2)
);

CREATE TABLE order_status (
    id_orderstatus integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_status integer REFERENCES status_list,
    id_order integer REFERENCES the_order,
    order_date timestamp
);

CREATE TABLE order_detail (
    id_orderdetail integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_order integer REFERENCES the_order,
    id_product integer REFERENCES product,
    quantity integer
);
