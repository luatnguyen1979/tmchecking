/*insert role data*/
INSERT INTO `cs544`.`role` (`id`, `name`) VALUES ('1', 'admin');
INSERT INTO `cs544`.`role` (`id`, `name`) VALUES ('2', 'counselor');
INSERT INTO `cs544`.`role` (`id`, `name`) VALUES ('3', 'customer');

/*insert person data*/
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('1', 'thanhnguyen@mum.edu', 'Tri', 'Nguyen');
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('2', 'magrawal@mum.edu', 'Madhuri', 'Agrawal');
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('3', 'dtewelde@mum.edu', 'Daniel', 'Tewelde');
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('4', 'ngotieptuyen@gmail.com', 'Tuyen', 'Ngo');
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('5', 'adovaasureu@mum.edu', 'Amartuvshin', 'Dovaasureu');
INSERT INTO `cs544`.`person` (`id`, `email`, `first_name`, `last_name`) VALUES ('6', 'psalek@mum.edu', 'Payman', 'Salek');

/*insert user data*/
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'tri', '1'); 
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'madhuri', '2');
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'daniel', '3');
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'tuyen', '4');
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'amar', '5');
INSERT INTO `cs544`.`user` (`password`, `username`, `person_id`) VALUES ('$2a$10$yAGWPDNo1Vg.Yu106sXQE.4xQrLUAbTZNh2PqykqvSWMqQGNOIWQm', 'professor', '6');

/*insert person_roles data*/
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('1', '3');
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('2', '2');
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('3', '1');
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('4', '1');
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('5', '3');
INSERT INTO `cs544`.`person_roles` (`person_id`, `roles_id`) VALUES ('6', '2');

/*insert location data*/
INSERT INTO `cs544`.`location` (`id`, `building`, `room`) VALUES ('1', 'Verill', 'V29');
INSERT INTO `cs544`.`location` (`id`, `building`, `room`) VALUES ('2', 'Verill', 'V47');
INSERT INTO `cs544`.`location` (`id`, `building`, `room`) VALUES ('3', 'Library', 'L09');
INSERT INTO `cs544`.`location` (`id`, `building`, `room`) VALUES ('4', 'Library', 'L10');

/*insert session*/
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('1', '1', '2017-11-28', '15', '12:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('2', '1', '2017-11-28', '15', '15:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('3', '3', '2017-11-28', '15', '12:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('4', '3', '2017-11-28', '15', '15:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('5', '1', '2017-11-29', '15', '12:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('6', '1', '2017-11-29', '15', '15:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('7', '3', '2017-11-29', '15', '12:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('8', '3', '2017-11-29', '15', '15:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('9', '1', '2017-11-30', '15', '12:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('10', '1', '2017-11-30', '15', '15:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('11', '3', '2017-11-30', '15', '12:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('12', '3', '2017-11-30', '15', '15:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('13', '1', '2017-12-01', '15', '12:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('14', '1', '2017-12-01', '15', '15:15:00', '2', '1');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('15', '3', '2017-12-01', '15', '12:15:00', '2', '2');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('16', '3', '2017-12-01', '15', '15:15:00', '2', '2');

INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('17', '5', '2017-11-28', '15', '12:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('18', '5', '2017-11-28', '15', '15:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('19', '5', '2017-11-28', '15', '12:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('20', '5', '2017-11-28', '15', '15:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('21', '5', '2017-11-29', '15', '12:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('22', '5', '2017-11-29', '15', '15:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('23', '5', '2017-11-29', '15', '12:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('24', '5', '2017-11-29', '15', '15:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('25', '5', '2017-11-30', '15', '12:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('26', '5', '2017-11-30', '15', '15:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('27', '5', '2017-11-30', '15', '12:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('28', '5', '2017-11-30', '15', '15:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('29', '5', '2017-12-01', '15', '12:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('30', '5', '2017-12-01', '15', '15:15:00', '6', '3');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('31', '5', '2017-12-01', '15', '12:15:00', '6', '4');
INSERT INTO `cs544`.`session` (`id`, `capacity`, `date`, `duration`, `time`, `counselor_id`, `location_id`) VALUES ('32', '5', '2017-12-01', '15', '15:15:00', '6', '4');


/*INSERT INTO `cs544`.`appointment` (`id`, `created_date`, `reminder`, `creator_id`, `person_id`, `session_id`) VALUES ('1', '2017-11-20 10:02:32', '0', '1', '2', '1');*/

