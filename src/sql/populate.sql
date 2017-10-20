 
--INSERT INTO credentials(username,password,enabled) VALUES ('guest','$2a$10$0.ESlGysrPaiW5HaapKwoehzWt5AibgbPPOvMhDv8D6H26QQ/CwhS', TRUE);
--INSERT INTO credentials(username,password,enabled) VALUES ('admin','$2a$10$S/wlXEo/APzf.Sn1cO2p4.V12EJmaw.uzrHelMvkpuahjmHWnSafe', TRUE);
  
--INSERT INTO authority (username, authority) VALUES ('guest', 'ROLE_USER');
--INSERT INTO authority (username, authority) VALUES ('admin', 'ROLE_ADMIN');
--INSERT INTO authority (username, authority) VALUES ('admin', 'ROLE_USER');
 
--INSERT INTO  `MEMBER` (firstname, lastname,age,title,membernumber, member_id) VALUES ('Curious','George',12,'Boy Monkey', 8754,'admin');
--INSERT INTO `MEMBER` (firstname, lastname,age,title,membernumber,member_id) VALUES ('Allen','Rench',123,'Torque Master', 8733,'guest');

--INSERT INTO cart () VALUES ();
 
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Loyal', 'Dog1', 72, 5, '/resource/images/products/1001.jpg');
INSERT INTO product (details, tag, title, price, quantity,image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Barks', 'Dog2', 86, 4, '/resource/images/products/1002.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Hairy', 'Dog3', 5, 7, '/resource/images/products/1003.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Fluffy', 'Cat1', 68, 3, '/resource/images/products/1004.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Cuddly', 'Cat2', 56, 1, '/resource/images/products/1005.jpg');	
INSERT INTO product (details, tag, title, price, quantity, image) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'Mad', 'Cat3', 9, 4, '/resource/images/products/1006.jpg');
