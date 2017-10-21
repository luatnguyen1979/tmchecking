 
--INSERT INTO credentials(username,password,enabled) VALUES ('guest','$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS', TRUE);
--INSERT INTO credentials(username,password,enabled) VALUES ('admin','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe', TRUE);
  
--INSERT INTO authority (username, authority) VALUES ('guest', 'ROLE_USER');
--INSERT INTO authority (username, authority) VALUES ('admin', 'ROLE_ADMIN');
--INSERT INTO authority (username, authority) VALUES ('admin', 'ROLE_USER');
 
--INSERT INTO  `MEMBER` (firstname, lastname,age,title,membernumber, member_id) VALUES ('Curious','George',12,'Boy Monkey', 8754,'admin');
--INSERT INTO `MEMBER` (firstname, lastname,age,title,membernumber,member_id) VALUES ('Allen','Rench',123,'Torque Master', 8733,'guest');


 
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Loyal', 'Dog1', 72, 5, '1001.jpg');
INSERT INTO product (details, tag, title, price, quantity,image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Barks', 'Dog2', 86, 4, '1002.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Hairy', 'Dog3', 5, 7, '1003.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Fluffy', 'Cat1', 68, 3, '1004.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Cuddly', 'Cat2', 56, 1, '1005.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Mad', 'Cat3', 9, 4, '1006.jpg');


INSERT INTO item (product_Id, quantity, discount) VALUES (1, 6, 50);
INSERT INTO item (product_Id, quantity, discount) VALUES (2, 5, 5);
INSERT INTO item (product_Id, quantity, discount) VALUES (3, 4, 15);
INSERT INTO item (product_Id, quantity, discount) VALUES (4, 3, 25);
INSERT INTO item (product_Id, quantity, discount) VALUES (5, 2, 35);
INSERT INTO item (product_Id, quantity, discount) VALUES (6, 1, 5);

INSERT INTO payment (cardNumber, ccv, expiration, fullName, paymentMethod) VALUES ('1234567890123456', '123', '01/2018', 'Luat V Nguyen', 'VISA');
INSERT INTO payment (cardNumber, ccv, expiration, fullName, paymentMethod) VALUES ('1111222233334444', '321', '01/2019', 'Ding', 'MASTERCARD');
INSERT INTO payment (cardNumber, ccv, expiration, fullName, paymentMethod) VALUES ('444433322221111', '231', '01/2020', 'Kevin', 'DISCOVERY');

INSERT INTO address (street1, street2, city, state , zipCode,country) VALUES('1302 S Main st', '', 'Fairfield', 'IA', '52556', 'US');
INSERT INTO address (street1, street2, city, state , zipCode,country) VALUES('4986 S Jefferson st', '', 'Ottumwa', 'IA', '52789', 'US');
INSERT INTO address (street1, street2, city, state , zipCode,country) VALUES('5678 S Nagle st', '', 'Daven Port', 'IA', '05656', 'US');

INSERT INTO customerorder (contactCellPhone, contactEmail, notes, orderDate, totalPrice, billingaddress_id, payment_id, shippingaddress_id)
VALUES('(848) 466-9338', 'vglnguyen@mum.edu', '', '11/02/2017', 90, 1, 1, 2);
INSERT INTO customerorder (contactCellPhone, contactEmail, notes, orderDate, totalPrice, billingaddress_id, payment_id, shippingaddress_id)
VALUES('(848) 466-1234', 'luatguyen@mum.edu', '', '11/05/2017', 200, 1, 2, 1);
INSERT INTO customerorder (contactCellPhone, contactEmail, notes, orderDate, totalPrice, billingaddress_id, payment_id, shippingaddress_id)
VALUES('(848) 466-4321', 'luatnguyen@yahoo.com', '', '10/25/2017', 100, 2, 3, 3);

INSERT INTO customer (firstName, lastName, cellPhone, notes, address_id, cart_id, payment_id)
VALUES('Luat', 'Nguyen', '(848) 466-9338', '', 1, null, 1);
INSERT INTO customer (firstName, lastName, cellPhone, notes, address_id, cart_id, payment_id)
VALUES('Tri', 'Tran', '(848) 466-4567', '', 2, null, 2);
INSERT INTO customer (firstName, lastName, cellPhone, notes, address_id, cart_id, payment_id)
VALUES('Duc', 'Vo', '(848) 466-5276', '', 3, null, 3);

INSERT INTO customer_customerorder (Customer_id, orderList_id) VALUES (1, 1);
INSERT INTO customer_customerorder (Customer_id, orderList_id) VALUES (1, 2);
INSERT INTO customer_customerorder (Customer_id, orderList_id) VALUES (2, 3);







