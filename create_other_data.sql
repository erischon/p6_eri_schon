INSERT INTO the_order (order_number, id_customer, id_shop, id_type, order_date, total_price)
    VALUES ('150221PIZ015', '4', '1', '2', '2021-02-15 1:10:09', '19.94');

COPY order_status(id_order, id_status, status_time, id_staff)
FROM 'C:\Users\Public\p6-data\b_order_status.csv'
DELIMITER ','
CSV HEADER;
