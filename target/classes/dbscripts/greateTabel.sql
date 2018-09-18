USE test;

DROP TABLE IF EXISTS part;

CREATE TABLE part(
  id INT(10) NOT NULL AUTO_INCREMENT,
  name VARCHAR(100),
  necessary BOOLEAN,
  quantity INT(3),
  PRIMARY KEY (id))

  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO part (name, necessary, quantity) VALUES
  ("материнская плата", TRUE, 10),
  ("звуковая плата", FALSE, 3),
  ("процессор", TRUE ,6),
  ("корпус", TRUE, 3),
  ("клавиатура", FALSE, 90),
  ("мышка", FALSE, 6),
  ("оперативная память", TRUE, 5),
  ("кулер", FALSE, 13),
  ("принтер", FALSE, 10),
  ("видео карта", TRUE, 10),
  ("сетевой роутер", FALSE, 11),
  ("бумага А4", FALSE, 4),
  ("монитор", FALSE, 25),
  ("карта памяти", FALSE, 14),
  ("CD-ROM", FALSE, 7),
  ("DVD-ROM", TRUE, 5),
  ("блок питания", TRUE, 6),
  ("подсветка", FALSE, 1),
  ("HHD диск", TRUE, 7),
  ("домашний кинотеатр", FALSE, 22),
  ("проектор", FALSE, 95),
  ("колонки", FALSE, 5),
  ("SDD диск", FALSE, 9)
;