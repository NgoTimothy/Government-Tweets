CREATE TABLE `users` (
  `screen_name` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `sub_category` varchar(40) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `ofstate` varchar(20) DEFAULT NULL,
  `numFollowers` int(11) DEFAULT NULL,
  `numFollowing` int(11) DEFAULT NULL,
  PRIMARY KEY (`screen_name`)
);

CREATE TABLE `tweets` (
  `tid` bigint(11) NOT NULL,
  `textbody` text,
  `retweet_count` int(11) DEFAULT NULL,
  `retweeted` tinyint(1) DEFAULT NULL,
  `posted` datetime DEFAULT NULL,
  `posting_user` varchar(40) NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `FK01_idx` (`posting_user`),
  CONSTRAINT `FK01` FOREIGN KEY (`posting_user`) REFERENCES `users` (`screen_name`)
);

CREATE TABLE `tagged` (
  `tid` bigint NOT NULL,
  `hastagname` varchar(60) NOT NULL,
  PRIMARY KEY (`tid`,`hastagname`),
  CONSTRAINT `FK04` FOREIGN KEY (`tid`) REFERENCES `tweets` (`tid`)
);

CREATE TABLE `group20b`.`urlusedd` (
  `tid` INT NOT NULL,
  `url` VARCHAR(512) NOT NULL,
  PRIMARY KEY (`tid`, `url`),
  CONSTRAINT `tid` FOREIGN KEY (tid) REFERENCES `group20b`.`tweets` (tid)
);

ALTER TABLE `group20b`.`tagged` 
ADD INDEX `hashtag` (`hastagname` ASC) VISIBLE;

ALTER TABLE `group20b`.`tweets` 
ADD INDEX `posting` (`posting_user` ASC) VISIBLE;

ALTER TABLE `group20b`.`tweets` 
ADD INDEX `hposted` (`posted` ASC) VISIBLE;

ALTER TABLE `group20b`.`urlused` 
ADD INDEX `url` (`url` ASC) VISIBLE;

ALTER TABLE `group20b`.`users` 
ADD INDEX `sub_category` (`sub_category` ASC) VISIBLE;

ALTER TABLE `group20b`.`users` 
ADD INDEX `ofstate` (`ofstate` ASC) VISIBLE;

