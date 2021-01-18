TRUNCATE `holiday`.american;

INSERT INTO `holiday`.american (id, name, mes, dia)
VALUES
(default, 'New Years', 1, 1),
(default, 'Independence', 7, 4),
(default, 'Veterans', 11, 11),
(default, 'Christmas', 12, 25);

GRANT ALL PRIVILEGES ON `holiday`.* TO 'maria'@'%';
FLUSH PRIVILEGES;
