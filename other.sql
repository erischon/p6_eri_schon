-- modification du length pour phone_number
alter table customer alter column phone_number TYPE varchar(20);
alter table shop alter column phone_number TYPE varchar(20);

-- j'efface la table customer pour y remettre le .csv
truncate customer cascade;

alter table customer alter column first_name SET NOT NULL;
