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
