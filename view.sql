-------- view in SQL ---------------------
CREATE VIEW customer_info AS 
SELECT first_name, last_name, email, address, phone
FROM customer
JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

ALTER VIEW customer_info RENAME TO customer_master_list;

SELECT * FROM customer_master_list;


