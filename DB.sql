drop database matchmaker;

create database matchmaker;

use matchmaker;

drop table user;
-- 유저 테이블
create table user (
	userid varchar(50) not null, 
	userpw varchar(50) not null, 
	username varchar(50) not null, 
	email varchar(100) not null, 
	regdate timestamp default now(),
	userage int,
	userinfo text,
	primary key(userid)
);

select * from user;

insert into user(userid,userpw,username,email,regdate,userage,userinfo) values('1234','1234','김선중','sunjoong91@naver.com',now(),11,'ㅅㅅㅅㅅ');
insert into user(userid,userpw,username,email,regdate,userage,userinfo) values('sunjoong91','1234','김선중','sunjoong91@naver.com',now(),11,'ㅅㅅㅅㅅ');

-- 자유게시판 테이블
create table freeboard (
	bno int not null auto_increment, -- 게시판 번호
	title varchar(200) not null, -- 게시판 제목
	content text,  -- 게시판 내용
	writer varchar(50) not null references user (username), -- 게시판 작성자
	regdate timestamp not null default now(), -- 게시판 작성일
	hit int default 0, -- 게시판 조회수
	replycnt int not null default 0, -- 댓글수
	primary key (bno)
);

select * from freeboard;


-- 댓글 테이블
create table freereply(
	rno int not null auto_increment,
	bno int not null references freeboard (bno),
	replytext varchar(500) not null,
	replyer varchar(50) not null references user (username),
	regdate timestamp not null default now(),
	primary key(rno)
);