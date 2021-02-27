-- 
-- Des requêtes pour tester la DB et si l'on a bien les informations désirées
-- 
-- 'Une commande' est entendu comme sa caractéristique unique : son ID
-- les requêtes peuvent être modifiées au niveau du SELECT si l'on souhaite le détail d'une commande 
-- 

-- Lister les commandes du jour ainsi que leur statut
SELECT id_order
FROM the_order
WHERE date(order_date) = '2021-02-15';

-- Lister les commandes qui ont été faites par le client Schmol
SELECT id_order
FROM the_order
WHERE id_customer = '4';

-- Lister les commandes qui ont été livrées par Simon
SELECT id_order
FROM order_status
WHERE id_status = '5' AND id_staff = '2';

-- Lister les commandes qui ont été préparées par Léon à la date du 15 février 2021
SELECT id_order
FROM order_status
WHERE id_status = '2' AND id_staff = '1';

-- Lister les pizzeria ainsi que leur nombre de commandes en cours
    -- je cherche toutes commandes clôturées
SELECT id_order
FROM order_status
WHERE id_status = '5';

    -- je cherche toutes les commandes sauf celles clôturées
SELECT id_order
FROM order_status
WHERE id_order != '3';

    -- je cherche les pizzerias auxquelles appartiennent les commandes en cours
SELECT id_shop
FROM the_order
WHERE id_order IN ('1', '2');

-- Pour une pizzeria bien définie ressortir le stocks restant
SELECT id_ingredient, quantity
FROM shopingredient
WHERE id_shop = '1';