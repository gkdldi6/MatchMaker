-- -----------------------------------------------------
-- Schema matchmaker
-- -----------------------------------------------------
drop database matchmaker;
DROP TABLE IF EXISTS grade_code ;
DROP TABLE IF EXISTS user ;
DROP TABLE IF EXISTS board_code ;
DROP TABLE IF EXISTS board ;
DROP TABLE IF EXISTS article ;
DROP TABLE IF EXISTS notice ;
DROP TABLE IF EXISTS reference ;
DROP TABLE IF EXISTS free ;
DROP TABLE IF EXISTS reply ;
DROP TABLE IF EXISTS admin ;
DROP TABLE IF EXISTS player ;
DROP TABLE IF EXISTS message ;
-- -----------------------------------------------------
-- Schema matchmaker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS matchmaker DEFAULT CHARACTER SET utf8 ;
USE matchmaker ;

-- -----------------------------------------------------
-- Table grade_code
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS grade_code (
  code_type VARCHAR(45) NOT NULL,
  code VARCHAR(45) NOT NULL,
  code_type_value VARCHAR(45) NULL,
  code_value VARCHAR(45) NULL,
  grade_score VARCHAR(45) NULL,
  PRIMARY KEY (code_type, code));



-- -----------------------------------------------------
-- Table board_code
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS board_code (
  code INT NOT NULL,
  code_value VARCHAR(45) NULL,
  PRIMARY KEY (code));


-- -----------------------------------------------------
-- Table board
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS board (
  bno INT NOT NULL,
  board_code INT NOT NULL,
  board_intro VARCHAR(45) NULL,
  PRIMARY KEY (bno)
  );


-- -----------------------------------------------------
-- Table article
-- -----------------------------------------------------

drop table article;
CREATE TABLE IF NOT EXISTS article (
  bno INT not null,
  ano INT NOT NULL,
  title VARCHAR(45) NULL,
  writer VARCHAR(45) NULL,
  content VARCHAR(45) NULL,
  regdate VARCHAR(45) NULL,
  hit VARCHAR(45) NULL,
  replycnt VARCHAR(45) NULL,
  article_type VARCHAR(45) NULL,
  PRIMARY KEY (ano, bno)
  );

alter table article modify bno int auto_increment;

-- -----------------------------------------------------
-- Table admin
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS admin (
  id INT NOT NULL,
  pw VARCHAR(45) NULL,
  auth VARCHAR(45) NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table player
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS player (
  id VARCHAR(45) NOT NULL,
  age VARCHAR(45) NULL,
  sex VARCHAR(45) NULL,
  height VARCHAR(45) NULL,
  weight VARCHAR(45) NULL,
  position VARCHAR(45) NULL,
  gamecnt VARCHAR(45) NULL,
  wincnt VARCHAR(45) NULL,
  basketball_code VARCHAR(45) NULL,
  basketpoint VARCHAR(45) NULL,
  trustpoint VARCHAR(45) NULL,
  PRIMARY KEY (id)
  );


-- -----------------------------------------------------
-- Table message
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS message (
  sendid VARCHAR(45) NOT NULL,
  targetid VARCHAR(45) NOT NULL,
  senddate VARCHAR(45) NOT NULL,
  msgtext VARCHAR(45) NULL,
  readdate VARCHAR(45) NULL,
  PRIMARY KEY (sendid, targetid, senddate)
);

-- -----------------------------------------------------
-- Table user
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS user (
  id VARCHAR(45) NOT NULL,
  pw VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  regdate VARCHAR(45) NULL,
  name VARCHAR(45) NULL,
  user_code VARCHAR(45) NULL,
  userpoint VARCHAR(45) NULL,
  PRIMARY KEY (id)
    );  

-- -----------------------------------------------------
-- Table notice
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS notice (
  bno INT NOT NULL,
  ano VARCHAR(45) NOT NULL,
  deadline VARCHAR(45) NULL,
  PRIMARY KEY (bno, ano));



-- error to forward

-- -----------------------------------------------------
-- Table reference
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS reference (
  bno INT NOT NULL,
  ano INT NOT NULL,
  fullname VARCHAR(45) NULL,
  regdate VARCHAR(45) NULL,
  PRIMARY KEY (bno, ano)
  );


-- -----------------------------------------------------
-- Table free
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS free (
  bno INT NOT NULL,
  ano INT NOT NULL,
  liked VARCHAR(45) NULL,
  PRIMARY KEY (bno, ano)
  );


-- -----------------------------------------------------
-- Table reply
-- -----------------------------------------------------

use matchmaker;
drop table reply;
CREATE TABLE IF NOT EXISTS reply (
  bno INT NOT NULL,
  rno INT auto_increment primary key,
  ano INT NOT NULL,
  replyer VARCHAR(45) NULL,
  replytext VARCHAR(45) NULL,
  regdate VARCHAR(45) NULL
);

drop table reply;

alter table reply modify rno int auto_increment;


show tables;

insert into article (bno, ano, title, content, writer)
		values(2, 1, '111', '111', '111');
        
select * from article;

		select *
		from article order by
		bno desc;
        
update article set title = 'ㅠㅠ', content =
		'11', writer = '22', regdate = now()
		where bno = 2;
        
SET SQL_SAFE_UPDATES=0;

		select * from article
		where bno = 2;

		select * from reply
		where bno = 2;

		insert into reply (bno, ano, 
		replytext, replyer)
		values
		(2, 1,  'kkk', 'kkk');
